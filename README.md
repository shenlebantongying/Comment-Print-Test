# Comment-Print-Test (cpt)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

A simple __[suckless](https://suckless.org/philosophy/)__ unit testing utility for __every programming languages__ that can `comment` and `print`!

It currently has two implementation: Python and Tcl.

## Usage
Step 1: __Comment__ your testing subroutines inside a __Print__ like this:

```C
// [[ NICE ]] <- Put print result inside double brackets
printf(your_function_that_return_NICE_with(some_args));

// [[ Another NICE]]
console.lgo ("NICE");
```
Step 2: Input your source and __test__ executable to the script.

```bash
cpt.py -s source_code.c -c command_to_run_it.exe
```
Step 3: Enjoy!

There are [/samples](./samples), the result should be
```c
[Total 3 tests]
[0/3]=> printf("%d\n",add(1,2));
[1/3]=> printf("%s",a_function_that_will_fail(1));
[!Failed@line 17]printf("%s",a_function_that_will_fail(1));
[2/3]=> printf("%s","NICE and MORE NICE\n");
[1/3 failed!]
```

## F.A.Q.

### Why?

I regularly try a new languages for fun. However, almost every [unit testing suite](https://en.wikipedia.org/wiki/List_of_unit_testing_frameworks) (xUnit) is __crap__ which heavily hack the language itself for a simple functionality: `Call a subroutine/function → Check the result`.

Name a few:

* JUnit -> Half of the functionalities is "enterprises-ish" but useless. There are even WTF like [Disabling Tests](https://junit.org/junit5/docs/current/user-guide/#writing-tests-disabling)! Why not just comment out the code to disable.
* GoogleTest -> Half of the [document](https://google.github.io/googletest/) is about the quirks of C++++++++++++ plus [more quirks of the framework itself](https://chromium.googlesource.com/external/github.com/google/googletest/+/refs/tags/release-1.8.1/googletest/docs/faq.md). You can write test to the perfection level in the scene of C++++++++++++, but what's the point?
* OCaml Dune -> Introduce an alien language `ppx`, manipulating the AST of OCaml for test!
* Anything named like xUnit is probably crap!

### Why there are no test description/id like xUnit?

If you know the line number, just go there, read the test code. If you cannot understand your test by subroutine name, then your naming suck. If you need more info, just put some comments around it.

The xUnit frameworks use the language itself and operate inside the source code, so they usually cannot know the exact line number for a test. The need to add a text id/description is just __useless__ technical wart.

### How to test multiple files?

Just write a shell script to invoke the tests for each file, either in loop or in parallel! You have full control over the details.

Why a test framework has to built with a program launcher? A small management system? The build system have to carry a whole stack of "TESTING"? Maybe someday they will add phone call functionality to trigger by SMS!

### Why no handling if a test failed?

Your language is supposed to be able to handle failed runtime error, rather than by a testing framework. If it doesn't, it sucks.

### Why no way to change test execution order?

Does your programming language execute in a random order??

### Why no cross-platform support?

Why you mix test codes form 3+ platform in the first place?  just split them into `test-windows`,`test-linux`.

### Your script is too simple to be useful!

IDC, feel #cute.

### Does It Scale?

Maybe Yes!

### The One True License?

[YES!](./LICENSE)