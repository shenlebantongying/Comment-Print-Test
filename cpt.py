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
    args_parser.add_argument('-s', '--source', type=str, required=True,
                             help='Source code to Scan')

    args_parser.add_argument('-c', '--command', type=str, required=True,
                             help='Command to run')

    args = vars(args_parser.parse_args())
    source  = args["source"]
    command = args["command"]

    expected_result = list(filter(None, os.popen(args["command"]).read().split("\n")))
    source_file=open(args["source"]).readlines()

    test_total=len(expected_result)
    test_number=0
    failed = 0

    print(r'[Total {} tests]'.format(test_total))

    for line_number, line in zip(count(0), source_file):
        p = re.search(r'\[\[(.*)\]\]', line)
        if p is not None:

            print(r'[{a}/{b}]=>'.format(a=test_number+1,b=test_total), source_file[line_number+1].strip())

            if p.group(1).strip() != expected_result[test_number]:
                failed += 1
                print("[!Failed@line " + str(line_number+2) + "]" + source_file[line_number+1].strip())
            test_number += 1
    if failed==0:
        print("[Passed!]")
    else:
        print("[{a}/{b} failed!]".format(a=failed,b=test_total))
