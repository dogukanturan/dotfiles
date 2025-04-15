# Defined in - @ line 1
function ghbrowser --wraps='gh repo view --web' --description 'alias ghbrowser=gh repo view --web'
  gh repo view --web $argv;
end
