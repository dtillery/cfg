# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "cyclopts",
#     "samsungtvws"
# ]
#
# [tool.uv.sources]
# samsungtvws = { git = "https://github.com/NickWaterton/samsung-tv-ws-api" }
# ///

# uv run frame_art.py info
# Photos should be 4k resolution, 3840x2160. If this is off there may be matte issues.

import asyncio
import csv
from pathlib import PosixPath

from cyclopts import App
from cyclopts.types import ExistingDirectory, File
from samsungtvws.async_art import SamsungTVAsyncArt

FRAME_IP: str = "192.168.0.83"
UPLOADED_CATEGORY_ID: str = "MY-C0002"
UPLOAD_TIMEOUT: int = 60
VALID_FILETYPES = ("jpg", "jpeg")

app = App()


@app.command
async def info() -> None:
    tv = SamsungTVAsyncArt(FRAME_IP)
    await tv.start_listening()
    try:
        supported = await tv.supported()
        if supported:
            print("Art Mode supported!")
            tv_on = await tv.on()
            print(f"TV is on: {tv_on}")
            print(f"Art Mode: {tv.art_mode}")
            available_art = await tv.available()
            print(f"# Available Art: {len(available_art)}")
            for art in available_art:
                print(
                    f"\t{art['content_id']} ({art['category_id']}: {art.get('matte_id')})"
                )
            current_art = await tv.get_current()
            print(f"Current Art: {current_art}")
            art_settings = await tv.get_artmode_settings()
            print(f"Art Mode Settings:")
            for setting in art_settings:
                print(f"\t{setting['item']}: {setting['value']}")
            matte_list = await tv.get_matte_list(False)
            print(f"Matte Types: {", ".join([t['matte_type'] for t in matte_list])}")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        await tv.close()


@app.command
async def delete() -> None:
    tv = SamsungTVAsyncArt(FRAME_IP)
    await tv.start_listening()
    try:
        all_art = await tv.available()
        content_ids = [
            art["content_id"]
            for art in all_art
            if art["category_id"] == UPLOADED_CATEGORY_ID
        ]
        await tv.delete_list(content_ids)
    except Exception as e:
        print(f"Error: {e}")
    finally:
        await tv.close()


def get_valid_filepaths(src_dir: PosixPath) -> list[PosixPath]:
    filepaths: list[PosixPath] = []
    for filetype in VALID_FILETYPES:
        filepaths.extend(src_dir.glob(f"*.{filetype}", case_sensitive=False))
    return filepaths


async def upload_to_tv(
    tv: SamsungTVAsyncArt, path: PosixPath, matte: str = "none"
) -> str:
    with open(path, "rb") as f:
        data = f.read()
    file_type = path.suffix[1:]
    content_id = await tv.upload(
        data, file_type=file_type, matte=matte, timeout=UPLOAD_TIMEOUT
    )
    if not content_id:
        print(f"WARNING: No content_id returned, probable timeout for {path.name}")
    return content_id


@app.command
async def upload(sync_dir: ExistingDirectory) -> None:
    tv = SamsungTVAsyncArt(FRAME_IP)
    await tv.start_listening()
    try:
        filepaths = get_valid_filepaths(sync_dir)
        for i, filepath in enumerate(filepaths, start=1):
            print(f"Uploading #{i}: {filepath}...")
            content_id = await upload_to_tv(tv, filepath)
            print(f"Uploaded as {content_id}")
    except Exception as e:
        print(f"Error:")
        print(e)
    finally:
        await tv.close()


@app.command
async def sync(sync_dir: ExistingDirectory, sync_file: File) -> None:
    sync_file.touch(exist_ok=True)

    # read/create synced file records
    synced_file_records: dict[str, str] = {}
    with open(sync_file, "r") as f:
        reader = csv.DictReader(f)
        for row in reader:
            synced_file_records[row["filename"]] = row["content_id"]

    # get all valid files in sync dir
    filepaths = get_valid_filepaths(sync_dir)

    # determine content_ids to delete
    filenames = [p.name for p in filepaths]
    content_ids_to_delete: list[str] = []
    for synced_filename in list(synced_file_records.keys()):
        if synced_filename not in filenames:
            content_ids_to_delete.append(synced_file_records.pop(synced_filename))

    # determine new files to add
    files_to_upload: list[PosixPath] = []
    for filepath in filepaths:
        if filepath.name not in synced_file_records:
            files_to_upload.append(filepath)

    print(f"# Files to upload: {len(files_to_upload)}")
    print(f"# Files to delete: {len(content_ids_to_delete)}")

    tv = SamsungTVAsyncArt(FRAME_IP)
    await tv.start_listening()
    try:
        # delete content_ids
        print(f"Deleting Content with IDs: {content_ids_to_delete}")
        await tv.delete_list(content_ids_to_delete)

        # upload new files
        for i, filepath in enumerate(files_to_upload, start=1):
            print(f"Uploading #{i}: {filepath}...")
            content_id = await upload_to_tv(tv, filepath)
            if content_id:
                print(f"Uploaded as {content_id}")
                synced_file_records[filepath.name] = content_id
    except Exception as e:
        print(f"Error:")
        print(e)
    finally:
        await tv.close()

    # write updated sync records
    with open(sync_file, "w") as f:
        writer = csv.DictWriter(f, fieldnames=["filename", "content_id"])
        writer.writeheader()
        for filename, content_id in synced_file_records.items():
            writer.writerow({"filename": filename, "content_id": content_id})


if __name__ == "__main__":
    app()
