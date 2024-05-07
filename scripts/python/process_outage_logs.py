#!/usr/bin/env python

import argparse
import csv
import datetime
import itertools
import os
from pathlib import Path


class NetworkLoggerOutageLogProcessor:
    log_prefixes = ["Network Up.", "Connection Outage Detected"]
    log_datetime_fmt = "%b %d %I:%M:%S %p"

    def __init__(self, filepaths, output):
        if not isinstance(filepaths, list):
            raise ValueError("filepaths must be a list")
        self.filepaths = filepaths
        self.output = output
        self.now = datetime.datetime.now()

    def process(self):
        outage_data = self._process_files(self.filepaths)
        self._write_data(outage_data, self.output)

    def _process_files(self, filepaths):
        files   = self._open_files(filepaths)
        lines   = self._read_lines(files)
        groups  = self._group(lines)
        groups  = self._filter(groups)
        outages = self._combine(groups)
        return outages

    def _open_files(self, filepaths):
        for filepath in filepaths:
            for path in Path().rglob(filepath):
                self._log(f"Opening {path}")
                with open(path, "r", encoding="utf16") as f:
                    yield f

    def _read_lines(self, files):
        for f in files:
            yield from f

    def _group(self, lines):
        return (list(g) for k,g in itertools.groupby(lines, lambda x: x == "\n") if not k)

    def _filter(self, groups):
        return (g for g in groups if list(filter(g[1].startswith, self.log_prefixes)) != [])

    def _combine(self, groups):
        for group in groups:
            try:
                next_group = next(groups)
            except StopIteration:
                raise ValueError("Did not get expected number of log lines")
            else:
                yield self._process_logs(next_group, group)

    def _process_logs(self, outage_start_msgs, outage_end_msgs):
        logs = {}
        logs.update(self._process_outage_start(outage_start_msgs))
        logs.update(self._process_outage_end(outage_end_msgs))
        logs.update(self._calculate_duration(logs))
        return logs

    def _process_outage_start(self, msgs):
        return {
            "start": datetime.datetime.strptime(msgs[0].strip(), self.log_datetime_fmt).replace(year=self.now.year)
        }

    def _process_outage_end(self, msgs):
        return {
            "end": datetime.datetime.strptime(msgs[0].strip(), self.log_datetime_fmt).replace(year=self.now.year)
        }

    def _calculate_duration(self, logs):
        start = logs['start']
        end = logs['end']
        return {
            "duration": (end - start).seconds
        }

    def _write_data(self, outages, output_filename):
        with open(output_filename, "a") as f:
            writer = csv.writer(f)
            for outage in outages:
                writer.writerow([outage.get("start"), outage.get("end"), outage.get("duration")])

    def _log(self, message):
        print(f"=== {message}")


if __name__ == "__main__":
    runtime = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M%:%S")

    parser = argparse.ArgumentParser()
    parser.add_argument("-o", "--output",
        default=f"outage_logs_{runtime}.csv",
        help="Filename for csv output. Existing files will be appended to."
    )
    parser.add_argument("paths", metavar="filepaths", nargs="+", help="Paths to file(s) to be processed")

    args = parser.parse_args()

    processor = NetworkLoggerOutageLogProcessor(args.paths, args.output)
    processor.process()
