DIR="${${(%):-%x}:A:h}"

# ┌──
# │ shell config
# └─────────────────────────────────────────────────────────────────────
for file in $DIR/shell/*.zsh(N-.); do
  source "$file"
done

# ┌──
# │ helpers
# └─────────────────────────────────────────────────────────────────────
for file in $DIR/helper/*.zsh(N-.); do
  source "$file"
done

# ┌──
# │ CLI tools / apps
# └─────────────────────────────────────────────────────────────────────
# enable in .zshrc by setting the APP_ENABLE variable
# APP_ENABLE=('*') # enable all
# APP_ENABLE=(docker git ghostty) # enable specific
# APP_DISABLE=(docker) # exclude selected apps
if (( ${+APP_ENABLE} )); then
  for app in "${APP_ENABLE[@]}"; do
    if [[ "$app" == '*' ]]; then
      for app_path in "$DIR"/app/*(N); do
        if [[ -f "$app_path" && "$app_path" == *.zsh ]]; then
          app_name="${app_path:t:r}"
          if (( ${+APP_DISABLE} )) && (( ${APP_DISABLE[(Ie)$app_name]} )); then
            continue
          fi
          source "$app_path"
        elif [[ -d "$app_path" && -f "$app_path/setup.zsh" ]]; then
          app_name="${app_path:t}"
          if (( ${+APP_DISABLE} )) && (( ${APP_DISABLE[(Ie)$app_name]} )); then
            continue
          fi
          source "$app_path/setup.zsh"
        fi
      done
      break
    fi

    if (( ${+APP_DISABLE} )) && (( ${APP_DISABLE[(Ie)$app]} )); then
      continue
    fi

    app_file="$DIR/app/$app.zsh"
    if [[ -f "$app_file" ]]; then
      source "$app_file"
    else
      source "$DIR/app/$app/setup.zsh"
    fi
  done
fi

# ┌──
# │ autocomplete ON 
# └─────────────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
