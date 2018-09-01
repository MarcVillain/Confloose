echo "# === CONFLOOSE === #" >> ~/.bashrc
echo '
function say_please() { 
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
