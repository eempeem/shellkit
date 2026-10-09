# Create a symlink to the ghostty config file in the XDG_CONFIG_HOME directory if it doesn't exist
config_dir="$XDG_CONFIG_HOME/ghostty"
config_file="$config_dir/config.ghostty"
if [[ ! -e "$config_file" && ! -L "$config_file" ]]; then
  mkdir -p "$config_dir"
  ln -s "${${(%):-%x}:A:h}/config/ghostty.conf" "$config_file"
fi

function unconfigure-ghostty() {
  rm -rf "$config_dir"
}