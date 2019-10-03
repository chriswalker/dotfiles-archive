# Git prompt functions are based on the fish implementation of zsh's Pure prompt, written by Rafael Rinaldi
# (see https://github.com/rafaelrinaldi/pure)
function git_prompt \
  --description 'Outputs git information on the prompt'
  
  set -l branch (git_branch)
  set -l is_dirty (git_dirty)
  set -l pending (git_pending_commits)

  echo "$branch$is_dirty$pending"
end
