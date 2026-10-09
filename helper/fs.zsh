# Find files matching a pattern
fs-ls() {
  local search_dir="${1:?Error: Specify a directory (e.g. / or ~/Library)}"
  local search_name="${2:?Error: Specify a pattern to find (e.g. '*nametofind*')}"

  echo "Searching for items in $search_dir matching $search_name"
  echo "--------------------------------------------------------"
  sudo find "$search_dir" -iname "$search_name" 2>/dev/null
}


# Delete files and directories matching a pattern (with an interactive safety prompt)
fs-rm() {

  local skip_ls=false
  local args=()

  # Parse flags and collect positional arguments
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --skip-ls)
        skip_ls=true
        shift
        ;;
      *)
        args+=("$1")
        shift
        ;;
    esac
  done

  local search_dir="${args[1]:?Error: Specify a directory (e.g. / or ~/Library)}"
  local search_name="${args[2]:?Error: Specify a pattern to find (e.g. '*nametofind*')}"

  # Preview first (unless skipped)
  if [[ "$skip_ls" == false ]]; then
    echo "Running preview of files to be deleted..."
    fs-ls "$search_dir" "$search_name"
  fi

  echo "--------------------------------------------------------"
  read "confirmation?Are you sure you want to permanently delete these items? [y/N] " </dev/tty
  case "$confirmation" in
    [yY][eE][sS]|[yY])
      echo "Deleting items in $search_dir matching $search_name"
      sudo find "$search_dir" -iname "$search_name" -exec rm -rf {} + 2>/dev/null
      echo "Done."
      ;;
    *)
      echo "Cancelled. No files were removed."
      ;;
  esac
}
