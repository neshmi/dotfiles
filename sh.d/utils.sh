fixpow(){
    sudo pfctl -f /etc/pf.conf; sudo pfctl -e
}

# Remove the first character of $@ and return the rest
lchop(){
    realized_args=$(echo "$@")
    chopped_args="${realized_args:1}"
    echo $chopped_args
}

# Turn 'gi tadd' into 'git add' and so forth
for command in docker git cat ping
do
    eval "${command:0:-1}(){ ${command} \$(lchop "\$@") }"
done
