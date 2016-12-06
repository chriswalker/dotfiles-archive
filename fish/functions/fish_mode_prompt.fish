function fish_mode_prompt --description 'Displays the current mode'
    # Do nothing if not in vi mode
    if set -q __fish_vi_mode
        echo $__fish_vi_mode
        switch $fish_bind_mode
            case default
                set_color --bold --background blue black
                echo ' NORMAL '
#            case insert
#                set_color --bold --background green black
#                echo ' INSERT '
            case visual
                set_color --bold --background red black
                echo ' VISUAL '
        end
        set_color normal
        echo -n ' '
    end
end
