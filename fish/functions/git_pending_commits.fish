function git_pending_commits \
  --description 'Outputs whether there are pending commits, and whether the branch is ahead or behind the remote'
    set -l git_unpushed_commits ''
    set -l git_unpulled_commits ''

    set --local has_upstream (command git rev-parse --abbrev-ref '@{upstream}' 2>/dev/null)
    if test -n "$has_upstream"  # check there is an upstream repo configured
      and test "$has_upstream" != '@{upstream}'
      command git rev-list --left-right --count 'HEAD...@{upstream}' \
        | read --local --array git_status
      set -l commit_to_push $git_status[1]
      set -l commit_to_pull $git_status[2]

      if test $commit_to_push -gt 0  # upstream is behind local repo
        set git_unpushed_commits '↓'
      end

      if test $commit_to_pull -gt 0  # upstream is ahead of local repo
        set git_unpulled_commits '↑'
      end
  end

  echo " $git_unpushed_commits$git_unpulled_commits"
end
