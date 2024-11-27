set fish_greeting # remove greeting from startup

zoxide init fish | source # zoxide init

# starship transient prompt
function starship_transient_rprompt_func
    starship module time
end

starship init fish | source # starship init
enable_transience # enable fish transience

# yazi alias as yy
# also for change dir from yy exit
function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
