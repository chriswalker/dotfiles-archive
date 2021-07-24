function fish_prompt \
  --description 'Write out the prompt'

    # No limit to pwd output
    set -g fish_prompt_pwd_dir_length 0

    # Set up some colour variables
    set -l normal (set_color normal)
    set -l blue (set_color --bold blue)
    set -l cyan (set_color --bold cyan)
    set -l yellow (set_color --bold yellow) 
    set -l magenta (set_color --bold magenta)
    set -l bold_green (set_color --bold green)
    set -l grey (set_color 81a1c1)
    set -l orange (set_color d08770 --bold)

    # k8s context + namespace 
    if test -e $HOME/.kube/config
      printf '%s ' (k8s_prompt)
    end

	# if test -n "$container"
    # if test -e /run/.containerenv
    if string match -q "true" (in_podman)
        set -l toolbox_name (grep name /run/.containerenv | cut -d '"' -f2)
        printf '%s[%s] ' $magenta $toolbox_name
    end

    # PWD
    printf '%s%s' $cyan (prompt_pwd) 

    # Git
    set -l is_git_repository (command git rev-parse --is-inside-work-tree 2>/dev/null)
    if test -n "$is_git_repository"
      printf ' %s%s' $grey (git_prompt) 
    end

    # Second line
    printf '\n> ' 
end
