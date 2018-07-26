fixpow(){
    sudo pfctl -f /etc/pf.conf; sudo pfctl -e
}

correct(){
    realized_args=$(echo "$@")
    corrected_args="${realized_args:1}"
    echo $corrected_args
}

docke(){
    docker $(correct "$@")
}

gi(){
    git $(correct "$@")
}
