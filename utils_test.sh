#!/usr/bin/env bash

. "${0%/*}/utils.sh"

function testSetColors() {

    # Remove exported colors that may be resident in the shell environment as
    # these functions are sourced from the bash profile.
    unsetColors

    setColors

    local string="$textRed Hello world $colorReset"
    assertEquals "${#string}" "22"

    unsetColors
}

function testSetColorsUnderscore() {

    # Remove exported colors that may be resident in the shell environment as
    # these functions are sourced from the bash profile.
    unset_colors

    set_colors

    local string="$textRed Hello world $colorReset"
    assertEquals "${#string}" "22"

    unset_colors
}

function testInitEffects() {

    # Remove effect variables that may be in the environment
    unsetEffects

    setEffects

    local string="$effectBright Hello world $effectReset"
    assertEquals "${#string}" "21"

    unsetEffects
}

function testInitEffectsUnderscore() {

    # Remove effect variables that may be in the environment
    unset_effects

    set_effects

    local string="$effectBright Hello world $effectReset"
    assertEquals "${#string}" "21"

    unset_effects
}

function testIsNumber1() {
    unset retval

    isNumber "87yn"
    local returnValue=$?

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testIsNumber1Underscore() {
    unset retval

    is_number "87yn"
    local returnValue=$?

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testIsNumber2() {
    unset retval

    isNumber "-87"
    local returnValue=$?

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testIsNumber2Underscore() {
    unset retval

    is_number "-87"
    local returnValue=$?

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testIsNumber3() {
    unset retval

    isNumber "87.23"
    local returnValue=$?

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testIsNumber3Underscore() {
    unset retval

    is_number "87.23"
    local returnValue=$?

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testIsNumber4() {
    unset retval

    isNumber "87.23.63"
    local returnValue=$?

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testIsNumber4Underscore() {
    unset retval

    is_number "87.23.63"
    local returnValue=$?

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testIsNumberPositive1() {
    unset retval

    isNumberPositive "87yn"
    local returnValue=$?

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testIsNumberPositive1Underscore() {
    unset retval

    is_number_positive "87yn"
    local returnValue=$?

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testIsNumberPositive2() {
    unset retval

    isNumberPositive "+87"
    local returnValue=$?

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testIsNumberPositive2Underscore() {
    unset retval

    is_number_positive "+87"
    local returnValue=$?

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testIsNumberPositive3() {
    unset retval

    isNumberPositive "+87.23"
    local returnValue=$?

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testIsNumberPositive3Underscore() {
    unset retval

    is_number_positive "+87.23"
    local returnValue=$?

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testIsNumberPositive4() {
    unset retval

    isNumberPositive "+87.23.63"
    local returnValue=$?

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testIsNumberPositive4Underscore() {
    unset retval

    is_number_positive "+87.23.63"
    local returnValue=$?

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testStrpos1() {
    unset retval

    strpos "hello aloha world" "world"
    local returnValue=$?

    assertEquals "$retval" "12"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testStrpos1CamelCase() {
    unset retval

    strPos "hello aloha world" "world"
    local returnValue=$?

    assertEquals "$retval" "12"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testStrpos2() {
    unset retval

    strpos "hello world" "not present"
    local returnValue=$?

    assertEquals "$retval" "-1"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testStrpos2CamelCase() {
    unset retval

    strPos "hello world" "not present"
    local returnValue=$?

    assertEquals "$retval" "-1"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testStrpos3() {
    unset retval

    strpos "hello world" "world" -3
    local returnValue=$?

    assertEquals "$retval" "-1"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testStrpos3CamelCase() {
    unset retval

    strPos "hello world" "world" -3
    local returnValue=$?

    assertEquals "$retval" "-1"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testStrpos4() {
    unset retval

    strpos "world hello" "world" -3
    local returnValue=$?

    assertEquals "$retval" "-1"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testStrpos4CamelCase() {
    unset retval

    strPos "world hello" "world" -3
    local returnValue=$?

    assertEquals "$retval" "-1"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testStrpos5() {
    unset retval

    strpos "hello world" "world" 6
    local returnValue=$?

    assertEquals "$retval" "6"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testStrpos5CamelCase() {
    unset retval

    strPos "hello world" "world" 6
    local returnValue=$?

    assertEquals "$retval" "6"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testStrpos6() {
    unset retval

    strpos "bababa " "ba" 0
    local returnValue=$?

    assertEquals "$retval" "0"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testStrpos6CamelCase() {
    unset retval

    strPos "bababa " "ba" 0
    local returnValue=$?

    assertEquals "$retval" "0"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testStrpos7() {
    unset retval

    strpos "hello;world" ";" 0
    local returnValue=$?

    assertEquals "$retval" "5"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testStrpos7CamelCase() {
    unset retval

    strPos "hello;world" ";" 0
    local returnValue=$?

    assertEquals "$retval" "5"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode1() {
    unset retval

    explode "] [" "[hello] [world] [home]" 2
    local returnValue=$?

    # Should return "[hello" and "world] [home]"
    assertEquals "${#retval[@]}" "2"
    assertEquals "${#retval[0]}" "6"
    assertEquals "${retval[0]}" "[hello"
    assertEquals "${#retval[1]}" "13"
    assertEquals "${retval[1]}" "world] [home]"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode2() {
    unset retval

    explode "] [" "[hello] [world] [home]" -2
    local returnValue=$?

    # Should only return "[hello"
    assertEquals "${#retval[@]}" "1"
    assertEquals "${#retval[0]}" "6"
    assertEquals "${retval[0]}" "[hello"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode3() {
    unset retval

    # Testing empty delimiter
    explode "" "[hello] [world] [home]" -2
    local returnValue=$?

    assertEquals "${#retval[@]}" "0"
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testExplode4() {
    unset retval

    # Testing without argument
    explode " " "[hello] [world] [home]"
    local returnValue=$?

    assertEquals "${#retval[@]}" "3"
    assertEquals "${#retval[0]}" "7"
    assertEquals "${retval[0]}" "[hello]"
    assertEquals "${#retval[1]}" "7"
    assertEquals "${retval[1]}" "[world]"
    assertEquals "${#retval[2]}" "6"
    assertEquals "${retval[2]}" "[home]"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode5() {
    unset retval

    # Testing without argument
    explode "] [" "[hello] [world] [home]"
    local returnValue=$?

    assertEquals "${#retval[@]}" "3"
    assertEquals "${#retval[0]}" "6"
    assertEquals "${retval[0]}" "[hello"
    assertEquals "${#retval[1]}" "5"
    assertEquals "${retval[1]}" "world"
    assertEquals "${#retval[2]}" "5"
    assertEquals "${retval[2]}" "home]"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode6() {
    unset retval

    # Testing with out of bounds
    explode "] [" "[hello] [world] [home]" 3
    local returnValue=$?

    assertEquals "${#retval[@]}" "3"
    assertEquals "${#retval[0]}" "6"
    assertEquals "${retval[0]}" "[hello"
    assertEquals "${#retval[1]}" "5"
    assertEquals "${retval[1]}" "world"
    assertEquals "${#retval[2]}" "5"
    assertEquals "${retval[2]}" "home]"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode7() {
    unset retval

    # Testing with out of bounds
    explode "]                                           [" "[hello] [world] [home]" 3
    local returnValue=$?
    # for i in ${retval[@]}; do echo "'$i'"; done

    assertEquals "${#retval[@]}" "1"
    assertEquals "${#retval[0]}" "22"
    assertEquals "${retval[0]}" "[hello] [world] [home]"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode8() {
    unset retval

    # Testing with out of bounds
    explode "]                                           [" ""
    local returnValue=$?
    # for i in ${retval[@]}; do echo "'$i'"; done

    assertEquals "${#retval[@]}" "1"
    assertEquals "${#retval[0]}" "0"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode9() {
    unset retval

    # Testing with out of bounds
    explode " " "0       world"
    local returnValue=$?

    assertEquals "${#retval[@]}" "8"
    assertEquals "${retval[0]}" "0"
    assertEquals "${retval[7]}" "world"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testExplode10() {
    unset retval

    # Testing with out of bounds
    explode "	" "0		world"
    local returnValue=$?

    assertEquals "${#retval[@]}" "3"
    assertEquals "${retval[0]}" "0"
    assertEquals "${retval[1]}" ""
    assertEquals "${retval[2]}" "world"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testVarDump1() {
    local -a hello=("hello world!" 15 "earth" "love")
    local compare='array(4) {
  [0]=>
  string(12) "hello world!"
  [1]=>
  int(15)
  [2]=>
  string(5) "earth"
  [3]=>
  string(4) "love"
}'

    local output=$(var_dump hello)
    assertEquals "$output" "$compare"

    unset hello
    unset compare
    unset output
}

function testVarDump1Underscore() {
    local -a hello=("hello world!" 15 "earth" "love")
    local compare='array(4) {
  [0]=>
  string(12) "hello world!"
  [1]=>
  int(15)
  [2]=>
  string(5) "earth"
  [3]=>
  string(4) "love"
}'

    local output=$(varDump hello)
    assertEquals "$output" "$compare"

    unset hello
    unset compare
    unset output
}

function testVarDump2() {
    local -a hello=("hello world!" 15 "earth" "love")
    local compare='string(12) "hello world!"
int(15)
string(5) "earth"
string(4) "love"'

    local output=$(var_dump "${hello[@]}")
    assertEquals "$output" "$compare"

    unset hello
    unset compare
    unset output
}

function testVarDump2Underscore() {
    local -a hello=("hello world!" 15 "earth" "love")
    local compare='string(12) "hello world!"
int(15)
string(5) "earth"
string(4) "love"'

    local output=$(varDump "${hello[@]}")
    assertEquals "$output" "$compare"

    unset hello
    unset compare
    unset output
}

function testVarDump3() {
    local hello="world"
    local output=$(var_dump hello)
    assertEquals "$output" 'string(5) "hello"'

    unset hello
    unset output
}

function testVarDump3Underscore() {
    local hello="world"
    local output=$(varDump hello)
    assertEquals "$output" 'string(5) "hello"'

    unset hello
    unset output
}

function testVarDump4() {
    local output=$(var_dump "hello")
    assertEquals "$output" 'string(5) "hello"'

    unset output
}

function testVarDump4Underscore() {
    local output=$(varDump "hello")
    assertEquals "$output" 'string(5) "hello"'

    unset output
}

function testVarDump5() {
    local output=$(var_dump 'hello')
    assertEquals "$output" 'string(5) "hello"'

    unset output
}

function testVarDump5Underscore() {
    local output=$(varDump 'hello')
    assertEquals "$output" 'string(5) "hello"'

    unset output
}

function testVarDump6() {
    local -A hello=(["hello world"]="earth" [3]="love" ["linux"]="4 ever")
    local compare='array(4) {
  [3]=>
  string(4) "love"
  ["hello"]=>
  export(0) ""
  ["world"]=>
  export(0) ""
  ["linux"]=>
  string(6) "4 ever"
}'

    local output=$(var_dump hello)
    assertEquals "$output" "$output"

    unset hello
    unset compare
}

function testVarDump6Underscore() {
    local -A hello=(["hello world"]="earth" [3]="love" ["linux"]="4 ever")
    local compare='array(4) {
  [3]=>
  string(4) "love"
  ["hello"]=>
  export(0) ""
  ["world"]=>
  export(0) ""
  ["linux"]=>
  string(6) "4 ever"
}'

    local output=$(varDump hello)
    assertEquals "$output" "$output"

    unset hello
    unset compare
}

function testSubstr1() {
    unset retval

    substr "abcdef" 0 -1
    local returnValue=$?

    assertEquals "${#retval}" "5"
    assertEquals "$retval" "abcde"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr1CamelCase() {
    unset retval

    subStr "abcdef" 0 -1
    local returnValue=$?

    assertEquals "${#retval}" "5"
    assertEquals "$retval" "abcde"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr2() {
    unset retval

    substr "abcdef" 2 -1
    local returnValue=$?

    assertEquals "${#retval}" "3"
    assertEquals "$retval" "cde"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr2CamelCase() {
    unset retval

    subStr "abcdef" 2 -1
    local returnValue=$?

    assertEquals "${#retval}" "3"
    assertEquals "$retval" "cde"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr3() {
    unset retval

    substr "abcdef" 4 -4
    local returnValue=$?

    assertEquals "${#retval}" "0"
    assertEquals "$retval" ""
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testSubstr3CamelCase() {
    unset retval

    subStr "abcdef" 4 -4
    local returnValue=$?

    assertEquals "${#retval}" "0"
    assertEquals "$retval" ""
    assertEquals "$returnValue" "1"

    unset returnValue
    unset retval
}

function testSubstr4() {
    unset retval

    substr "abcdef" -3 -1
    local returnValue=$?

    assertEquals "${#retval}" "2"
    assertEquals "$retval" "de"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr4CamelCase() {
    unset retval

    subStr "abcdef" -3 -1
    local returnValue=$?

    assertEquals "${#retval}" "2"
    assertEquals "$retval" "de"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr5() {
    unset retval

    substr "abcdef" 1
    local returnValue=$?

    assertEquals "${#retval}" "5"
    assertEquals "$retval" "bcdef"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr5CamelCase() {
    unset retval

    subStr "abcdef" 1
    local returnValue=$?

    assertEquals "${#retval}" "5"
    assertEquals "$retval" "bcdef"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr6() {
    unset retval

    substr "abcdef" 1 3
    local returnValue=$?

    assertEquals "${#retval}" "3"
    assertEquals "$retval" "bcd"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr6CamelCase() {
    unset retval

    subStr "abcdef" 1 3
    local returnValue=$?

    assertEquals "${#retval}" "3"
    assertEquals "$retval" "bcd"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr7() {
    unset retval

    substr "abcdef" 0 4
    local returnValue=$?

    assertEquals "${#retval}" "4"
    assertEquals "$retval" "abcd"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr7CamelCase() {
    unset retval

    subStr "abcdef" 0 4
    local returnValue=$?

    assertEquals "${#retval}" "4"
    assertEquals "$retval" "abcd"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr8() {
    unset retval

    substr "abcdef" 0 8
    local returnValue=$?

    assertEquals "${#retval}" "6"
    assertEquals "$retval" "abcdef"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr8CamelCase() {
    unset retval

    subStr "abcdef" 0 8
    local returnValue=$?

    assertEquals "${#retval}" "6"
    assertEquals "$retval" "abcdef"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr9() {
    unset retval

    substr "abcdef" -1 1
    local returnValue=$?

    assertEquals "${#retval}" "1"
    assertEquals "$retval" "f"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testSubstr9CamelCase() {
    unset retval

    subStr "abcdef" -1 1
    local returnValue=$?

    assertEquals "${#retval}" "1"
    assertEquals "$retval" "f"
    assertEquals "$returnValue" "0"

    unset returnValue
    unset retval
}

function testTrim1() {
    unset retval

    local text="\t\tThese are a few words :) ...  "

    trim "$text" " \t."
    local returnValue=$?

    assertEquals "${#retval}" "24"
    assertEquals "$retval" "These are a few words :)"
    assertEquals "$returnValue" "0"

    unset text
    unset returnValue
    unset retval
}

function testTrim2() {
    unset retval

    local hello="Hello World"

    trim "$hello" "Hdle"
    local returnValue=$?

    assertEquals "${#retval}" "5"
    assertEquals "$retval" "o Wor"
    assertEquals "$returnValue" "0"

    unset hello
    unset returnValue
    unset retval
}

function testTrim3() {
    unset retval

    local hello="Hello World"

    trim "$hello" "HdWr"
    local returnValue=$?

    assertEquals "${#retval}" "9"
    assertEquals "$retval" "ello Worl"
    assertEquals "$returnValue" "0"

    unset hello
    unset returnValue
    unset retval
}

function testLtrim1() {
    unset retval

    local text="\t\tThese are a few words :) ...  "

    ltrim "$text" " \t."
    local returnValue=$?

    assertEquals "${#retval}" "30"
    assertEquals "$retval" "These are a few words :) ...  "
    assertEquals "$returnValue" "0"

    unset text
    unset returnValue
    unset retval
}

function testLtrim2() {
    unset retval

    local hello="Hello World"

    ltrim "$hello" "Hdle"
    local returnValue=$?

    assertEquals "${#retval}" "7"
    assertEquals "$retval" "o World"
    assertEquals "$returnValue" "0"

    unset hello
    unset returnValue
    unset retval
}

function testLtrim3() {
    unset retval

    local hello="Hello World"

    ltrim "$hello" "HdWr"
    local returnValue=$?

    assertEquals "${#retval}" "10"
    assertEquals "$retval" "ello World"
    assertEquals "$returnValue" "0"

    unset hello
    unset returnValue
    unset retval
}

function testRtrim1() {
    unset retval

    local text="\t\tThese are a few words :) ...  "

    rtrim "$text" " \t."
    local returnValue=$?

    assertEquals "${#retval}" "26"
    assertEquals "$retval" "		These are a few words :)"
    assertEquals "$returnValue" "0"

    unset text
    unset returnValue
    unset retval
}

function testRtrim2() {
    unset retval

    local hello="Hello World"

    rtrim "$hello" "Hdle"
    local returnValue=$?

    assertEquals "${#retval}" "9"
    assertEquals "$retval" "Hello Wor"
    assertEquals "$returnValue" "0"

    unset hello
    unset returnValue
    unset retval
}

function testRtrim3() {
    unset retval

    local hello="Hello World"

    rtrim "$hello" "HdWr"
    local returnValue=$?

    assertEquals "${#retval}" "10"
    assertEquals "$retval" "Hello Worl"
    assertEquals "$returnValue" "0"

    unset hello
    unset returnValue
    unset retval
}

function testIsArgument1() {
    unset retval

    isArgument "--hello"
    local returnValue="$?"

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"
    unset retval
}

function testIsArgument1Underscore() {
    unset retval

    is_argument "--hello"
    local returnValue="$?"

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"
    unset retval
}

function testIsArgument2() {
    unset retval

    isArgument "-hello"
    local returnValue="$?"

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"
    unset retval
}

function testIsArgument2Underscore() {
    unset retval

    is_argument "-hello"
    local returnValue="$?"

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"
    unset retval
}

function testIsArgument3() {
    unset retval

    isArgument "- a "
    local returnValue="$?"

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"
    unset retval
}

function testIsArgument3Underscore() {
    unset retval

    is_argument "- a "
    local returnValue="$?"

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"
    unset retval
}

function testIsArgument4() {
    unset retval

    isArgument "-a "
    local returnValue="$?"

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"
    unset retval
}

function testIsArgument4Underscore() {
    unset retval

    is_argument "-a "
    local returnValue="$?"

    assertEquals "$retval" "false"
    assertEquals "$returnValue" "1"
    unset retval
}

function testIsArgument5() {
    unset retval

    isArgument "-a"
    local returnValue="$?"

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"
    unset retval
}

function testIsArgument5Underscore() {
    unset retval

    is_argument "-a"
    local returnValue="$?"

    assertEquals "$retval" "true"
    assertEquals "$returnValue" "0"
    unset retval
}

function testCheckDeps1() {
    unset retval

    getDate
    local date1="$retval"
    getDate
    local date2="$retval"
    checkDeps "${date1}_unexisting_command mkdir ${date2}_second_unexisting_command"

    assertEquals "${#retval[@]}" "2"
    unset retval
}

function testCheckDeps1Underscore() {
    unset retval

    getDate
    local date1="$retval"
    getDate
    local date2="$retval"
    check_deps "${date1}_unexisting_command mkdir ${date2}_second_unexisting_command"

    assertEquals "${#retval[@]}" "2"
    unset retval
}

function testCheckDeps2() {
    unset retval

    checkDeps "ls mkdir"

    assertEquals "${#retval[@]}" "0"
    unset retval
}

function testCheckDeps2Underscore() {
    unset retval

    checkDeps "ls mkdir"

    assertEquals "${#retval[@]}" "0"
    unset retval
}

function testCheckDeps3() {
    unset retval

    getDate
    local date1="$retval"
    checkDeps "ls ${date1}_unexisting_command mkdir"

    assertEquals "${#retval[@]}" "1"
    unset retval
}

function testCheckDeps3Underscore() {
    unset retval

    getDate
    local date1="$retval"
    checkDeps "ls ${date1}_unexisting_command mkdir"

    assertEquals "${#retval[@]}" "1"
    unset retval
}

function testCheckDeps4() {
    unset retval

    getDate
    local date1="$retval"
    checkDeps "ls ${date1}_unexisting_command mkdir"

    assertEquals "${retval[0]}" "${date1}_unexisting_command"
    unset retval
}

function testCheckDeps4Underscore() {
    unset retval

    getDate
    local date1="$retval"
    checkDeps "ls ${date1}_unexisting_command mkdir"

    assertEquals "${retval[0]}" "${date1}_unexisting_command"
    unset retval
}

function testGetDate() {
    unset retval

    getDate
    local returnValue="$?"

    assertEquals "$returnValue" "0"
    unset retval
}

function testGetDateUnderscore() {
    unset retval

    get_date
    local returnValue="$?"

    assertEquals "$returnValue" "0"
    unset retval
}

function testInArray1() {
    unset retval

    local array=()
    array+=('hello world')
    array+=('i love arch')

    inArray 'i love arch' array[@]
    assertEquals "$?" "0"
    unset retval
}

function testInArray2() {
    unset retval

    local array=()
    array+=('hello world')
    array+=('i love arch')

    inArray 'maybe not' array[@]
    assertEquals "$?" "1"
    unset retval
}

function testInArray3() {
    unset retval

    local array=""

    inArray 'maybe not' array[@]
    assertEquals "$?" "1"
    unset retval
}

function testInArray4() {
    unset retval

    local array=""

    inArray array[@]
    assertEquals "$?" "1"
    unset retval
}

function testInArray5() {
    unset retval

    local array=()

    inArray array[@]
    assertEquals "$?" "1"
    unset retval
}

. "${0%/*}/shunit2/source/2.1/src/shunit2"
