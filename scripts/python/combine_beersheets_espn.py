import argparse
import csv
import re

def make_key_variations(name, pos):
    return [
        f"{name}_{pos}",
        f"{name} Jr_{pos}",
        f"{name} II_{pos}",
        f"{name} III_{pos}"
    ]

def fix_dumb_key_discrepencies(key):
    return {
        "Mitchell Trubisky_QB": "Mitch Trubisky_QB",
        "Eno Ben_RB":           "Eno Benjamin_RB",
        "Gabriel Davis_WR":     "Gabe Davis_WR",
        "Olabisi Johnson_WR":   "Bisi Johnson_WR"
    }.get(key) or key

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--beer", type=argparse.FileType('r'), required=True)
    parser.add_argument("--espn", type=argparse.FileType('r'), required=True)
    args = parser.parse_args()

    # process beer data
    beer_reader = csv.reader(args.beer)
    next(beer_reader) # skip header
    beer_data = []
    for row in beer_reader:
        # name, pos, team, auction_value
        value = int(row[3])
        value = value if value > 0 else 1 # beersheet values can go negative
        beer_data.append({
            "name": row[0],
            "pos": row[1],
            "team": row[2].split("/")[0],
            "auction_value": str(value)
        })

    # process espn data
    espn_reader = csv.reader(args.espn)
    next(espn_reader) # skip header)
    espn_data = {}
    strip_pattern = re.compile('[^a-zA-Z0-9\-_ ]')
    for row in espn_reader:
        # name, espn_id, pos, auction_value
        # strip non-alphanumeric because that's what beersheets has
        name = row[0]
        cleaned_name = re.sub(strip_pattern, '', name)
        key = f"{cleaned_name}_{row[2]}"

        if key in espn_data:
            raise Exception(f"Found dupe player_pos {key}, now you gotta deal with teams")
        value = int(row[3])
        value = value if value > 0 else 1 # normalize all 0s to 1s
        espn_data[key] = {
            "name": row[0],
            "pos": row[2],
            "auction_value": str(value)
        }

    # combine espn values into beer data
    for player in beer_data:
        keys_to_search = make_key_variations(player['name'], player['pos'])
        try:
            matching_key = [key for key in keys_to_search if key in espn_data][0]
        except IndexError:
            matching_key = fix_dumb_key_discrepencies(f"{player['name']}_{player['pos']}")
            if matching_key not in espn_data:
                raise Exception(f"Couldn't find {matching_key} in ESPN data")
        player["espn_value"] = espn_data[matching_key]["auction_value"]

    for player in beer_data:
        print("\t".join(player.values()))
