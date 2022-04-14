# takes a Merrill Lynch CSV and splits and totals cap gains before and after a split date
# useful if you were a part time resident of any states during a year.

import argparse
import csv
import datetime
import pathlib

class Transaction:
    _transaction_details = None
    _known_transaction_types = ["SHORT", "LONG", "OTHER"]
    transaction_type = None
    date_sold = None
    gain = None

    def __init__(self, transaction_details):
        self._transaction_details = transaction_details
        self.transaction_type = self._get_transaction_type()
        self.date_sold = self._get_date_sold()
        self.gain = self._get_gain()

    def _get_transaction_type(self):
        details_type = self._transaction_details[0].split()[0]
        if details_type not in self._known_transaction_types:
            raise TypeError(f"Unknown transaction type: {details_type}")
        return details_type

    def _get_date_sold(self):
        return datetime.datetime.strptime(self._transaction_details[5], "%m/%d/%y").date()

    def _get_gain(self):
        return float(self._transaction_details[10])



if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--path", type=pathlib.Path)
    parser.add_argument("--split_date", type=datetime.date.fromisoformat)
    args = parser.parse_args()

    transactions = []
    with open(args.path) as f:
        reader = csv.reader(f)
        # skip header
        next(reader, None)
        for row in reader:
            transactions.append(Transaction(row))

    print(f"Deterining pre and post split gains from {args.split_date}")
    pre_split_gains, post_split_gains = 0, 0
    for trans in transactions:
        if trans.date_sold < args.split_date:
            # print(F"PRE-MOVE {trans.transaction_type}, {trans.date_sold}, {trans.gain}")
            pre_split_gains += trans.gain
        else:
            # print(F"POST-MOVE {trans.transaction_type}, {trans.date_sold}, {trans.gain}")
            post_split_gains += trans.gain

    print(f"Pre-Split Gains: {pre_split_gains}")
    print(f"Post-Split Gains: {post_split_gains}")
    print(f"Total Gains: {pre_split_gains + post_split_gains}")
