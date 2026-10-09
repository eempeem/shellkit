# Disk usage helpers
du-free() {
  df -h /
}

du-usage() {
  local dir="${1:-.}"
  local depth="${2:-1}"

  du -xhd "$depth" "$dir" 2>/dev/null | sort -h
}

du-size() {
  local dir="${1:-.}"
  local size="${2:-500M}"

  find "$dir" -type f -size "+$size" -print0 2>/dev/null |
    xargs -0 du -h 2>/dev/null |
    sort -h
}

du-docker() {
  docker system df
}

du-brew() {
  du -sh "$(brew --cache)" 2>/dev/null
}

du-tm-snapshots() {
  tmutil listlocalsnapshots /
}
