from collections import deque
import random


class Division:
    teams: list[str] = []

    def __init__(self, teams: list[str], total_weeks: int) -> None:
        self.teams = teams
        self.total_weeks = total_weeks

    def create_matchups(self, matchups=1) -> None:
        randomized_teams = self.teams[:]
        random.shuffle(randomized_teams)
        if len(randomized_teams) % 2 != 0:
            randomized_teams.append("BYE")

        # round-robin circle scheduling
        mid = len(randomized_teams) // 2
        top, bottom = deque(randomized_teams[:mid]), deque(randomized_teams[mid:])
        for week in range(self.total_weeks-matchups, self.total_weeks):
            matchups = zip(top, bottom)
            self._print_matchups(matchups, week+1)
            bottom.append(top.pop())
            top.insert(1, bottom.popleft())

    def _print_matchups(self, matchups, week) -> None:
        matchups_str = "\n".join([f"{m[0].title()} @ {m[1].title()}" for m in matchups])
        print(f"Week {week}:\n---------------\n{matchups_str}\n")

TOTAL_WEEKS = 14

EAST = Division([
    "upper_west_side_uhhs",
    "murray_hill_puking_brodudes",
    "false_sharts",
    "tank_you_very_much",
    "crown_depths_artisanl_picks",
    "midtowndrafters"
], TOTAL_WEEKS)

WEST = Division([
    "sorority_spycam",
    "fraud_city",
    "stroudy_with_a_chance_of_pain",
    "merril_hoges_fundamentals",
    "president_st_haters",
    "flatbush_kholes"
], TOTAL_WEEKS)

NUM_MATCHUPS = 3

if __name__ == '__main__':
    print(f"Creating matchups for {NUM_MATCHUPS} weeks!\n")

    print(f"=== Middle East ===")
    EAST.create_matchups(NUM_MATCHUPS)

    print(f"=== Midwest ===")
    WEST.create_matchups(NUM_MATCHUPS)
