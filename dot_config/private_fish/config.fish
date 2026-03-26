#!/usr/bin/env fish

# set env
set -x EDITOR nvim

# ls aliases
if [ "$(command -v eza)" ]
    alias l='eza'
    alias ls='eza'
    alias ll='eza -l --icons=auto --group-directories-first'
    alias l.='eza -d .*'
    alias l1='eza -1'
end

# ugrep for grep
if [ "$(command -v ug)" ]
    alias grep='ug'
    alias egrep='ug -E'
    alias fgrep='ug -F'
    alias xzgrep='ug -z'
    alias xzegrep='ug -zE'
    alias xzfgrep='ug -zF'
end

# bat for cat
alias cat='bat --style=plain --pager=never' 2>/dev/null

if status is-interactive
    [ "$(command -v atuin)" ] && eval "$(atuin init fish $ATUIN_INIT_FLAGS)"

    [ "$(command -v starship)" ] && eval "$(starship init fish)"

    [ "$(command -v zoxide)" ] && eval "$(zoxide init fish)"
end
