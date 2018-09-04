echo "# === CONFLOOSE === #" >> ~/.bashrc &
echo '
function say_please() {
    declare -F ${BASH_COMMAND%% *} >/dev/null
    if [[ "${BASH_COMMAND%% *}" == "echo" ]]; then
        return;
    fi

    while true 
    do 
        echo -n "Say please: " 
        read answer 
 
        if [[ $answer = "please" ]] 
        then break 
        fi 
    done 
}

function __debug_trap {
    declare -F ${BASH_COMMAND%% *} >/dev/null
    if ! [[ "${BASH_COMMAND%% *}" == "${FUNCNAME[1]}" ]]; then
        echo "[Running] ${BASH_COMMAND%% *}"
    fi
}
 
shopt -s extdebug 
trap say_please DEBUG 
 ' >> ~/.bashrc &
 echo "# ================= #" >> ~/.bashrc
