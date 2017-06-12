#!/usr/bin/env bash

## @file
## @defgroup Colors Terminal colors
## @defgroup Effects Terminal effects

#-------------------------------------------------------------------------------
## @fn setColors()
## @details Import ANSI terminal colors. Implement foreground and background
## colors for 8/16 colors terminal ## emulators. These variables are exported
## that way, they are available to subprocesses as well.
## src.: http://misc.flogisoft.com/bash/tip_colors_and_formatting
##       https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
## @note Bright colors are often the same for normal and light color versions.
#-------------------------------------------------------------------------------
function setColors() {

## @{
## @addtogroup Colors

## @var textBlack
## @brief Change text color to black.
# shellcheck disable=SC2034
    export textBlack="[30m"
## @var textRed
## @brief Change text color to red.
    export textRed="[31m"
## @var textGreen
## @brief Change text color to green.
    export textGreen="[32m"
## @var textYellow
## @brief Change text color to yellow.
    export textYellow="[33m"
## @var textBlue
## @brief Change text color to blue.
    export textBlue="[34m"
## @var textMagenta
## @brief Change text color to magenta.
    export textMagenta="[35m"
## @var textCyan
## @brief Change text color to cyan.
    export textCyan="[36m"
## @var textLightGray
## @brief Change text color to light gray.
## LightGray might be the same as default, as default is sometimes gray or
## white depending on the emulator.
    export textLightGray="[37m"
## @var textDefault
## @brief Change text color to default color.
    export textDefault="[39m"
## @var textDarkGray
## @brief Change text color to dark gray.
    export textDarkGray="[90m"
## @var textLightRed
## @brief Change text color to light red.
    export textLightRed="[91m"
## @var textLightGreen
## @brief Change text color to light green.
    export textLightGreen="[92m"
## @var textLightYellow
## @brief Change text color to light yellow.
    export textLightYellow="[93m"
## @var textLightBlue
## @brief Change text color to light blue.
    export textLightBlue="[94m"
## @var textLightMagenta
## @brief Change text color to light magenta.
    export textLightMagenta="[95m"
## @var textLightCyan
## @brief Change text color to light cyan.
    export textLightCyan="[96m"
## @var textWhite
## @brief Change text color to white.
    export textWhite="[97m"

## @var backgroundBlack
## @brief Change background color to black.
    export backgroundBlack="[40m"
## @var backgroundRed
## @brief Change background color to red.
    export backgroundRed="[41m"
## @var backgroundGreen
## @brief Change background color to green.
    export backgroundGreen="[42m"
## @var backgroundYellow
## @brief Change background color to yellow.
    export backgroundYellow="[43m"
## @var backgroundBlue
## @brief Change background color to blue.
    export backgroundBlue="[44m"
## @var backgroundMagenta
## @brief Change background color to magenta.
    export backgroundMagenta="[45m"
## @var backgroundCyan
## @brief Change background color to cyan.
    export backgroundCyan="[46m"
## @var backgroundLightGray
## @brief Change background color to light gray.
    export backgroundLightGray="[47m"
## @var backgroundDefault
## @brief Change background color to the default color.
    export backgroundDefault="[49m"
## @var backgroundDarkGray
## @brief Change background color to dark gray.
    export backgroundDarkGray="[100m"
## @var backgroundLightRed
## @brief Change background color to light red.
    export backgroundLightRed="[101m"
## @var backgroundLightGreen
## @brief Change background color to light green.
    export backgroundLightGreen="[102m"
## @var backgroundLightYellow
## @brief Change background color to light yellow.
    export backgroundLightYellow="[103m"
## @var backgroundLightBlue
## @brief Change background color to light blue.
    export backgroundLightBlue="[104m"
## @var backgroundLightMagenta
## @brief Change background color to light magenta.
    export backgroundLightMagenta="[105m"
## @var backgroundLightCyan
## @brief Change background color to light cyan.
    export backgroundLightCyan="[106m"
## @var backgroundWhite
## @brief Change background color to white.
    export backgroundWhite="[107m"

## @var colorReset
## @brief Reset the colors to the default color defined by the emulator.
## @note Resetting the colors also resets the effect back to the default.
    export colorReset="[0m"

## @}
}

#-------------------------------------------------------------------------------
## @fn set_colors()
## @details Simple alias to setColors
#-------------------------------------------------------------------------------
function set_colors() {
    setColors
}

#-------------------------------------------------------------------------------
## @fn unsetColors()
## @details Simply unset the exported colors
#-------------------------------------------------------------------------------
function unsetColors() {
    unset textBlack
    unset textRed
    unset textGreen
    unset textYellow
    unset textBlue
    unset textMagenta
    unset textCyan
    unset textLightGray
    unset textDefault
    unset textDarkGray
    unset textLightRed
    unset textLightGreen
    unset textLightYellow
    unset textLightBlue
    unset textLightMagenta
    unset textLightCyan
    unset textWhite
    unset backgroundBlack
    unset backgroundRed
    unset backgroundGreen
    unset backgroundYellow
    unset backgroundBlue
    unset backgroundMagenta
    unset backgroundCyan
    unset backgroundLightGray
    unset backgroundDefault
    unset backgroundDarkGray
    unset backgroundLightRed
    unset backgroundLightGreen
    unset backgroundLightYellow
    unset backgroundLightBlue
    unset backgroundLightMagenta
    unset backgroundLightCyan
    unset backgroundWhite
    unset colorReset
}

#-------------------------------------------------------------------------------
## @fn unset_colors()
## @details Simple alias to unsetColors
#-------------------------------------------------------------------------------
function unset_colors() {
    unsetColors
}

#-------------------------------------------------------------------------------
## @fn setEffects()
## @details Import ANSI terminal effects.
#-------------------------------------------------------------------------------
function setEffects() {

## @{
## @addtogroup Effects

## @var effectBright
## @brief Increase the color brightness.
    export effectBright="[1m"
## @var effectDim
## @brief Dicrease the color of the text (white becomes gray, etc.).
    export effectDim="[2m"
## @var effectItalic
## @brief Put the text in italic.
    export effectItalic="[3m"
## @var effectUnderline
## @brief Put a line under the text.
    export effectUnderline="[4m"
## @var effectBlink
## @brief Make the text blinking (not supported in most of the terminals).
    export effectBlink="[5m"
## @var effectReverse
## @brief Put the text in reverse color.
    export effectReverse="[7m"
## @var effectHidden
## @brief Hide the text (useful for passwords).
    export effectHidden="[8m"
## @var effectStrikeThrough
## @brief Add a line through the text.
    export effectStrikeThrough="[9m"

## @var effectBrightReset
## @brief Reset the color brightness effect.
    export effectBrightReset="[21m"
## @var effectDimReset
## @brief Reset the reduced color of the text.
    export effectDimReset="[22m"
## @var effectItalicReset
## @brief Remove the italic effect of the text.
    export effectItalicReset="[23m"
## @var effectUnderlineReset
## @brief Remove the line under the text.
    export effectUnderlineReset="[24m"
## @var effectBlinkReset
## @brief Remove the blinking of the text.
    export effectBlinkReset="[25m"
## @var effectReverseReset
## @brief Reset the reverse color effect.
    export effectReverseReset="[27m"
## @var effectHiddenReset
## @brief Reset the hidden text effect.
    export effectHiddenReset="[28m"
## @var effectStrikeThroughReset
## @brief Remove the a line through the text.
    export effectStrikeThroughReset="[29m"

## @var effectReset
## @brief Reset the effects to the default ones defined by the emulator.
## @note Resetting the effects will also resets the colors back to the default.
    export effectReset="[0m"

## @}
}

#-------------------------------------------------------------------------------
## @fn set_effects()
## @details Simple alias to setEffects
#-------------------------------------------------------------------------------
function set_effects() {
    setEffects
}

#-------------------------------------------------------------------------------
## @fn unsetEffects()
## @details Import ANSI terminal effects.
#-------------------------------------------------------------------------------
function unsetEffects() {
    unset effectBright
    unset effectDim
    unset effectItalic
    unset effectUnderline
    unset effectBlink
    unset effectReverse
    unset effectHidden
    unset effectStrikeThrough
    unset effectBrightReset
    unset effectDimReset
    unset effectItalicReset
    unset effectUnderlineReset
    unset effectBlinkReset
    unset effectReverseReset
    unset effectHiddenReset
    unset effectStrikeThroughReset
    unset effectReset
}

#-------------------------------------------------------------------------------
## @fn unset_effects()
## @details Simple alias to unsetEffects
#-------------------------------------------------------------------------------
function unset_effects() {
    unsetEffects
}

#-------------------------------------------------------------------------------
## @fn getDate()
## @details Get date and time with nanoseconds (when supported, which isn't on
## BSD).
## @return In $retval, the string date under the format 8601.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function getDate() {
    unset retval

    if ! checkDeps 'date'; then
        return 1
    fi

    # Splitting declaration and assignation on two lines prevents SC2155
    local date
    date="$(date "+%Y-%m-%dT%H:%M:%N")"

    # If nanoseconds are not supported, the final string contains ":N".
    if strpos "$date" ":N"; then
        date=$(date "+%Y-%m-%dT%H:%M")
    fi

    retval="$date"

    return 0
}

#-------------------------------------------------------------------------------
## @fn get_date()
## @details Simple alias to getDate
#-------------------------------------------------------------------------------
function get_date() {
    getDate
}

#-------------------------------------------------------------------------------
## @fn log()
## @details If logger is present, print explicitely a string in the logs with
## the priority specified.
## @param $msg The message to send to the logs.
## @param $level Level of the error corresponds to the priority code used in
## @param $script The name of the script responsible of the issue
## traditional syslog implementations. The priority can be prefixed by a
## facility which is a code used to specify the type of the program.
## src.: https://en.wikipedia.org/wiki/Syslog#Facility
## If $level is not specified, it defaults to "user.err".
#-------------------------------------------------------------------------------
function log() {
    if [[ -z "$2" ]]; then
        local level="user.err"
    else
        local level="$2"
    fi

    if type logger >/dev/null 2>&1; then
        if [[ -z "$3" ]]; then
            ## See getScriptName() to know more why we use BASH_SOURCE here.
            logger -p "$level" "${BASH_SOURCE[ ${#BASH_SOURCE[@]} - 1 ]##*/}: $1"
        else
            logger -p "$level" "$3: $1"
        fi
    fi
}

#-------------------------------------------------------------------------------
## @fn echoerr()
## @details Simply print a string on stderr.
## @param $string The string to display on stderr.
#-------------------------------------------------------------------------------
function echoerr() {
    echo "$@" 1>&2;
}

#-------------------------------------------------------------------------------
## @fn echoErr()
## @details Simple alias to echoerr
#-------------------------------------------------------------------------------
function echoErr() {
    echoerr "$@"
}

#-------------------------------------------------------------------------------
## @fn info()
## @details Print an info message. If the script is run in the background, put
## a warning message in the system logger. If the script is redirected to a file
## or run interactively, format the info message accordingly. The name of the
## script is prefixed to the message (thus not the name of the sourced library).
## @param $msg The message to display as info.
## @retval 0 Always return 0.
#-------------------------------------------------------------------------------
function info() {
    unset retval

    getScriptName
    local scriptName="$retval"
    getDate
    local date="$retval"
    unset retval

    if isRunInBackground $$; then
        log "$*" user.info "$scriptName[$$]"
    fi

    # Even if run in the background, this does not mean the output is
    # redirected. We can thus continue.

    # Test if the output is redirected
    # http://stackoverflow.com/a/26761733/3514658
    if [[ ! -t 1 ]]; then
        echo "[INFO] $date $scriptName[$$]: $*"
        return 0
    fi

    setColors
    setEffects
    echo "[${textGreen}${effectBright}+${colorReset}] $*"
    unsetColors
    unsetEffects
    return 0
}

#-------------------------------------------------------------------------------
## @fn warning()
## @details Print a warning message. (See info() for details).
## @param $msg The message to display as warning.
## @retval 0 Always return 0.
#-------------------------------------------------------------------------------
function warning() {
    unset retval

    getScriptName
    local scriptName="$retval"
    getDate
    local date="$retval"
    unset retval

    if isRunInBackground $$; then
        log "$*" user.warning "$scriptName[$$]"
    fi

    if [[ ! -t 1 ]]; then
        echo "[WARNING] $date $scriptName[$$]: $*"
        return 0
    fi

    setColors
    setEffects
    echo "[${textYellow}${effectBright}!${colorReset}] $*"
    unsetColors
    unsetEffects
    return 0
}

#-------------------------------------------------------------------------------
## @fn error()
## @details Print an error message. (See info() for details).
## @param $msg The message to display as error.
## @retval 0 Always return 0.
#-------------------------------------------------------------------------------
function error() {
    unset retval

    getScriptName
    local scriptName="$retval"
    getDate
    local date="$retval"
    unset retval

    if isRunInBackground $$; then
        log "$*" user.err "$scriptName[$$]"
    fi

    if [[ ! -t 2 ]]; then
        echoerr "[ERROR] $date $scriptName[$$]: $*"
        return 0
    fi

    setColors
    setEffects
    echoerr "[${textRed}${effectBright}x${colorReset}] $*"
    unsetColors
    unsetEffects
    return 0
}

#-------------------------------------------------------------------------------
## @fn die()
## @details Print an error message and exit as an error. (See info() for
## details).
## @param $msg The message to display as error.
## @retval 1 Always return 1.
#-------------------------------------------------------------------------------
function die() {
    unset retval

    getScriptName
    local scriptName="$retval"
    getDate
    local date="$retval"
    unset retval

    if isRunInBackground $$; then
        log "$*" user.err "$scriptName[$$]"
    fi

    if [[ ! -t 2 ]]; then
        echoerr "[FATAL] $date $scriptName[$$]: $*"
        return 0
    fi

    setColors
    setEffects
    echoerr "[${textRed}${effectBright}x${colorReset}] $*"
    unsetColors
    unsetEffects
    exit 1
}

#-------------------------------------------------------------------------------
## @fn confirm()
## @details Ask the user if he wants to continue or not, with the message we
## specified.
## @param $string The question to ask to the user. This string can be splitted
## in several arguments if the question is too long. That way, the text can we
## hard wrapped in the text editor of the user wanting to use this function.
## @return In $retval, true if the user has confirmed. false if the user hasn't.
## @retval 0 If the user has confirmed.
## @retval 1 If the user has not confirmed.
#-------------------------------------------------------------------------------
function confirm() {
    unset retval

    # String needed when we are cutting our user message in several arguments to
    # hard wrap our source file in our text editor.
    local string="$*"
    setColors
    setEffects
    read -p "[${textBlue}${effectBright}?${colorReset}] $string " -n 1 -r
    unsetColors
    unsetEffects
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
## @fn isArgument()
## @details Check if the string is an argument using the format "--argument"
## or "-a".
## This function must be used directy like in "if isArgument "--dest"; then".
## @param $string The string to check as an argument.
## @return In $retval, true if this is an argument, false if it isn't.
## @retval 0 If this is an argument.
## @retval 1 If this is not an argument.
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
## @fn is_argument()
## @details Simple alias to isArgument
#-------------------------------------------------------------------------------
function is_argument() {
    isArgument "$@"
}

#-------------------------------------------------------------------------------
## @fn checkDeps()
## @details Check if the specified commands exist in the PATH.
## @param $string A space separated list of items where each correspond to
## a command to check in the PATH.
## @return In $retval, an array of commands missing when the requirements are
## unmet or an empty array if the requirements are met.
## @retval 0 If the requirements are met.
## @retval 1 If the requirements are unmet.
#-------------------------------------------------------------------------------
function checkDeps() {
    unset retval
    local i

    for i in $1; do
        if ! type "$i" >/dev/null 2>&1; then
            # ShellCheck thinks this is an associative array, which isn't.
            # shellcheck disable=SC2190
            retval+=("$i")
        fi
    done
    unset i

    if ((${#retval[@]} == 0)); then
        return 0
    fi
    return 1
}

#-------------------------------------------------------------------------------
## @fn check_deps()
## @details Simple alias to checkDeps
#-------------------------------------------------------------------------------
function check_deps() {
    checkDeps "$@"
}

#-------------------------------------------------------------------------------
## @fn requireDeps()
## @details Display the commands not available.
## @param $string A space separated list of items where each correspond to
## a command to check in the PATH.
## @retval 0 If the requirements are met.
## @retval 1 If the requirements are unmet.
#-------------------------------------------------------------------------------
function requireDeps() {
    unset retval

    if ! checkDeps "$*"; then
        local msg

        if ((${#retval[@]} >= 2)); then
            msg='The commands '
            if ((${#retval[@]} == 2)); then
                msg+="'${retval[0]}' and '${retval[1]}'"
            else
                for ((i = 0; i < ${#retval} - 2; i++)); do
                    msg+="'${retval[i]}', "
                done
                msg+="'${retval[$i]}' and "
                ((i++))
                msg+="'${retval[$i]}' "
            fi
            msg+=" are not installed. Aborted."
        else
            msg="The command '${retval[0]}' is not installed. Aborted."
        fi

        die "${FUNCNAME[1]}: $msg"
    fi
    return 0
}

#-------------------------------------------------------------------------------
## @fn require_deps()
## @details Simple alias to requireDeps
#-------------------------------------------------------------------------------
function require_deps() {
    requireDeps "$@"
}

#-------------------------------------------------------------------------------
## @fn var_dump()
## @details Dumps information about the variable passed as argument.
## @param $var The variable name (thus without the dollar char $). If the
## dollar sign is used, the value will be used instead.
## @note This function makes use of the evil eval statement. While the latter
## has been sanitized, the check is rather naive. We initially used the retval
## statement but this was rather cumbersome for the end user. The latter had
## always to backup its retval variable to check another one.
## @retval 0 Always return 0.
#-------------------------------------------------------------------------------
function var_dump() {

    # Need to split declaration and assignation, otherwise the return value is
    # incorrect.
    local varType

    while (($#)); do

        local var="$1"
        shift
        local -i i=0

        # Try to sanitize the evil use of eval. (If you're reading this, sorry).
        if strpos "$var" ";" ||
           strpos "$var" "(" ||
           strpos "$var" ")" ||
           strpos "$var" "$" ||
           strpos "$var" "{" ||
           strpos "$var" "}"; then
            continue
        fi

        # If the declare statement fails (e.g. trying to call it directly on
        # a string, or on a number, without using a variable name).
        if ! varType=$(declare -p "$var" 2>/dev/null); then
            # Cast to a number if we assume this is a number
            if isNumber "$var"; then
                echo "int($var)"
            else
                # Unable to check if the argument is a string by checking if the
                # argument is passed with " or ' as these chars are interpreted by
                # the shell.
                echo "string(${#var}) \"$var\""
            fi
            continue
        fi

        # Since Bash 4.3, a reference to another variable can be added, browse all
        # the references in order to get the parent type.
        # src.: http://stackoverflow.com/a/42877229/3514658
        local reg='^declare -n [^=]+=\"([^\"]+)\"$'
        while [[ $varType =~ $reg ]]; do
            varType=$(declare -p "${BASH_REMATCH[1]}")
        done

        case "${varType#declare -}" in
             a*)
                local -i len=0
                eval 'len=${#'"$var"'[@]} 2>/dev/null'
                echo "array(${len}) {"
                for ((i = 0; i < len; i++)); do
                    echo "  [$i]=>"
                    echo -n "  "
                    eval 'var_dump "${'"$var"'[i]}"'
                done
                echo "}"
                ;;
            A*)
                # Needs Bash 4+
                # src.: http://stackoverflow.com/a/3467959/3514658
                local keys=()
                eval 'keys=(${!'"$var"'[@]}) 2>/dev/null'
                local -i len=${#keys[@]}
                echo "array(${len}) {"
                for ((i = 0; i < len; i++)); do
                    local value
                    eval 'value=${'"$var"'[${keys[i]}]}'
                    if isNumber "${keys[i]}"; then
                        echo "  [${keys[i]}]=>"
                    else
                        echo "  [\"${keys[i]}\"]=>"
                    fi
                    echo -n "  "

                    var_dump "$value"
                done
                echo "}"
                ;;
            i*)
                echo "int($var)"
                ;;
            x*)
                echo "export(${#var}) \"$var\""
                ;;
            *)
                echo "string(${#var}) \"$var\""
                ;;
        esac
    done
}

#-------------------------------------------------------------------------------
## @fn varDump()
## @details Simple alias to var_dump
#-------------------------------------------------------------------------------
function varDump() {
    var_dump "$@"
}

#-------------------------------------------------------------------------------
## @fn progress()
## @details Print the progression indicator where the number are padded to the
## right on the specified max value. %%PERCENT%% values can be changed to$
## '%% PERCENT%%' (prefixed by a space character) if we want leading spaces or
## '%%0PERCENT%%' (zero character) to have leading 0.
## @param $current The current progress value (must be a number).
## @param $max The maximum progress value corresponding to 100% (must be a
## number).
## @param $msg The message to print where %%MIN%%, %%MAX%% and %%PERCENT%%
## placeholders will be replaced by the current and maximum value.
## @return In $retval, the correct formatted string, or an empty string if
## there was an issue.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function progress() {

    # Number needs to be a string, otherwise further display changes will be
    # discarded as Bash will remove the leading 0 and padding.
    local number
    local message="$3"
    local -i percent

    if ! isNumber "$1"; then
        # shellcheck disable=SC2178
        retval=""
        return 1
    fi

    if ! isNumber "$2"; then
        # shellcheck disable=SC2178
        retval=""
        return 1
    fi

    if strpos "$message" "%% CURRENT%%"; then
        printf -v number "%${#2}s" "$1"
        message=${message/\%\% CURRENT\%\%/$number}
    elif strpos "$message" "%%0CURRENT%%"; then
        printf -v number "%0${#2}d" "$1"
        message=${message/\%\%0CURRENT\%\%/$number}
    else
        message=${message/\%\%CURRENT\%\%/$1}
    fi

    if strpos "$message" "%% MAX%%"; then
        printf -v number "%${#2}s" "$2"
        message=${message/\%\% MAX\%\%/$number}
    elif strpos "$message" "%%0MAX%%"; then
        printf -v number "%0${#2}d" "$2"
        message=${message/\%\%0MAX\%\%/$number}
    else
        message=${message/\%\%MAX\%\%/$2}
    fi

    # POSIX shell does not support float. Need to use bc otherwise.
    # Compute percent and reuse same variable
    percent=$((($1 * 100) / $2))

    # To strip zeroes padding use $((10#$min)), but we prefer printf in order
    # to store in a variable without using subshells. Also using printf to
    # store in the same variable as the one we read from does not work. The
    # variable where we will store the result needs to be different.
    if strpos "$message" "%% PERCENT%%"; then
        printf -v number "%3s" "$percent"
        message=${message/\%\% PERCENT\%\%/$number}
    elif strpos "$message" "%%0PERCENT%%"; then
        printf -v number "%03d" "$percent"
        message=${message/\%\%0PERCENT\%\%/$number}
    else
        message=${message/\%\%PERCENT\%\%/$percent}
    fi

    unset retval
    # shellcheck disable=SC2178
    retval="$message"
    return 0
}

#-------------------------------------------------------------------------------
## @fn isNumber()
## @details Check if the string is a number (positive, negative and decimal are
## taken into account.
## @param $string The string to check if this is a number.
## @return In $retval, true f the string is a number, false if it isn't.
## @retval 0 If the string is a number.
## @retval 1 If the string is not a number.
#-------------------------------------------------------------------------------
function isNumber() {
    unset retval

    if [[ "$1" =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        # shellcheck disable=SC2178
        retval=true
        return 0
    fi
    # shellcheck disable=SC2178
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
## @fn is_number()
## @details Simple alias to isNumber
#-------------------------------------------------------------------------------
function is_number() {
    isNumber "$@"
}

#-------------------------------------------------------------------------------
## @fn isNumberPositive()
## @details Check if the string is a number (positive, negative and decimal are
## taken into account.
## @param $string The string to check if this is a number.
## @return In $retval, true f the string is a number, false if it isn't.
## @retval 0 If the string is a number.
## @retval 1 If the string is not a number.
#-------------------------------------------------------------------------------
function isNumberPositive() {
    unset retval

    if [[ "$1" =~ ^\+?[0-9]+([.][0-9]+)?$ ]]; then
        # shellcheck disable=SC2178
        retval=true
        return 0
    fi
    # shellcheck disable=SC2178
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
## @fn is_number_positive()
## @details Simple alias to isNumberPositive
#-------------------------------------------------------------------------------
function is_number_positive() {
    isNumberPositive "$@"
}

#-------------------------------------------------------------------------------
## @fn strpos()
## @details Find the position of the first occurrence of a substring in a string
## @param $string The haystack string to search in.
## @param $pattern The needle string to search for.
## @param $offset If specified, search will start this number of characters
## counted from the beginning of the string. If the offset is negative, the
## search will start this number of characters counted from the end of the
## string.
## @return In $retval, the position starting from 0 where the pattern was
## found, -1 if this wasn't found. false if an error occurred.
## @retval 0 If the pattern was found.
## @retval 1 If the pattern was not found.
#-------------------------------------------------------------------------------
function strpos() {
    unset retval
    local string="$1"
    local pattern="$2"
    if [[ -z "$3" ]]; then
        local -i offset=0
    else
        local -i offset="$3"
    fi
    if ((offset < 0)); then
        if ((-1 * offset > ${#string})); then
            # shellcheck disable=SC2178
            retval=false
            return 1
        fi
        string=${string:${#string} - offset}
    else
        string=${string:$offset}
    fi

    # The initial state of the automaton (the table of failure function)
    # corresponding to the empty string.
    local -i n=${#string}
    local -i m=${#pattern}
    # The initial state of the automaton (the table of failure function)
    # corresponding to the empty string.
    local -i i=0
    # The first character of the string
    local -i j=0

    __kmpBuildFailureFunction "$pattern"
    local ff=("${retval[@]}")
    unset retval

    while true; do
        if ((j == n)); then
            break
        fi

        if [[ "${string:j:1}" == "${pattern:i:1}" ]]; then
            ((i++))
            ((j++))
            if ((i == m)); then
                # shellcheck disable=SC2178
                retval=$((j - m))
                break
            fi
        elif ((i > 0)); then
            i=${ff[i]}
        else
            ((j++))
        fi
    done

    # shellcheck disable=SC2128
    if [[ -z "$retval" ]]; then
        # shellcheck disable=SC2178
        retval=-1
        return 1
    fi

    ((retval+=offset))
    return 0
}

#-------------------------------------------------------------------------------
## @fn strPos()
## @details Simple alias to strpos
#-------------------------------------------------------------------------------
function strPos() {
    strpos "$@"
}

#-------------------------------------------------------------------------------
## @fn __kmpBuildFailureFunction()
## @details Create the table used to build the partial match of pattern
## substrings in the Knuth-Morris-Pratt algorithm (cf. https://goo.gl/LYejQ9 and
## http://stackoverflow.com/a/14080422/3514658).
## @param $pattern The pattern to build the failure function (substrings) on.
## @return In $retval, the failure array.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function __kmpBuildFailureFunction() {
    unset retval

    if [[ -z "$1" ]]; then
        retval=()
        return 1
    fi
    local -i i=0
    local -i j=0
    local pattern="$1"
    local -i len=${#pattern}

    # These statements are always true
    # - The first element of the list of prefixes is an empty string
    # - The second element of the list of prefixes is the first letter of the
    #   pattern;
    # shellcheck disable=SC2190
    retval=(0)
    # shellcheck disable=SC2190
    retval+=(0)

    for ((i = 2; i <= len; i++)); do

        j=${retval[i - 1]}
        while true; do
            if [[ "${pattern:j:1}" == "${pattern:i - 1:1}" ]]; then
                retval[i]=$((j + 1))
                break
            fi

            if ((j == 0)); then
                retval[i]=0
                break
            fi

            j=${retval[j]}
        done
    done
    return 0
}

#-------------------------------------------------------------------------------
## @fn explode()
## @brief Returns an array of strings, each of which is a substring of string
## formed by splitting it on boundaries formed by the string delimiter. This
## function uses the Knuth-Morris-Pratt algorithm.
## @param $delimiter The delimiter (can be a one char string or a string made of
## several characters).
## @param $string The input string to explode.
## @param $limit If limit is set and positive, the returned array will contain
## a maximum of limit elements with the last element containing the rest of
## string. If the limit parameter is negative, all components except the last
## -limit are returned. If the limit parameter is zero, then this is treated
## as 1.
## @return In $retval, an array of strings, each of which is a substring of
## string formed by splitting it on boundaries formed by the string delimiter.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function explode() {
    unset retval

    if [[ -z "$1" ]]; then
        return 1
    fi
    local pattern="$1"
    local text="$2"
    local -i limit
    local limitState
    if [[ -n "$3" ]]; then
        limit="$3"
        if ((limit < 0)); then
            limitState="negative"
            limit+=$((-2 * limit))
            ((limit--))
        elif ((limit == 0)); then
            limit=1
        else
            limitState="positive"
        fi
    else
        limitState="noLimit"
    fi
    local -i n=${#text}
    local -i m=${#pattern}
    if (( m > n )); then
        retval[0]="$text"
        return 0
    fi

    __kmpBuildFailureFunction "$pattern"
    local ff=("${retval[@]}")
    unset retval

    # The initial state of the automaton (the table of failure function)
    # corresponding to the empty string.
    local -i i=0
    # The first character of the text
    local -i j=0
    local -i matchLoc=0
    local -i numberOfMatch=0

    while true; do
        if ((j == n)); then
            # shellcheck disable=SC2190
            retval+=("${text:matchLoc:j-matchLoc}")
            break
        fi

        if [[ "${text:j:1}" == "${pattern:i:1}" ]]; then
            ((i++))
            ((j++))
            if ((i == m)); then
                # shellcheck disable=SC2190
                retval+=("${text:matchLoc:j-i-matchLoc}")
                matchLoc=$j
                ((numberOfMatch++))
            fi

        elif ((i > 0)); then
            i=${ff[i]}
        else
            ((j++))
        fi
    done

    if [[ "$limitState" == "noLimit" ]]; then
        return 0
    fi

    i=0
    local keep=()
    for ((i = 0; i < ${#retval[@]} && i < limit; i++)); do
        keep+=(${retval[$i]})
    done

    # Only add the rest of the string if the limit specified is not outside the bounds
    if [[ "$limitState" == "positive" ]]; then
        if (( limit >= ${#retval[@]} )); then
            return 0
        fi
        keep[$limit - 1]=${retval[$limit - 1]}${text:matchLoc-m}
    fi

    # shellcheck disable=SC2190
    retval=("${keep[@]}")

    return 0
}

#-------------------------------------------------------------------------------
## @fn substr()
## @details Returns the portion of string specified by the start and length
## parameters.
## @param $string The input string. Must be one character or longer.
## @param $start If start is non-negative, the returned string will start at
## the start'th position in string, counting from zero. For instance, in the
## string 'abcdef', the character at position 0 is 'a', the character at
## position 2 is 'c', and so forth.
## If start is negative, the returned string will start at the start'th
## character from the end of string.
## If string is less than start characters long, 1 will be returned as return value.
## @param $length The string returned will contain at most length characters.
## If length is given and is positive, the string returned will contain at most
## length characters beginning from start (depending on the length of string).
## If length is given and is negative, then that many characters will be omitted
## from the end of string (after the start position has been calculated when
## a start is negative). If start denotes the position of this truncation or
## beyond, 1 will be returned as return value.
## If length is given and is 0, FALSE or NULL, an empty string will be returned.
## If length is omitted, the substring starting from start until the end of the
## string will be returned.
## @return In $retval, the portion of the string, empty if not found.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred like described above; i.e.: the length f the
## string shorter than the start position, or a nevagive length argument giving
## a position shorter than the specified start position of the string.
#-------------------------------------------------------------------------------
function substr() {
    unset retval

    local string=$1
    if [[ -z "$string" ]]; then
        # shellcheck disable=SC2178
        retval=""
        return 1
    fi

    # If the start is considered as invalid, Bash considers it as 0 any way.
    local -i start=$2

    if ((start < 0)); then
        start=$((${#string} + start))
    fi

    if ((${#string} < start)); then
        # shellcheck disable=SC2178
        retval=""
        return 1
    fi

    # If the length is considered as invalid, Bash considers it as 0 any way.
    local -i length=$3
    if ((length < 0 && ${#string} + length < start)); then
        # shellcheck disable=SC2178
        retval=""
        return 1
    fi

    if ((length)); then
        # shellcheck disable=SC2178
        # shellcheck disable=SC2128
        retval=${string:$start:$length}
        return 0
    fi

    # shellcheck disable=SC2178
    # shellcheck disable=SC2128
    retval=${string:$start}
    return 0
}

#-------------------------------------------------------------------------------
## @fn subStr()
## @details Simple alias to substr
#-------------------------------------------------------------------------------
function subStr() {
    substr "$@"
}

#-------------------------------------------------------------------------------
## @fn __charmask()
## @private
## @details Build a bit mask array where each element corresponds to an
## indicator corresponding to the presence or not of the characters from the
## pattern in the extended ascii table. This function is actually needed
## to extend a pattern like 'a..z' to the full alphabet.
## @param $string The pattern of characters (escaped chars supported) to extend.
## @return In $retval, the array of bit mask.
## @retval 0 Always, as up to now, we do not check if the pattern is valid.
#-------------------------------------------------------------------------------
function __charmask() {
    unset retval

    # Expand the \t\n etc. characters putting the result in the variable
    # specified with '-v'. Using a subshell does not work and the trailing \n
    # is not expanded, requiring us to add it manually, which isn't convenient.
    # Disable shellcheck. The latter complains the variable will be
    # interpreted, which is especially what we want to do.
    local string=""
    # shellcheck disable=2059
    printf -v string "$1"

    local -i len=${#string}
    local -i charNumber=0
    local -i end=0

    local -i i=0
    for ((i = 0; i < 256; i++)); do
        retval[i]=0
    done

    for ((i = 0; i < len; i++)); do

        # Get the number value of the char
        charNumber=$(LC_CTYPE=C printf '%d' "'${string:i:1}")

        if ((i + 3 < len)) &&
           [[ "${string:i + 1:1}" == "." &&
              "${string:i + 2:1}" == "." &&
              "${string:i + 3:1}" > "${string:i:1}" || 
              "${string:i + 3:1}" == "${string:i:1}" ]]; then

            end=$(LC_CTYPE=C printf '%d' "'${string:i + 3:1}")
            for ((j = charNumber; j < end; j++)); do
                retval[charNumber + j]=1
            done

            ((i+=3))

        else
            retval[charNumber]=1
        fi
    done

    return 0
}

#-------------------------------------------------------------------------------
## @fn __trim()
## @private
## @details Trim a string according to the location from which we want to trim
## (left, right or both sides).
## @param $string The string to trim.
## @param $pattern The pattern of characters (escaped chars supported) to trim
## from the string.
## @param $mode The mode (1, 2 or 3 corresponding to left, right or trimming
## from both sides).
## @return In $retval, the array of bit mask.
## @retval 0 Always, as up to now, we do not check if the pattern is valid.
#-------------------------------------------------------------------------------
function __trim() {
    # We do not want to interpret/expand the values of the string as the latter
    # might contains chars like '\t' which could be interpreted otherwise
    local string=""
    # shellcheck disable=2059
    printf -v string "$1"
    local pattern=""
    # Disable shellcheck. The latter complains the variable will be
    # interpreted, which is especially what we want to do.
    # shellcheck disable=2059
    printf -v pattern "$2"
    local -i len=${#string}
    local -i mode=$3
    local -i start=0
    local -i charNumber=0
    local -i i=0

    if [[ "$pattern" ]]; then
        if ((len == 1)); then
            if ((mode & 1)); then
                for ((i = 0; i < len; i++)); do
                    if [[ "${string:i:1}" == "${pattern:0:1}" ]]; then
                        ((start++))
                    else
                        break
                    fi
                done
            fi
            if ((mode & 2)); then
                if ((len > 0)); then
                    for ((i = len - 1; i != 0; i--)); do
                        if [[ "${string:i:1}" == "${pattern:0:1}" ]]; then
                            ((len--))
                        else
                            break
                        fi
                    done
                fi
            fi
        else
            __charmask "$pattern"
            if ((mode & 1)); then
                for ((i = 0; i < len; i++)); do
                    charNumber=$(LC_CTYPE=C printf '%d' "'${string:i:1}")
                    if [[ "${retval[charNumber]}" == "1" ]]; then
                        ((start++))
                    else
                        break
                    fi
                done
            fi
            if ((mode & 2)); then
                if ((len > 0)); then
                    for ((i = len; i > 0; i--)); do
                        charNumber=$(LC_CTYPE=C printf '%d' "'${string:i - 1:1}")
                        if [[ "${retval[charNumber]}" == "1" ]]; then
                            ((len--))
                        else
                            break
                        fi
                    done
                fi
            fi
        fi

    else
        if ((mode & 1)); then
            for ((i = 0; i < len; i++)); do
                if [[ "${string:i:1}" < $' ' ||
                      "${string:i:1}" == $' ' ]] &&
                   [[ "${string:i:1}" == $' ' ||
                      "${string:i:1}" == $'\n' ||
                      "${string:i:1}" == $'\r' ||
                      "${string:i:1}" == $'\t' ||
                      "${string:i:1}" == $'\v' ]]; then
                    ((start++))
                else
                    break
                fi
            done
        fi
        if ((mode & 2)); then
            if ((len > 0)); then
                for ((i = len; i != 0; i--)); do
                    if [[ "${string:i:1}" < $' ' ||
                          "${string:i:1}" == $' ' ]] &&
                       [[ "${string:i:1}" == $' ' ||
                          "${string:i:1}" == $'\n' ||
                          "${string:i:1}" == $'\r' ||
                          "${string:i:1}" == $'\t' ||
                          "${string:i:1}" == $'\v' ]]; then
                        ((len--))
                    else
                        break
                    fi
                done
            fi
        fi
    fi

    ((len-=start))

    if (("${#string}" == len)); then
        # shellcheck disable=SC2178
        retval="$string"
    else
        # shellcheck disable=SC2178
        retval="${string:start:len}"
    fi
}

#-------------------------------------------------------------------------------
## @fn trim()
## @details Strip whitespace (or other characters) from the beginning and end
## of a string
## @param The string to trim.
## @param The mask of character to trim. By default, the mask corresponds to
## " \t\n\r\v". Contrary to PHP, handling \0 (the NUL byte) is not possible.
## Chars like '\x0B' are thus not taken into account. Even if there are way to
## interpret the NUL characters, there are other dusty corners to handle. Even
## if we were able to handle them, we will still have to handle them for the
## string to trim itself. src.: http://stackoverflow.com/a/24511770/3514658
## Range of characters can be specified with 2 dots '..'. e.g.: a..z
## @return In $retval, the trimmed string.
## @retval 0 Always, as up to now, we do not check if the pattern or string are
## valid.
#-------------------------------------------------------------------------------
function trim() {
    unset retval
    __trim "$1" "$2" 3
    return 0
}

#-------------------------------------------------------------------------------
## @fn trim()
## @details Same as trim() but only trim chars from the left.
#-------------------------------------------------------------------------------
function ltrim() {
    unset retval
    __trim "$1" "$2" 1
    return 0
}

#-------------------------------------------------------------------------------
## @fn trim()
## @details Same as trim() but only trim chars from the right.
#-------------------------------------------------------------------------------
function rtrim() {
    unset retval
    __trim "$1" "$2" 2
    return 0
}

#-------------------------------------------------------------------------------
## @fn getScriptDirectory()
## @details Get the directory where this file is stored in, if that directory is
## a symlink, follow that symlink.
## src.: http://stackoverflow.com/questions/59895/
## @return In $retval, the directory of the current directory, retval empty on
## error.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function getScriptDirectory() {
    unset retval

    if requireDeps "readlink"; then
        # shellcheck disable=SC2178
        retval=""
        return 1
    fi

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
    # shellcheck disable=SC2178
    retval="$dir"
    return 0
}

#-------------------------------------------------------------------------------
## @fn get_script_directory()
## @details Simple alias to getScriptDirectory
#-------------------------------------------------------------------------------
function get_script_directory() {
    getScriptDirectory
}

#-------------------------------------------------------------------------------
## @fn getScriptName()
## @details Get the script name from the top of the call stack.
## @return In $retval, the name of the script.
## @retval 0 Always return 0.
#-------------------------------------------------------------------------------
function getScriptName() {
    unset retval
    # If we run ./someTest/test.sh and the latter sources
    # /home/user/someScript.sh, BASH_SOURCE[0] will be
    # /home/user/someScript.sh and BASH_SOURCE[1] will be
    # ./someTest/test.sh. The purpose here is to take the parent of the
    # script, thus "test.sh". We need to take the last element of the
    # BASH_SOURCE array and get its file name by removing up to the last
    # / if any.
    # shellcheck disable=SC2178
    retval="${BASH_SOURCE[${#BASH_SOURCE[@]} - 1]##*/}"
    return 0
}

#-------------------------------------------------------------------------------
## @fn get_script_name()
## @details Simple alias to getScriptName
#-------------------------------------------------------------------------------
function get_script_name() {
    getScriptName "$@"
}

#-------------------------------------------------------------------------------
## @fn basename()
## @details Get filename fron string without path
## @param $path The string containing the path to a file or directory from
## which to get the filename.
## @param $suffix If the name component ends in suffix this will also be cut
## off.
## @return In $retval, the filename substring or empty on error.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function basename() {
    unset retval
    if [[ -z "$1" ]]; then
        # shellcheck disable=SC2178
        retval=""
        return 1
    fi
    # Get filename with extension
    # shellcheck disable=SC2178
    retval="${string##*/}"

    # Remove the specified extension or remove it all all if nothing is
    # specified.
    if [[ -n "$2" ]]; then
        # shellcheck disable=SC2178
        retval="${retval%$2}"
    else
        # shellcheck disable=SC2178
        retval="${retval%.*}"
    fi
    return 0
}

#-------------------------------------------------------------------------------
## @fn baseName()
## @details Simple alias to basename
#-------------------------------------------------------------------------------
function baseName() {
    basename "$@"
}

#-------------------------------------------------------------------------------
## @fn pathinfo()
## @details Return as an array information about a file path.
## @param $path The path to be parsed.
## @param $options The specific info of the path info array to return:
## PATHINFO_DIRNAME | PATHINFO_BASENAME | PATHINFO_EXTENSION | PATHINFO_FILENAME
## @return In $retval, if the options parameter is not passed, an associative
## array containing the following elements is returned: dirname, basename,
## extension (if any), and filename. If options is present, returns a string
## containing the requested element.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function pathinfo() {
    unset retval
    if [[ -z "$1" ]]; then
        return 1
    fi
    declare -A retval
    local path="$1"

    retval['dirname']="${path%/*}"
    retval['basename']="${path##*/}"
    retval['extension']="${path/\/*.}"
    retval['filename']=${retval['basename']%.*}

    if [[ -z "$2" ]]; then
        return 0
    fi

    local pathinfo
    case "$2" in
        PATHINFO_DIRNAME)
            pathinfo="${retval['dirname']}"
            ;;

        PATHINFO_BASENAME)
            pathinfo="${retval['basename']}"
            ;;

        PATHINFO_EXTENSION)
            pathinfo="${retval['extension']}"
            ;;

        PATHINFO_FILENAME)
            pathinfo="${retval['filename']}"
            ;;
        *)
            unset retval
            # shellcheck disable=SC2178
            retval=""
            return 1
            ;;
    esac

    unset retval
    declare retval
    retval="$pathinfo"
    return 0
}

#-------------------------------------------------------------------------------
## @fn pathInfo()
## @details Simple alias to pathinfo
#-------------------------------------------------------------------------------
function pathInfo() {
    pathinfo "$@"
}

#-------------------------------------------------------------------------------
## @fn isRunInBackground()
## @details Check if the process whose pid has been specified is run in
## background or not. Default the current pid.
## @param $pid The pid of the process to check.
## @return In $retval, true if the process is actually really run in
## background, false if it isn't. Empty if an issue occurred.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function isRunInBackground() {
    unset retval

    if [[ -z "$1" ]]; then
        local pid="$1"
    else
        local pid="$$"
    fi

    if [[ ! -f "/proc/$pid/stat" ]]; then
        return 1
    fi

    # This is crucial to leave the variable unquoted and have a clean IFS
    IFS=$' \t\n'
    local status=($(</proc/$pid/stat))

    # If reading the proc stat file fails, both array element will be empty and
    # the following condition will execute.
    if [[ "${status[3]}" == "${status[7]}" ]]; then
        retval=true
        return 0
    fi
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
## @fn is_run_in_background()
## @details Simple alias to isRunInBackground
#-------------------------------------------------------------------------------
function is_run_in_background() {
    isRunInBackground "$@"
}

#-------------------------------------------------------------------------------
## @fn isRunAsRoot()
## @details Check if the the current process is run as root.
## @param $pid The pid of the process to check.
## @return In $retval, true if the process is actually really run in
## background, false if it isn't. Empty if an issue occurred.
## @retval 0 If it is run as root.
## @retval 1 If it is not run as root.
#-------------------------------------------------------------------------------
function isRunAsRoot() {
    unset retval

    # EID is a bashism. POSIX compliant shells still need to rely on the id
    # command.
    # src.: https://askubuntu.com/q/15853#comment735375_15856
    if ((EUID == 0)); then
        retval=true
        return 0
    fi

    retval=false
    return 1
}

#-------------------------------------------------------------------------------
## @fn is_run_as_root()
## @details Simple alias to isRunAsRoot
#-------------------------------------------------------------------------------
function is_run_as_root() {
    isRunAsRoot
}

#-------------------------------------------------------------------------------
## @fn in_array()
## @details Search if the value is in the array.
## @param $pattern The pattern to search for.
## @param $array The array values to search in.
## @note The array needs to be passed like the following to the function:
## in_array "$pattern" array[@].
## @return In $retval, true if the pattern is found in the background, false if
## it isn't.
## @retval 0 If the pattern is in the array.
## @retval 1 If the pattern is not in the array or if an issue occurred.
#-------------------------------------------------------------------------------
function in_array() {
    local pattern="$1"
    if [[ -z "$2" ]]; then
        return 1
    fi
    local -a array=("${!2}")
    local arraySize=${#array[@]}
    for ((i = 1; i < arraySize; i++)) {
        if [ "${array[i]}" == "$pattern" ]; then
            retval=true
            return 0
        fi
    }
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
## @fn inArray()
## @details Simple alias to inArray
#-------------------------------------------------------------------------------
function inArray() {
    in_array "$@"
}

#-------------------------------------------------------------------------------
## @fn isArraysEqual()
## @details Search if both arrays (all types) are equal.
## @note The tables must be passed *AS NAME* as myTable not as $myTable[@] nor
## ${myTable[@]} and requires Bash 4.3. This is inspired from
## http://stackoverflow.com/a/17990637/3514658 and from
## http://stackoverflow.com/a/4017175/3514658.
## @param $arrayA The array to compare, passed as arrayA[@].
## @param $arrayB The second array passed as arrayB[@] against which to
## compare the first array.
## @return In $retval, true if the array are equal, false if they are not.
## @retval 0 If the array are equal.
## @retval 1 If the array are not equal or an issue occurred.
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
        error "isArraysEqual() accessing using dereference with -n"\
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
## @fn is_bash_array_equal()
## @details Simple alias to isBashArraysEqual
#-------------------------------------------------------------------------------
function is_bash_arrays_equal() {
    isBashArraysEqual "$@"
}

#-------------------------------------------------------------------------------
## @fn isBashOlder()
## @details Check if bash is older than the one specified.
## @param $major Bash major version.
## @param $minor Bash minor version.
## @param $patch Bash patch release.
## @return In $retval, true if Bash is older than the version specified, false
## if it is not.
## @retval 0 If Bash is actually older and no issue occurred.
## @retval 1 If Bash is not older or an issue occurred.
#-------------------------------------------------------------------------------
function isBashOlder() {
    unset retval

    if [ $# -ne 3 ]; then
        error "\"${FUNCNAME[0]}\" must have exactly 3 arguments: major minor patch"
        return 1
    fi

    if [ "${BASH_VERSINFO[0]}" -lt "$1" ]; then
        retval=true
        return 0
    fi

    if [ "${BASH_VERSINFO[1]}" -lt "$2" ]; then
        retval=true
        return 0
    fi

    if [ "${BASH_VERSINFO[2]}" -lt "$3" ]; then
        retval=true
        return 0
    fi
    retval=false
    return 1
}

#-------------------------------------------------------------------------------
## @fn isBashOlder()
## @details Simple alias to is_bash_older
#-------------------------------------------------------------------------------
function is_bash_older() {
    isBashOlder "$@"
}

#-------------------------------------------------------------------------------
## @fn unsetFunctions()
## @details Store all function declarations of a bash script to a destination
## file. If no destination has been specified, the functions declared in the
## bash script will be undeclared except if a third argument "retval" is
## declared.
## @param $file The file to check for function declarations.
## @param $destination The destination file to store the function unsets
## (optional).
## @param $flag A flag guard used to specify if we want the functions to be
## returned in retval as an array (optional).
## @return In $retval, the functions declared in the bash script will be
## returned in $retval as an array only if the destination is empty and the
## third argument is "retval", otherwise $retval is not used/left untouched.
## @retval 0 If no issue occurred.
## @retval 1 If an issue occurred.
#-------------------------------------------------------------------------------
function unsetFunctions() {
    local file="$1"
    local destination="$2"

    if [ ! -f "$file" ]; then
        error "\"$file\" is not a file. Aborted."
        return 1
    fi

    if [ ! -r "$file" ]; then
        error "\"$file\" is not readable. Aborted."
        return 1
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

        if strpos "$line" "function " && \
           strpos "$line" "() {"; then

            explode "function " "$line" "function "

            explode "${retval[1]}" "() {"
            if [ -z "$destination" ]; then
                if [[ "$3" == "retval" ]]; then
                    funcs+=("${retval[0]}")
                else
                    unset -f ${retval[0]}
                fi
            else
                echo "unset -f ${retval[0]}" >> "$destination"
            fi
        fi
    done < "$file"

    # Copy the local array to the global variable (quotes are indeed needed)
    # http://stackoverflow.com/a/24323275/3514658
    if [[ "$3" == "retval" ]]; then
        # shellcheck disable=SC2190
        retval=("${funcs[@]}")
    fi
    return 0
}

#-------------------------------------------------------------------------------
## @fn unset_functions()
## @details Simple alias to unsetFunctions
#-------------------------------------------------------------------------------
function unset_functions() {
    unsetFunctions "$@"
}

# Used to execute the main code only when the script is executed directly not
# sourced.
if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    echo "This script is a library and is not intended to be run directly."
fi
