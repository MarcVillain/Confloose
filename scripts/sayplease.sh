echo "# === CONFLOOSE === #" >> ~/.bashrc
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
 
shopt -s extdebug 
trap say_please DEBUG 
 ' >> ~/.bashrc
 echo "# ================= #" >> ~/.bashrc
