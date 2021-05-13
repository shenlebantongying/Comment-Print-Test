# Scan-Print-Test
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

A simple __[suckless](https://suckless.org/philosophy/)__ unit testing utility for __every programming languages__ that have `print` and `comment`!

## Usage
Step 1: Comment your source code like this:

```C
// Double bracket! [[ NICE ]]
printf(your_function_that_print_NICE_with(some_args));
```
Step 2: Input your source and test executable to the script

```bash
spt [-s source_code.c] [-c command_to_run_it.exe]
```
Step 3: Enjoy!

## Does It Scale?

Maybe Yes!

## The One True License?

[YES!](./LICENSE)

<!---
# Why?

I regularly try a new languages for fun. However, almost every [unit testing suite](https://en.wikipedia.org/wiki/List_of_unit_testing_frameworks) is bloated and overly engineered, and rely on hacking/magic of the language and the build system.

Unit testing is basically `(1) Call a subroutine/function` -> `(2) Check the reuslt`.

This script works perfectly for learning a new programming language, and you can just write all kind of codes and test if they give you the result you want. Rather than relearn same thing again and again.
-->
