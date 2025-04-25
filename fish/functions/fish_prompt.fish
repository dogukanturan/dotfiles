function fish_prompt
  set_color cyan
  echo -n "💀 "
  set_color blue
  echo -n (prompt_pwd)
  set_color green
  echo -n (fish_git_prompt)
  echo -n ' #! '
end

