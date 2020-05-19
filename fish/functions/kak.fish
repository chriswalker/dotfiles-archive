# Wrap Kakoune and give it a session name defaulting to the current directoty
function kak \
    --description 'Start Kakoune, defaulting the session name to the current directory.'
    command kak -s (basename (pwd)) $argv
end
