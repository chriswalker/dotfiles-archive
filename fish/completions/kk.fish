
function __complete_kk
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /Users/chris/Dev/Go/bin/kk
end
complete -f -c kk -a "(__complete_kk)"

