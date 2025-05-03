if status is-interactive
  set -Ux GPG_TTY (tty)
  test -f ~/.kubectl_aliases.fish && source ~/.kubectl_aliases.fish
end

