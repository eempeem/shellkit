export DOCKER_CLI_HINTS=false
fpath=("$HOME/.docker/completions" $fpath) # provides autocomplete for docker commands
alias dockerps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}"'
