eval (thefuck --alias | tr '\n' ';')

function fish_greeting
end

function cd
    builtin cd $argv; and ls
end

set -x TERM xterm-256color
set -x LESS " -R"
set -x LESSOPEN '|~/.lessfilter %s'
