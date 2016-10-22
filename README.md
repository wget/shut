# shut - a simple shell utility library

*shut* stands for **shell utils**. It's a simple shell lib gathering all common functions used in most of the shell scripts I wrote. This file has been written for several reasons: avoid to reinvent the wheel when writing simple scripts, reduce the maintenance cost of these scripts and their footprints.

## Usage

This lib is intended to be used exlusively with the shell Bash. All versions should be supported, although I only tested with versions 3.2 and onwards. 

The way I use *shut* is as a git submodule. I then symlink the script to the name I want to use in my own scripts.

    $ ln -s shut/utils.sh utils.sh

The script then needs to load the content of the lib using the following line:

    . "${0%/*}/utils.sh"

Using `${PWD}` does not work if the script is not run from its working directory. Imagine we are in our home, and we want to execute the script `~/Downloads/myScript.sh` (*shut* is then in the same `Downloads` folder, alongside `myScript.sh`). `${PWD}` will return `/home/$USER/` which does not contain our lib.

## Trivia

The name of this project was found unwittingly as I wanted a name as short as possible, easy to type. *shut* can be considered as a play on words with regard to the license under which this project is licensed (shut/closed proprietary software).

## License

This software is licensed under the terms of the GNU General Public License v3.0.

