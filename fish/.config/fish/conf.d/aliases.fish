if status --is-interactive
    alias ping="prettyping --nolegend"
    alias top="htop"
    abbr --add bi bundle install
    abbr --add be bundle exec
    abbr -a k kubectl
    abbr -a kg kubectl get
    abbr -a kgp kubectl get pods
    abbr -a kctx kubectx
    abbr -a kns kubens
    abbr -a kget kubectl get events --sort-by='.lastTimestamp'
    abbr -a kc kubectl config current-context
    alias kde="kubectl get pods | grep Evicted | awk '{print $1}'|xargs -n 1 kubectl delete pod"
end
