# ─────────────────────────────────────────────────────────────────────────────
# ~/.config/zsh/hooks/git/editor.zsh
#
# Git editor configuration hook:
#   - Automatically configures git core.editor based on session type
#   - Uses helix (hx) for SSH/TTY sessions
#   - Uses VS Code for local graphical sessions
#   - Self-destructs after first git command to avoid overhead
# ─────────────────────────────────────────────────────────────────────────────

# Define git command hook (this can be called multiple times safely)
hooks-define-hook git_command 2>/dev/null || true

# Self-destructing git editor setup
_setup_git_editor_once() {
  local cmd="${1}"
  [[ ${cmd} =~ ^git\s ]] || return

  local editor
  if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]] || [[ ! -t 1 ]]; then
        editor="hx"
    else
        editor="code --reuse-window --wait"
    fi
    
    git config --global core.editor "$editor"
    hooks-add-hook -d git_command_hook _setup_git_editor_once
}

hooks-add-hook git_command_hook _setup_git_editor_once

# Set up preexec handler (only once, even if multiple git hooks exist)
if ! (( ${+functions[_trigger_git_hooks]} )); then
    _trigger_git_hooks() {
        [[ "$1" =~ ^git\s ]] && hooks-run-hook git_command_hook "$1"
    }
    add-zsh-hook preexec _trigger_git_hooks
fi
