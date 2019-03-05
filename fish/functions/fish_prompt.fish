function fish_prompt --description 'Write out the prompt with colours based on base16-eighties terminal theme'
    # Calculate these prompt values once
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

	  if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    if not set -q __fish_git_prompt_hide_untrackedfiles
        set -g __fish_git_prompt_hide_untrackedfiles 1
    end

    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch magenta --bold
    end
    if not set -q __fish_git_prompt_showupstream
        set -g __fish_git_prompt_showupstream "informative"
    end
    if not set -q __fish_git_prompt_char_upstream_ahead
        set -g __fish_git_prompt_char_upstream_ahead "↑"
    end
    if not set -q __fish_git_prompt_char_upstream_behind
        set -g __fish_git_prompt_char_upstream_behind "↓"
    end
    if not set -q __fish_git_prompt_char_upstream_prefix
        set -g __fish_git_prompt_char_upstream_prefix ""
    end

    if not set -q __fish_git_prompt_char_stagedstate
        set -g __fish_git_prompt_char_stagedstate "●"
    end
    if not set -q __fish_git_prompt_char_dirtystate
        set -g __fish_git_prompt_char_dirtystate "+"
    end
    if not set -q __fish_git_prompt_char_untrackedfiles
        set -g __fish_git_prompt_char_untrackedfiles "…"
    end
    if not set -q __fish_git_prompt_char_conflictedstate
        set -g __fish_git_prompt_char_conflictedstate "✖"
    end
    if not set -q __fish_git_prompt_char_cleanstate
        set -g __fish_git_prompt_char_cleanstate "✔"
    end

    if not set -q __fish_git_prompt_color_dirtystate
        set -g __fish_git_prompt_color_dirtystate blue
    end
    if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
    end
    if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
    end
    if not set -q __fish_git_prompt_color_untrackedfiles
        set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    end
    if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate green --bold
    end
    set -g fish_prompt_pwd_dir_length 0

    # set up some colour variables
    set -g normal (set_color normal)
    set -g blue (set_color --bold blue)
    set -g cyan (set_color --bold cyan)
    set -g yellow (set_color --bold yellow) 
    set -g magenta (set_color magenta)
    set -g bold_green (set_color --bold green)

    # Time
    set -g time (date "+%H:%M:%S")
    printf '%s[%s] ' $cyan $time 

    # GCP active account - TODO - bit slow at the moment, so commented out
    # set -g gcp_active_config (gcloud info --format="value(config.active_config_name)")

    # k8s context + namespace 
    switch (uname)
    case Darwin
      set k8s_ctx (kubectl config current-context)
      set k8s_ns (kubectl config view -o=jsonpath="{.contexts[?(@.name==\"$k8s_ctx\")].context.namespace}")
      printf '%s[%s/%s] ' $bold_green $k8s_ctx $k8s_ns
    end

    # pwd
    printf '%s%s%s' $yellow (prompt_pwd) $normal
    # VCS
    printf '%s%s\n' (__fish_vcs_prompt)

    # Second line
    printf '%s>%s ' $cyan $normal
end
