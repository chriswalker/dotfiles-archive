function git_branch \
  --description 'Return current git branch/tag/SHA1'

  set -l branch_name ''

  set -l branch (command git symbolic-ref --short HEAD 2>/dev/null)
  if test -z "$branch" # Not a branch, see if it's a tag
    set -l tag (command git describe --tags --exact-match HEAD 2>/dev/null)
    if test -z "$tag" # Not a tag either, just use commit hash
      set branch_name (command git rev-parse --short HEAD 2>/dev/null)
    else
      set branch_name $tag
    end
  else
    set branch_name $branch
  end

  echo $branch_name
end
