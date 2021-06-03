if status --is-interactive
    alias ping="prettyping --nolegend"
    alias top="htop"
    abbr -a k kubectl
    abbr -a kg kubectl get
    abbr -a kgp kubectl get pods
    abbr -a kctx kubectx
    abbr -a kns kubens
    abbr -a kget kubectl get events --sort-by='.lastTimestamp'
    abbr -a hp kubens haystack-production-app
    abbr -a hb kubens haystack-beta-app
    abbr -a kc kubectl config current-context
    alias khpe="kubectx haystack-production-us-east-1 && kubens haystack-production-app"
    alias khpw="kubectx haystack-production-us-west-2 && kubens haystack-production-app"
    alias khse="kubectx haystack-staging-us-east-1 && kubens haystack-staging-app"
    alias khsw="kubectx haystack-staging-us-west-2 && kubens haystack-staging-app"
    alias khbe="kubectx haystack-beta-us-east-1 && kubens haystack-beta-app"
    alias khbw="kubectx haystack-beta-us-west-2 && kubens haystack-beta-app"
    alias khsel="khse && kubens logging"
    alias khswl="khsw && kubens logging"
    alias khpel="khpe && kubens logging"
    alias khbel="khbe && kubens logging"
    alias khpwl="khpw && kubens logging"
    alias kde="kubectl get pods | grep Evicted | awk '{print $1}'|xargs -n 1 kubectl delete pod"
end
