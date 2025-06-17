# misc.zsh
# Miscellaneous aliases that don't fit in any other category.

# Reload zsh
alias reload='source "${ZDOTDIR}/.zshrc" && print -- "Reloaded ${ZDOTDIR/.zshrc}"'
alias hreload='print -- "Reloading shell..." && exec zsh'

# Reset cursor to default
alias rc-cursor='reset_cursor'

# Convenience aliases for zoxide
alias j='z'
alias ji='zj'

