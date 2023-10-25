# /etc/root.bashrc

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# more colors!
alias bridge='bridge --color=auto'
alias egrep='egrep --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias zgrep='zgrep --color=auto'
alias tc='tc -color=auto'

# common aliases
alias ipa='ip --color=auto -br addr'
alias ipl='ip --color=auto -br link'
alias ipr4='ip -4 --color=auto -br route'
alias ipr='ip -6 --color=auto -br route'

# Stuff to do if running interactively
case $- in
    *i*)
        # Save & restore multi-line history
        HISTTIMEFORMAT='%F %T '
        shopt -s lithist
    ;;
      *) return;;
esac

if [ -e /etc/root.bashrc.local ]; then
    . /etc/root.bashrc.local
fi

if [ -e ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi
