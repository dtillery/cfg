import itertools
import json
import os
from pathlib import Path
import requests
import sys


DOWNLOAD_DIR = "music"

KK_SONG_LIST_PATH = f"{DOWNLOAD_DIR}/kksongs.json"
KK_VERSIONS = [
    "live",
    "aircheck"
]

BASE_URL = "https://acmusicext.com/static"

GAMES = [
    "animal-crossing",
    "wild-world",
    "new-leaf",
    "new-horizons"
]

WEATHERS = [
    "sunny",
    "raining",
    "snowing"
]

HOURLY_SONGNAMES = list(itertools.chain(*[(f"{i}am", f"{i}pm") for i in range(1,13)]))

def make_download_dir():
    Path(DOWNLOAD_DIR).mkdir(exist_ok=True)


def download(url, filepath, filename, redownload=False):
    fullpath = f"{DOWNLOAD_DIR}/{filepath}/{filename}"
    print(f"Downloading {url} to {fullpath}")
    if os.path.exists(fullpath) and not redownload:
        print(f"Already Downloaded, skipping...")
        return

    response = requests.get(url, stream=True)
    if not response.ok:
        print(f"ERROR {response.status_code}: {response.reason}")
        return
    else:
        os.makedirs(f"{DOWNLOAD_DIR}/{filepath}", exist_ok=True)
        with open(fullpath, 'wb') as f:
            total = response.headers.get('content-length')
            if total is None:
                f.write(response.content)
            else:
                downloaded = 0
                total = int(total)
                for data in response.iter_content(chunk_size=max(int(total/1000), 1024*1024)):
                    downloaded += len(data)
                    f.write(data)
                    done = int(50*downloaded/total)
                    sys.stdout.write('\r[{}{}]'.format('█' * done, '.' * (50-done)))
                    sys.stdout.flush()
    sys.stdout.write('\n')


def download_hourly_music():
    urls = []
    for game in GAMES:
        for weather in WEATHERS:
            for song in HOURLY_SONGNAMES:
                path = f"{game}/{weather}"
                filename = f"{song}.ogg"
                download_url = f"{BASE_URL}/{path}/{filename}"
                download(download_url, path, filename)


def get_kk_songs():
    with open(KK_SONG_LIST_PATH, "rb") as f:
        return json.load(f)


def download_kk_songs():
    kk_songs = get_kk_songs()
    for version in KK_VERSIONS:
        for song in kk_songs:
            path = f"kk/{version}"
            filename = f"{song}.ogg"
            download_url = f"{BASE_URL}/{path}/{filename}"
            download(download_url, path, filename)


def download_music():
    download_hourly_music()
    download_kk_songs()


if __name__ == '__main__':
    make_download_dir()
    download_music()
