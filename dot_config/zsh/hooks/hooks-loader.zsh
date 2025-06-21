# ─────────────────────────────────────────────────────────────────────────────
# ~/.config/zsh/hooks/hook-loader.zsh
#
# Loads and configures the hook system:
#   - Sources zsh-hooks plugin
#   - Auto-loads all hook files from subdirectories
#   - Sets up hook orchestration
# ─────────────────────────────────────────────────────────────────────────────

# Get the absolute path to the hooks directory
hooks_dir="${(%):-%x}"
hooks_dir="${hooks_dir:A:h}"

 # Auto source all hook files
for hook_file in "${hooks_dir}"/**/*.zsh(.N); do
  [[ ${hook_file:t} != "hooks-loader.zsh" ]] && source "${hook_file}"
done
