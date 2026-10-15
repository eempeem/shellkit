setopt PROMPT_SUBST # enable prompt expansion
# replace "%~" with "%2~" to display only the last 2 elements of the directory path
PROMPT='%F{48}%~%f%F{35}$(git branch 2>/dev/null | sed -n -e "s/^\\* \\(.*\\)/ [\\1]/p")%f ' # green path, green git branch
#PROMPT='%F{197}%~%f%F{39}$(git branch 2>/dev/null | sed -n -e "s/^\\* \\(.*\\)/ [\\1]/p")%f ' # red path, blue git branch
#PROMPT='%F{226}%~%f%F{39}$(git branch 2>/dev/null | sed -n -e "s/^\\* \\(.*\\)/ [\\1]/p")%f%F{226}%f ' # yellow path, blue git branch

# ┌─────────────────┐
# │ Terminal colors │
# └─────────────────┘
# Light fff300
# Dark 2f2f2f 
# Light f2f2f2
# Green 00ff94
# Yellow e6ff00
# Orange ffbb44