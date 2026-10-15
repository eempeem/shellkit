# Disk usage helpers
skit.du.free() {
  df -h /
}

skit.du.usage() {
  local dir="${1:-.}"
  local depth="${2:-1}"

  du -xhd "$depth" "$dir" 2>/dev/null | sort -h
}

skit.du.size() {
  local dir="${1:-.}"
  local size="${2:-500M}"

  find "$dir" -type f -size "+$size" -print0 2>/dev/null |
    xargs -0 du -h 2>/dev/null |
    sort -h
}

skit.du.docker() {
  docker system df
}

skit.du.brew() {
  du -sh "$(brew --cache)" 2>/dev/null
}

skit.du.tm-snapshots() {
  tmutil listlocalsnapshots /
}
