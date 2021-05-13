#!/usr/bin/env python3
"""
Copyright (c) 2021 shenlebantongying
"""

import re
import os
import argparse
from itertools import count

if __name__ == "__main__":
    args_parser = argparse.ArgumentParser()
    args_parser.add_argument('-s', '--source',  type=str,
                             help='Source code to Scan')
    args_parser.add_argument('-c', '--command', type=str,
                             help='Command to run')
    args = vars(args_parser.parse_args())

    expected, result = [], []

    with open(args["source"]) as file:
        for line_number, line in zip(count(2), file):
            p = re.search(r'\[\[(.*)\]\]', line)
            if p is not None:
                expected.append({"line_number": str(line_number), "result": p.group(1).strip()})

    for x in os.popen(args["command"]).read().split("\n"):
        if x != "":
            result.append(x)

    failed=False

    if len(expected) == len(result):
        for i in range(len(expected)):
            if expected[i]["result"] == result[i]:
                continue
            else:
                failed=True
                print("[Failed!] @ Line " + expected[i]["line_number"])
    else:
        print("[Failed!] Test and output lines doesn't match.")

    if not failed: print("Passed!")
