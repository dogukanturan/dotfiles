source ~/.config/fish/functions/custom_functions.fish
source ~/.config/fish/fish_profile
source ~/.config/fish/fish_aliases.fish

test -f ~/.kubectl_aliases.fish && source ~/.kubectl_aliases.fish
set -gx EDITOR nvim
set -gx FZF_CTRL_T_COMMAND nvim

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
