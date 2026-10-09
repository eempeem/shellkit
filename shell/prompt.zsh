function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ [\1]/p'
}
setopt PROMPT_SUBST # enable prompt expansion
# replace "%~" with "%2~" to display only the last 2 elements of the directory path
PROMPT='%F{48}%~%f%F{35}$(parse_git_branch)%f ' # green path, green git branch
#PROMPT='%F{197}%~%f%F{39}$(parse_git_branch)%f ' # red path, blue git branch
#PROMPT='%F{226}%~%f%F{39}$(parse_git_branch)%f%F{226}%f ' # yellow path, blue git branch

# ┌─────────────────┐
# │ Terminal colors │
# └─────────────────┘
# Light fff300
# Dark 2f2f2f 
# Light f2f2f2
# Green 00ff94
# Yellow e6ff00
# Orange ffbb44