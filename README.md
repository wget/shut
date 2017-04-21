# shut - a simple shell utility library

*shut* stands for **shell utils**. It's a simple Bash 4+ shell lib gathering all common functions that could be used in common shell scripts. This file has been written for two main reasons: avoid reinventing the wheel when writing simple scripts and reduce the maintenance cost of these scripts and their footprints (memory and execution time).

The functions are based on the syntax of the PHP language and tries to mimic these function as much as possible (PCRE not supported).

## Usage

This lib is intended to be used exlusively with the shell Bash. While most of the functions should work on Bash versions 3.2 and onwards, some functions are only compatible with Bash 4+.

This library has to be used as a git submodule. Then, it is rather common to symlink the `.sh` file to the name you want to be used in your own script.

    $ ln -s shut/utils.sh yourFilename.sh

Your script then needs to load the content of this lib using the following line:

    . "${0%/*}/yourFilename.sh"

It needs to be loaded with a `./` otherwise Bash will search in the PATH and may not find the file. So use `source ./utils.sh` and not `source utils.sh`.

Using `${PWD}` does not work either if the script is not run from its working directory. If you are in our home for example, and you want to execute the script `~/Downloads/myScript.sh` (*shut* is then in the same `Downloads` folder, alongside `myScript.sh`), `${PWD}` will return `/home/$USER/` which does not contain the lib. This is why the lib needs to be loaded with `. ${0%/*}/utils.sh`.

Also, please note that taking the absolute directory does not work either when using debugging tools like `bashdb` as the latter resets that path to `/bin`, because in this use case, `$0` corresponds to `/bin/bashdb`.

## Function calls

Functions returning boolean values must be used directly e.g.: "if isArgument "--dest"; then".

If the function returns `true` or `false` in retval, you can use this value as well as it:

    isArgument "--dest"
    if $retval; then

## Return statements

In shell scripts, returning values from a function requires to use echo and subshells specified with the `$( )` or `` `` syntaxes (e.g.: `returnStatement=$(myFunction "args")`). Also, exiting from these subshells does not propagate to the parent shell.

This is why this library uses a global variable called `retval` to return elements from a function. `retval` must be reset or initialized in each function using that variable. Even if that global variable violates programming concepts, the global variable avoids the aforementionned subshells (offering thus way better performance as forks are avoided) and propagates returns properly.

Please note this is your reponsibility and in your sake interest to manage the allocation/deallocation of the `retval` value.

## Trivia

The name of this project was found unwittingly as I wanted a name as short as possible, easy to type. *shut* can be considered as a play on words with regard to the license under which this project is licensed (shut/closed proprietary software).

Others might think I called this project like this because I didn't want people to know I reimplemented much of the PHP features in pure Bash and I felt shameful about it. But isn't. Or maybe they are right...

## License

This software is licensed under the terms of the GNU General Public License v3.0.

