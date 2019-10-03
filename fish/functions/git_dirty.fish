function git_dirty \
  --description 'Indicates whether the current repo contains changes'

  set -l git_dirty_symbol ''
  set -l is_git_dirty (command git status --porcelain --ignore-submodules 2>/dev/null)

  if test -n "$is_git_dirty"  # untracked or un-commited files
    set git_dirty_symbol '!'
  end

  echo "$git_dirty_symbol"
end

