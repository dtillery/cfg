from collections import deque
import random


class Division:
    teams = []

    def __init__(self, teams):
        self.teams = teams

    def create_matchups(self, weeks=1):
        randomized_teams = self.teams[:]
        random.shuffle(randomized_teams)
        if len(randomized_teams) % 2 != 0:
            randomized_teams.append("BYE")

        # round-robin circle scheduling
        mid = len(randomized_teams) // 2
        top, bottom = deque(randomized_teams[:mid]), deque(randomized_teams[mid:])
        for week in range(weeks):
            matchups = zip(top, bottom)
            self._print_matchups(matchups, week+1)
            bottom.append(top.pop())
            top.insert(1, bottom.popleft())

    def _print_matchups(self, matchups, week):
        matchups_str = "\n".join([f"{m[0].title()} @ {m[1].title()}" for m in matchups])
        print(f"Week {week}:\n---------------\n{matchups_str}\n")


EAST = Division([
    "uhhs",
    "brodudes",
    "lowlifes",
    "lamar",
    "picks",
    "kicks"
])

WEST = Division([
    "spycam",
    "herban",
    "drudru",
    "merril",
    "haters",
    "kholes"
])

NUM_MATCHUPS = 3


if __name__ == '__main__':
    print(f"Creating matchups for {NUM_MATCHUPS} weeks!\n")

    print(f"=== Middle East ===")
    EAST.create_matchups(NUM_MATCHUPS)

    print(f"=== Midwest ===")
    WEST.create_matchups(NUM_MATCHUPS)
