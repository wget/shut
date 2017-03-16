#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# README:
#-------------------------------------------------------------------------------
# This lib is only compatible with recent Bash versions and needs to be loaded
# with a slash, otherwise Bash will search in the PATH and may not find it. So
# use source ./utils.sh and not source utils.sh
#
# When the user execute the script not in the same directory as this library,
# the latter will not be found. The lib needs to be loaded with ".
# ${0%/*}/utils.sh". Taking the absolute directory does not work when using
# debugging tools like bashdb as the latter reset that path to /bin, because $0
# is /bin/bashdb.
#
# WARNING: This script uses a global variable called "retval" to return
# elements from a function. "retval" must be reset or initialized in each
# function using that variable.
#
# Even if that global variable violates programming concepts, this avoids
# subshells specified with the $( ) or ` ` syntaxes and offers thus way better
# performance. Also as returning values from a function requires to use echo,
# and the use of a subshell (e.g.: returnStatement=$(myFunction "args")),
# exiting from these subshells did not propagate to the parent shell. Using
# that global variable solves the issue.
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# I: /
# P: Import ANSI terminal colors
# O: /
#-------------------------------------------------------------------------------
function initColors() {
    # Implement foreground and background colors for 8/16 colors terminal
    # emulators.
    # src.: http://misc.flogisoft.com/bash/tip_colors_and_formatting
    #       https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
    # LightGray might be the same as default, as default is sometimes gray or
    # white depending on the emulator.
    # Bright colors are often the same for normal and light color versions.

    export textBlack="[30m"
    export textRed="[31m"
    export textGreen="[32m"
    export textYellow="[33m"
    export textBlue="[34m"
    export textMagenta="[35m"
    export textCyan="[36m"
    export textLightGray="[37m"
    export textDefault="[39m"
    export textDarkGray="[90m"
    export textLightRed="[91m"
    export textLightGreen="[92m"
    export textLightYellow="[93m"
    export textLightBlue="[94m"
    export textLightMagenta="[95m"
    export textLightCyan="[96m"
    export textWhite="[97m"

    export backgroundBlack="[40m"
    export backgroundRed="[41m"
    export backgroundGreen="[42m"
    export backgroundYellow="[43m"
    export backgroundBlue="[44m"
    export backgroundMagenta="[45m"
    export backgroundCyan="[46m"
    export backgroundLightGray="[47m"
    export backgroundDefault="[49m"
    export backgroundDarkGray="[100m"
    export backgroundLightRed="[101m"
    export backgroundLightGreen="[102m"
    export backgroundLightYellow="[103m"
    export backgroundLightBlue="[104m"
    export backgroundLightMagenta="[105m"
    export backgroundLightCyan="[106m"
    export backgroundWhite="[107m"

    export colorReset="[0m"
}

#-------------------------------------------------------------------------------
# I: /
# P: Import ANSI terminal effects
# O: /
#-------------------------------------------------------------------------------
function initEffects() {
    export effectBright="[1m"
    export effectDim="[2m"
    export effectItalic="[3m"
    export effectUnderline="[4m"
    export effectBlink="[5m"
    export effectReverse="[7m"
    export effectHidden="[8m"
    export effectStrikeThrough="[9m"

    export effectBrightReset="[21m"
    export effectDimReset="[22m"
    export effectItalicReset="[23m"
    export effectUnderlineReset="[24m"
    export effectBlinkReset="[25m"
    export effectReverseReset="[27m"
    export effectHiddenReset="[28m"
    export effectStrikeThroughReset="[29m"

    export effectReset="[0m"
}

#-------------------------------------------------------------------------------
# I: String
# P: Print explicitely a string in the logs if logger present
# O: /
#-------------------------------------------------------------------------------
function log() {
    if type logger >/dev/null 2>&1; then
        logger -p user.err "${BASH_SOURCE[ ${#BASH_SOURCE[@]} - 1 ]##*/}" "$@"
    fi
}

#-------------------------------------------------------------------------------
# I: String
# P: Print a string on stderr
# O: /
#-------------------------------------------------------------------------------
function echoerr() {
    echo "$@" 1>&2;
}

#-------------------------------------------------------------------------------
# I: I: String
# P: Print a colored warning message.
# O: /
#-------------------------------------------------------------------------------
function warning() {
    echoerr "[${textYellow}${effectBright}!${colorReset}] $*"
}

#-------------------------------------------------------------------------------
# I: String
# P: Print a colored warning message and log the warning message to the system
#    log if possible.
# O: /
#-------------------------------------------------------------------------------
function warningWithLog() {
    log "$@"
    warning "$@"
}

#-------------------------------------------------------------------------------
# I: I: String
# P: Print a colored error message.
# O: /
#-------------------------------------------------------------------------------
function error() {
    echoerr "[${textRed}${effectBright}x${colorReset}] $*"
}

#-------------------------------------------------------------------------------
# I: String
# P: Print a colored error message and log the error message to the system log
#    if possible.
# O: /
#-------------------------------------------------------------------------------
function errorWithLog() {
    log "$@"
    error "$@"
}

#-------------------------------------------------------------------------------
# I: String
# P: Print a colored error message and exit.
# O: /
#-------------------------------------------------------------------------------
function die() {
    error "$@"
    exit 1
}

#-------------------------------------------------------------------------------
# I: String
# P: Simply output the string as a info with colors
# O: /
#-------------------------------------------------------------------------------
function success() {
    echoerr "[${textGreen}${effectBright}+${colorReset}] $*"
}

#-------------------------------------------------------------------------------
# I: String splitted into several arguments if needed
# P: Ask the user if he wants ot continue.
# O: - retval: true if yes, false if no;
#    - return value: 0 if yes, 1 if no;
#-------------------------------------------------------------------------------
function confirm() {
    unset retval

    # String needed when we are cutting our user message in several arguments to
    # hard wrap our source file in our text editor.
    local string="$*"
    read -p "[${textBlue}${effectBright}?${colorReset}] $string " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        retval=true
        return 0
    else
        retval=false
        return 1
    fi
}

#-------------------------------------------------------------------------------
# I: A string
# P: Check if the string is an argument of the following format --argument or -a
#    This function must be used directy like in "if isArgument "--dest"; then".
#    If you want to use arithmectic check with (( )) please reverse all the
#    return values (1 becomes 0 and 0 becomes 1).
# O: - If is a valid argument
#       - retval: true
#       - return value for direct usage in a if statement: 0
#    - If is not a valid argument
#       - retval: false
#       - return value for direct usage in a if statement: 1
#-------------------------------------------------------------------------------
function isArgument() {
    unset retval

    # ^ at the start of the regex causes the expression to be anchored at the
    # start of a line. Always put regex OUTSIDE quotes.
    if [[ "$1" =~ ^--[a-zA-Z]+(-[a-zA-Z]+)*$ || "$1" =~ ^-[a-zA-Z]$ ]]; then
        retval=true
        return 0
    fi
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
# I: Commands to be checked passed as argument
# P: Check if the specified commands exist in the PATH.
# O: - If requirements unmet:
#       - retval: an array of missing commands
#       - return value for direct usage in a if statement: 1
#    - If requirements met:
#       - retval: empty
#       - return value for direct usage in a if statement: 0
#-------------------------------------------------------------------------------
function checkDeps() {
    unset retval

    retval=()

    for i in "$@"; do
        if ! type "$i" >/dev/null 2>&1; then
            retval+=("$i")
        fi
    done

    if [[ -z "${retval[@]}" ]]; then
        return 0
    fi
    return 1
}

#-------------------------------------------------------------------------------
# I: Commands to be checked passed as argument
# P: Check if the specified commands exist in the PATH.
# O: - If requirements unmet:
#       - retval: an array of missing commands
#       - return value for direct usage in a if statement: 1
#    - If requirements met:
#       - retval: empty
#       - return value for direct usage in a if statement: 0
#-------------------------------------------------------------------------------
function requireDeps() {
    unset retval

    if ! checkDeps "$@"; then
        error "${FUNCNAME[1]}: The following commands are not installed:"\
        "${retval[*]}. Aborted."
        return 1
    fi
    return 0
}

#-------------------------------------------------------------------------------
# I: - The argument name in long, short format or both. If both needs to be
#      separated by | i.e.: getArgumentValue "--file|-f" $@
#    - The list of the script arguments to check for
# P: Get the value of the argument, otherwize nothing is returned. Error if the
#    argument is not a parameter or if, itself is not followed by a valid
#    argument value.
# O: - retval: The value of the argument
#    - return value: 0 if no issue, 1 if an issue occured
#-------------------------------------------------------------------------------
function getArgumentValue() {
    unset retval
    declare retval

    if (( $# < 2 )); then
        error "\"${FUNCNAME[0]}\" must be followed by the argument name to search for and the list of the script arguments."
        retval=""
        return 1
    fi

    local -a argument=()

    # Check if the argument name specified has a valid format and split our
    # argument
    local stringProgress
    IFS='|'
    # Do not quote, otherwise it will not word split, and the loop will only run once.
    for i in $1; do
        # If we have several or statements (pipes |), put a warning message
        # different as the a format issue.
        if [[ -z "$i" ]]; then
            warning "Empty pipe (|) condition detected in '$stringProgress${effectBright}<HERE>${effectReset}${1##$stringProgress}'. Continuing..."
            stringProgress="$stringProgress$i|"
            continue
        fi
        if ! isArgument "$i"; then
            # Trim first dashes
            local argValid=${1#*-}
            # Remove all characters from the end to the last pipe found (still
            # from the end)
            argValid=${argValid%%|*}
            error "'$1' has not a valid argument format. Format like '--$argValid' or '-${argValid:0:1}' expected."
            retval=""
            return 1
        fi
        stringProgress="$stringProgress$i|"
        argument+=("$i")
    done
    IFS=$' \t\n'
    unset i

    local found
    while (( $# > 1 )); do
        shift

        # Check if the string is an argument
        if ! isArgument "$1"; then
            continue
        fi

        # Check if this is the right argument
        found=false
        for i in "${argument[@]}"; do
            if [[ $i == "$1" ]]; then
                found=true
            fi
        done
        if [ "$found" = false ]; then
            continue
        fi
        # This is the right argument

        # Check if we have another value
        if (( $# < 2 )); then
            error "'$1' is not followed by a value."
            retval=""
            return 1
        fi

        # Check if the value has a valid format
        if isArgument "$2"; then
            error "'$2' seems to be an argument. '$1' cannot be followed by an argument. A value was expected."
            retval=""
            return 1
        fi

        break

    done

    if [[ "$found" == false ]]; then
        retval=""
        return 1
    fi
    retval="$2"
    return 0
}

#-------------------------------------------------------------------------------
# I: - The current progress value (must be a number)
#    - The maximum progress value corresponding to 100% (must be a number)
#    - The message to print where %%MIN%%, %%MAX%% and %%PERCENT%% placeholders
#      will be replaced by the current and maximum value.
# P: Print the progression indicator where the number are padded to the right
#    on the specified max value.
#    %%PERCENT%% values can be changed to %% PERCENT%% if we want leading
#    spaces or %%0PERCENT%% (zero character) to have leading 0.
# O: - retval: formatted strinbg if ok, empty if issue
#    - return value: 0 if ok, 1 if issue
#-------------------------------------------------------------------------------
function progress() {
    unset retval

    # Number needs to be a string, otherwise further display changes will be
    # discarded as Bash will remove the leading 0 and padding.
    local number
    local message="$3"
    local -i percent

    if ! isNumber "$1"; then
        retval=""
        return 1
    fi

    if ! isNumber "$2"; then
        retval=""
        return 1
    fi

    if isInString "$message" "%% CURRENT%%"; then
        printf -v number "%${#2}s" "$1"
        message=${message/\%\% CURRENT\%\%/$number}
    elif isInString "$message" "%%0CURRENT%%"; then
        printf -v number "%0${#2}d" "$1"
        message=${message/\%\%0CURRENT\%\%/$number}
    else
        message=${message/\%\%CURRENT\%\%/$1}
    fi

    if isInString "$message" "%% MAX%%"; then
        printf -v number "%${#2}s" "$2"
        message=${message/\%\% MAX\%\%/$number}
    elif isInString "$message" "%%0MAX%%"; then
        printf -v number "%0${#2}d" "$2"
        message=${message/\%\%0MAX\%\%/$number}
    else
        message=${message/\%\%MAX\%\%/$2}
    fi

    # POSIX shell does not support float. Need to use bc otherwise.
    # Compute percent and reuse same variable
    percent=$(( ($1 * 100) / $2 ))

    # To strip zeroes padding use $((10#$min)), but we prefer printf in order
    # to store in a variable without using subshells. Also using printf to
    # store in the same variable as the one we read from does not work. The
    # variable where we will store the result needs to be different.
    if isInString "$message" "%% PERCENT%%"; then
        printf -v number "%3s" "$percent"
        message=${message/\%\% PERCENT\%\%/$number}
    elif isInString "$message" "%%0PERCENT%%"; then
        printf -v number "%03d" "$percent"
        message=${message/\%\%0PERCENT\%\%/$number}
    else
        message=${message/\%\%PERCENT\%\%/$percent}
    fi

    retval="$message"
    return 0
}

#-------------------------------------------------------------------------------
# I: A string
# P: Check if the string is a number (positive, negative and decimal are taken
#    into account.
# O: - If is a valid argument
#       - retval: true
#       - return value for direct usage in a if statement: 0
#    - If is not a valid argument
#       - retval: false
#       - return value for direct usage in a if statement: 1
#-------------------------------------------------------------------------------
function isNumber() {
    unset retval

    if [[ "$1" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        retval=true
        return 0
    fi
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
# I: A string
# P: Check if the string is a number (positive, negative and decimal are taken
#    into account.
# O: - If is a valid argument
#       - retval: true
#       - return value for direct usage in a if statement: 0
#    - If is not a valid argument
#       - retval: false
#       - return value for direct usage in a if statement: 1
#-------------------------------------------------------------------------------
function isNumberPositive() {
    unset retval

    if [[ "$1" =~ ^+?[0-9]+([.][0-9]+)?$ ]]; then
        retval=true
        return 0
    fi
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
# I: - The string
#    - The pattern
# P: Find the position of the first occurrence of a substring in a string
# O: - in retval: the position
#-------------------------------------------------------------------------------
function strpos() {
    unset retval
    local string="$1"
    local pattern="$2"
    local stringSize=${#string}
    string="${string%$pattern}"
    if (( stringSize == ${#string} )); then
        retval=-1
        return
    fi
    retval=${#string}
}

#-------------------------------------------------------------------------------
# I: - The string
#    - The offset
#    - The length (optional)
# P: Returns the portion of string specified by the offset and length parameters.
# O: retval: the substring retval
#-------------------------------------------------------------------------------
function subString() {
    unset retval

    local string=$1
    local offset=$2
    local length=$3

    if [[ -z "$length" ]]; then
        retval=${string:$offset}
        return
    fi

    retval=${string:$offset:$length}
}

#-------------------------------------------------------------------------------
# I: - The string
#    - The pattern to search for (regex NOT supported)
# P: Check if the pattern is in the string
# O: - retval: 1 (yes), 0 (no)
#    - return value: 0 (yes), 1 (no)
#-------------------------------------------------------------------------------
function isInString() {
    unset retval

    string=${1//$2}
    if [[ "$string" == "$1" ]]; then
        retval=0
        return 1
    fi
    retval=1
    return 0
}

#-------------------------------------------------------------------------------
# I: - The string to work on
#    - The delimiter string
#    - The field number we want to keep (counting from 1)
# P: Cut the string according to the delimiter string and select the field we
#    want to keep
# O: retval: the substring retval
#-------------------------------------------------------------------------------
function splitString() {
    unset retval

    local string=$1
    local delimiter=$2
    local -i field=$3

    if [[ -z "$string" ]]; then
        errorWithLog "String empty"
        return 1
    fi

    if [[ -z "$delimiter" ]]; then
        errorWithLog "No delimiter specified"
        return 1
    fi

    if [[ -z "$field" ]]; then
        errorWithLog "No field number specified"
        return 1
    fi

    if ! isNumber "$field"; then
        errorWithLog "The field '$field' is not a valid number"
        return 1
    fi

    local -i stringPointer=0
    local -i delimiterPointer=0
    local -i delimiterCheck=0
    local -i substringStart=0
    local -i substringLength=0
    local -i fieldCounter=1
    while ((stringPointer < ${#string})); do

        delimiterPointer=0
        delimiterCheck=$stringPointer
        while [[ "${string:delimiterCheck:1}" == "${delimiter:delimiterPointer:1}" ]] && \
            ((delimiterCheck < ${#string})) && ((delimiterPointer < ${#delimiter})); do
            ((delimiterCheck++))
            ((delimiterPointer++))
        done

        if ((delimiterPointer == ${#delimiter})); then
            if ((fieldCounter == field)); then
                break
                return 0
            fi
            stringPointer=$delimiterCheck
            substringStart=$stringPointer
            substringLength=0
            ((fieldCounter++))
        else
            ((stringPointer++))
            ((substringLength++))
        fi


    done
    retval=${string:$substringStart:$substringLength}
    return 0
}

#-------------------------------------------------------------------------------
# I: - The string to work on
#    - The delimiter string (optional, default to ';')
# P: Cut the string according to the delimiter string and select the field we
#    want to keep
# O: retval: the substring retval
#-------------------------------------------------------------------------------
function explodeString() {
    unset retval

    local string=$1
    if [[ -z "$2" ]]; then
        local delimiter=';'
    else
        local delimiter=$2
    fi
    local -i stringPointer=0
    local -i delimiterCheck=0
    local -i substringStart=0
    local -i substringLength=0

    while ((stringPointer < ${#string})); do
        delimiterPointer=0
        delimiterCheck=$stringPointer
        while [[ "${string:delimiterCheck:1}" == "${delimiter:delimiterPointer:1}" ]] && \
            ((delimiterCheck < ${#string})) && \
            ((delimiterPointer < ${#delimiter})); do
            ((delimiterCheck++))
            ((delimiterPointer++))
        done
        if ((delimiterPointer == ${#delimiter})); then
            ((stringPointer+=$delimiterPointer))
            retval+=(${string:$substringStart:$substringLength})
            substringStart=$stringPointer
            substringLength=0
        else
            ((stringPointer++))
            ((substringLength++))
        fi
    done
}

#-------------------------------------------------------------------------------
# I: - String to trim
#    - The caracters to trim either as a simple string or a regex
# P: Remove the characters defined in the second argument (regex supported)
#    src.: http://stackoverflow.com/a/22261454/3514658
#    Please make sure you are using POSIX Extended Regular Expressions. Bash
#    does not support PCRE regex. More info to learn how to use ERE regexes:
#    "http://www.regular-expressions.info/posix.html
# O: - retval: the trimmed string
#    - return value for direct usage in a if statement: always 0
#-------------------------------------------------------------------------------
function trimString() {
    unset retval

    local string="$1"
    local regex='(.*)'$2'(.*)'

    if [[ "${regex:0:1}" == "^" ]]; then
        regex='^'$2''
    else
        regex='^(.*)'$2''
    fi

    local regexLastCharPosition=$((${#regex}-1))
    if [[ "${regex:$regexLastCharPosition:1}" == "$" ]]; then
        regex=${regex:0:regexLastCharPosition}'(.*)$'
    else
        regex=$regex'(.*)$'
    fi

    # While repead the [[ ]] command until it's not 0 any more.
    while [[ "$string" =~ $regex ]]; do
        # BASH_REMATCH[1] matches all the characters from the first parenthese
        # in the regex, BASH_REMATCH[2], simply the second. The caracters in
        # between are removed.
        # Do not allow to replace the characters by an optional one like
        # string="${BASH_REMATCH[1]}$3${BASH_REMATCH[2]}"
        # otherwise we risk denial of service. e.g. replacing space by space
        # will make an infinite loop.
        string="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
    done

    retval="$string"
    return 0
}

#-------------------------------------------------------------------------------
# I: /
# P: Get the directory where this file is stored in, if that directory is
#    a symlink, follow that symlink.
#    src.: http://stackoverflow.com/questions/59895/
# O: - retval: the directory
#-------------------------------------------------------------------------------
function getScriptDirectory() {
    unset retval
    local source="${BASH_SOURCE[0]}"
    local dir=''
    # Resolve $source until the file is no longer a symlink
    while [ -h "$source" ]; do
        dir="$(cd -P "${source%/*}" && echo "${PWD}")"
        source="$(readlink "$source")"
        # If $source was a relative symlink, we need to resolve it relative to
        # the path where the symlink file was located
        [[ $source != /* ]] && source="$dir/$source"
    done
    dir="$(cd -P "${source%/*}" && echo "${PWD}")"
    retval="$dir"
}

#-------------------------------------------------------------------------------
# I: - String to parse
# P: Get filename from string without path
# O: - retval: the filename substring
#    - return value for direct usage in a if statement: 1 if issue, 0 if ok
#-------------------------------------------------------------------------------
function getFilename() {
    unset retval
    if [[ -z "$1" ]]; then
        return 1
    fi
    retval=${1%.*}
    return 0
}

#-------------------------------------------------------------------------------
# I: - String to parse
# P: Get extension from string without path
# O: - retval: the extension substring
#    - return value for direct usage in a if statement: 1 if issue, 0 if ok
#-------------------------------------------------------------------------------
function getFilenameExtension() {
    unset retval
    if [[ -z "$1" ]]; then
        return 1
    fi
    retval=${1##*.}
    return 0
}

#-------------------------------------------------------------------------------
# I: - String to parse
# P: Get filename from string a with a path specified
# O: - retval: the filename substring
#    - return value for direct usage in a if statement: 1 if issue, 0 if ok
#-------------------------------------------------------------------------------
function getFilenameFromPath() {
    unset retval
    if [[ -z "$1" ]]; then
        return 1
    fi
    retval=${1##*/}
    return 0
}

#-------------------------------------------------------------------------------
# I: - The array values to search in
#    - The pattern to search for
# P: Search if the value is in the array.
# O: - If it was found:
#       - retval: true
#       - return value: 0 (for direct usage in a if statement)
#    - If it was not found:
#       - retval: false
#       - return value: 1 (for direct usage in a if statement)
#-------------------------------------------------------------------------------
function isInArray() {
    local pattern=$#
    pattern=${!pattern}
    for ((i = 1; i < $#; i++)) {
        if [ "${!i}" == "${pattern}" ]; then
            retval=true
            return 0
        fi
    }
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
# I: - The array to compare tableA[@]
#    - The second array tableB[@] against which to compare the first array
# P: Search if both arrays (all types) are equal
#    NOTE: The tables must be passed *AS NAME* as myTable not as $myTable[@]
#    nor ${myTable[@]} and requires Bash 4.3
#    Inspired from http://stackoverflow.com/a/17990637/3514658
#    and from http://stackoverflow.com/a/4017175/3514658
# O: - If both arrays are equal:
#       - retval: true
#       - return value for direct usage in a if statement: 0
#    - If both arrays are not equal:
#       - retval: false
#       - return value for direct usage in a if statement: 1
#-------------------------------------------------------------------------------
function isArraysEqual() {

    # Accessing by dereference using -n is new in Bash 4.3.
    local -n arr1=$1 2>/dev/null
    local -n arr2=$2 2>/dev/null
    # $? would equal 0 if an issue happenned with the -n argument
    # If <Bash 4.3, need to use the following syntax, but checking the keys of
    # associative arrays is not supported and, in that case, tables must be
    # passed as names *WITH* elements i.e.: myTable[@]
    # local -a arr1=("${!1}")
    # local -a arr2=("${!2}")
    if isBashOlder 4 3 0; then
        errorWithLog "isArraysEqual() accessing using dereference with -n"\
            "needs at least Bash 4.3. Arrays reported as different."
        retval=false
        return 1
    fi

    # Check size first. This is way faster than checking each item over
    # iteration.
    if [ ${#arr1[@]} != ${#arr2[@]} ]; then
        retval=false
        return 1
    fi

    # The ! expands to a list of array keys. For normal arrays, not associative
    # arrays, this gives a list of index values starting from 0.
    local -a arr1Keys=("${!arr1[@]}")
    local -a arr2Keys=("${!arr2[@]}")
    for ((i = 0; i < ${#arr1[@]}; i += 1)); do

        key=${arr1Keys[$i]}

        # Check if the values are the same. If the key does not exist in arr2
        # and the key does exist but is null in arr1, the values are NOT
        # considered different. This is why checking keys is mandatory.
        if [ "${arr1[$key]}" != "${arr2[$key]}" ]; then
            retval=false
            return 1
        fi

        # Check if keys are the same. This is needed for associative arrays.
        if [ "${arr1Keys[$i]}" != "${arr2Keys[$i]}" ]; then
            retval=false
            return 1
        fi
    done
    retval=true
    return 0
}

#-------------------------------------------------------------------------------
# I: - Bash major version
#    - Bash minor version
#    - Patch release
# P: Check if bash is older than the one specified
# O: - retval: 1 if older, 0 if equal or newer
#    - return value: 0 if older, 1 if equal or newer
#-------------------------------------------------------------------------------
function isBashOlder() {
    unset retval

    if [ $# -ne 3 ]; then
        errorWithLog "\"${FUNCNAME[0]}\" must have exactly 3 arguments: major minor patch"
        exit
    fi

    if [ "${BASH_VERSINFO[0]}" -lt "$1" ]; then
        retval=1
        return 0
    fi

    if [ "${BASH_VERSINFO[1]}" -lt "$2" ]; then
        retval=1
        return 0
    fi

    if [ "${BASH_VERSINFO[2]}" -lt "$3" ]; then
        retval=1
        return 0
    fi
    retval=0
    return 1
}

#-------------------------------------------------------------------------------
# I: - The file to check for function declarations
#    - The destination file to store the function unsets (optional)
#    - A flag guard used to specify if we want the functions to be returned in
#      retval as an array (optional)
# P: Store all function declarations of a bash script to a destination file.
#    If no destination has been specified, the functions declared in the bash
#    script will be undeclared except if a third argument "retval" is declared.
# O: - retval: untouched, except if the destination is empty and the third
#      argument is "retval", the functions declared in the bash script will be
#      returned in retval as an array.
#-------------------------------------------------------------------------------
function undeclareFunctions() {
    local file="$1"
    local destination="$2"

    if [ ! -f "$file" ]; then
        error "\"$file\" is not a file. Aborted."
        return
    fi

    if [ ! -r "$file" ]; then
        error "\"$file\" is not readable. Aborted."
        return
    fi

    if [[ "$3" == "retval" ]]; then
        local funcs=()
    fi

    # Erase the file
    if [ -n "$destination" ]; then
        # echo return 1 if couldn't write into a file for example
        if ! echo '' > "$destination"; then
            warning "Unable to write to \"$destination\". Ignoring destination file."
            destination=''
        fi
    fi

    while read -r line; do

        if isInString "$line" "function " &&\
           isInString "$line" "() {"; then

            splitString "$line" "function " 2
            splitString "$retval" "() {" 1
            if [ -z "$destination" ]; then
                if [[ "$3" == "retval" ]]; then
                    funcs+=("$retval")
                else
                    unset -f $retval
                fi
            else
                echo "unset -f $retval" >> "$destination"
            fi
        fi
    done < "$file"

    # Copy the local array to the global variable (quotes are indeed needed)
    # http://stackoverflow.com/a/24323275/3514658
    if [[ "$3" == "retval" ]]; then
        retval=("${funcs[@]}")
    fi
}
