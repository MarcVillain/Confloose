scripts_count=${#scripts[@]}

# Display all scripts
display_scripts()
{
    echo "Scripts:"
    i=1
    for script in ${scripts[@]}; do
        echo "  $i) $script"
        i=$((i+1))
    done
    echo
    echo "  0) quit"
    echo
}

display_scripts

while true; do
    # Ask for input
    echo -n "Select: "
    read selected

    # Check input is numeric
    re='^[0-9]+$'
    if ! [[ $selected =~ $re ]] ; then
        echo "error: Not a number" >&2
        selected=-1
        continue
    fi

    # Check input is in bounds
    if [ $selected -gt $scripts_count ]; then
        echo "error: Input value too high"
        selected=-1
        continue
    fi

    # Handle exit option (value 0)
    if [ $selected -eq 0 ]; then
        break
    fi

    echo "-----"
    index=$((selected - 1))
    eval "run_${scripts[$index]}"

    echo "-----"
    display_scripts
done
