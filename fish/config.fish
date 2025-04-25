if status is-interactive
  fzf_configure_bindings
  set -Ux GPG_TTY (tty)
  test -f ~/.kubectl_aliases.fish && source ~/.kubectl_aliases.fish
  kubectl completion fish | source
end
