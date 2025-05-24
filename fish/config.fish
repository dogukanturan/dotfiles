if status is-interactive
  set -Ux GPG_TTY (tty)
  test -f ~/.kubectl_aliases.fish && source ~/.kubectl_aliases.fish
end


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
