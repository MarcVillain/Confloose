#!/bin/bash

COLOR_RED="\e[31m"
COLOR_GREEN="\e[32m"
COLOR_BLINK="\e[5m"
COLOR_RESET="\e[0m"

err_to_erase=0
actions=()
options=()

display_actions()
{
    echo "Actions:"
    echo -e "  1) ${COLOR_BLINK}run${COLOR_RESET}"
    i=2
    IFS=""
    for action in ${actions[@]}; do
        index=$((i - 2))

        # Color
        if [ ${options[$index]} -eq 0 ]; then
            echo -ne "$COLOR_RED"
        else
            echo -ne "$COLOR_GREEN"
        fi

        # Text
        echo -n "  $i) $action"

        # Reset
        echo -e "$COLOR_RESET"
        i=$((i + 1))
    done
    echo
    echo "  0) cancel"
    echo
}

erase_stdout()
{
    amount="$1"
    while [ $amount -gt 0 ]; do
        tput cuu1
        tput el
        amount=$((amount - 1))
    done
    err_to_erase=0
}

prompt_options()
{
    # Extract given data
    while [ $# -gt 0 ]; do
        actions+=("$1")
        options+=("$2")
        shift 2
    done

    actions_count="${#actions[@]}"

    display_actions

    while true; do
        # Ask for input
        echo -n "Select:"
        read selected

        # Check input is numeric
        re='^[0-9]+$'
        if ! [[ $selected =~ $re ]] ; then
            echo "error: Not a number" >&2
            selected=-1
            continue
        fi

        # Check input is in bounds
        if [ $((selected - 1)) -gt $actions_count ]; then
            echo "error: Input value too high"
            selected=-1
            err_to_erase=$((err_to_erase + 2))
            continue
        fi

        # Handle exit option (value 0)
        if [ $selected -eq 0 ]; then
            echo "Canceled!"
            exit 1
        fi

        # Handle run option
        if [ $selected -eq 1 ]; then
            echo "Running..."
            break
        fi

        # Switch option
        curr_index=$((selected - 2))
        curr_option=${options[$curr_index]}
        options[$curr_index]=$(((curr_option + 1) % 2))

        # Override display
        erase_stdout $((6 + actions_count + err_to_erase))
        display_actions
    done
}
