if status --is-interactive
    alias ping="prettyping --nolegend"
    alias top="htop"
    alias k="kubectl"
    alias kg="kubectl get"
    alias kgp="kubectl get pods"
    alias kctx="kubectx"
    alias kns="kubens"
    alias kge="kubectl get events --sort-by='.lastTimestamp'"
end
