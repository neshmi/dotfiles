if status --is-interactive
    abbr --add bi bundle install
    abbr --add be bundle exec
    which prettyping > /dev/null && alias ping="prettyping --nolegend"
    which htop > /dev/null && alias top="htop"
    abbr -a k kubectl
    abbr -a kg kubectl get
    abbr -a kgp kubectl get pods
    abbr -a kctx kubectx
    abbr -a kns kubens
    abbr -a kget kubectl get events --sort-by='.lastTimestamp'
    abbr -a kc kubectl config current-context
    alias kde="kubectl get pods | grep Evicted | awk '{print $1}'|xargs -n 1 kubectl delete pod"
end
