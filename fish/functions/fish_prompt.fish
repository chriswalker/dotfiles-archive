function fish_prompt --description 'Write out the prompt with colours based on base16-eighties terminal theme'
    # Calculate these prompt values once
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    set -g fish_prompt_pwd_dir_length 0

    # set up some colour variables
    set -g blue (set_color blue)
    set -g yellow (set_color yellow)
    set -g bold_orange (set_color --background black --bold red)

    set -g time (date "+%H:%M:%S")

    printf $blue
    printf '[%s]' $time
    printf ' '
    printf '%s@%s ' $USER $__fish_prompt_hostname
    printf $yellow
    printf '%s\n' (prompt_pwd) 
    printf $bold_orange
    printf 'λ '
end
