# general
alias ls='ls -G'
alias pcert='openssl x509 -noout -text'

# figure specific
alias c='cd ~/figure/code'
alias cfc='cd ~/figure/code'
alias cpc='cd ~/personal/code'
alias g='./gradlew'

# crdb
alias crdbcli='kubectl exec -it deployment/cockroachdb-client-secure -c cockroachdb-client-secure -- ./cockroach sql --certs-dir=/cockroach/cockroach-certs --host=cockroachdb-public'

# k8s
alias k='kubectl'
alias ksjq="jq '.data | map_values(@base64d)'"

# terraform
alias tws='terraform workspace select'
alias twl='terraform workspace list'
alias tum='tfenv use min-required'
alias tim='tfenv install min-required'
alias terraform-fix='terraform providers lock -platform=darwin_amd64 -platform=linux_amd64'

# git
alias gdr="git diff -- . ':(exclude)**Cargo.lock'"
