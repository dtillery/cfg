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

import asyncio
from typing import Annotated, TYPE_CHECKING

from cyclopts import App, Parameter
from cyclopts.types import ExistingDirectory, File
from samsungtvws.async_art import SamsungTVAsyncArt

if TYPE_CHECKING:
    from pathlib import PosixPath

FRAME_IP: str = "192.168.0.83"
UPLOADED_CATEGORY_ID: str = "MY-C0002"

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
                print(f"\t{art['content_id']} ({art['category_id']}: {art.get('matte_id')})")
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
        content_ids = [art["content_id"] for art in all_art if art["category_id"] == UPLOADED_CATEGORY_ID]
        await tv.delete_list(content_ids)
    except Exception as e:
        print(f"Error: {e}")
    finally:
        await tv.close()


@app.command
async def upload(sync_dir: ExistingDirectory ) -> None:
    tv = SamsungTVAsyncArt(FRAME_IP)
    await tv.start_listening()
    try:
        valid_filetypes = ("*.jpg", "*.jpeg")
        filepaths: list[PosixPath] = []
        for files in valid_filetypes:
            filepaths.extend(sync_dir.glob(files, case_sensitive=False))

        for filepath in filepaths:
            print(f"Uploading {filepath}...")
            with open(filepath, "rb") as f:
                data = f.read()
            file_type = filepath.suffix[1:]
            content_id = await tv.upload(data, file_type=file_type, matte="none")
            print(f"Uploaded as {content_id}")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        await tv.close()


@app.command
async def sync(sync_dir: ExistingDirectory, sync_file: File) -> None:
    print(sync_file)



if __name__ == "__main__":
    app()
