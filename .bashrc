# .bashrc

# User-specific aliases and functions
alias ll='ls -la'
alias gs='git status'
alias h='$HOME/run_app.sh'

# Custom function to list hidden files
list_hidden() {
    ls -d .[^.]* .??*
}

# Source .bash_profile if it exists
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
