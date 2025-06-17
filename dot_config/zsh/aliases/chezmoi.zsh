# chezmoi.zsh
# Aliases to simplify and speed up common chezmoi operations

alias chez='chezmoi'
alias czcd='chez cd'
alias czd='chez diff'
alias cza='chez apply'
alias czea='chez edit --apply'
alias czaa='chez add'
alias czr='chez re-add'
alias czup='chez update'
alias czupup='chez upgrade'
alias czgen='chez generate'
alias czs='chez status'
alias czrm='chez forget'
alias czdoc='chez doctor'
alias czi='chez ignored'
alias czh='chez help'
alias czx='chez execute-template'
alias czm='chez managed'
alias czt='chez managed | tree --fromfile .'

# Function to pass through git commands to chezmoi-managed repo
czg() {
    chezmoi git -- "$@"
}
