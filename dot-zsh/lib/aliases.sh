alias cd..='cd ..'
alias sourcerc='. ~/.zshrc'
alias grep="grep --color=auto"
[[ "$EMACS" == "t" ]] && alias ls='/bin/ls -F' || alias ls='/usr/local/bin/gls -F --color'
alias ll='ls -l'
alias lld='ll --directory'
alias llt='ll -r --sort=time'
alias lls='ll -r --sort=size'
alias d='dirs -v'
alias -g  G='|grep'
alias -g  L='|less'                                                             
alias -g  H='|head'                                                             
alias -g  T='|tail'                                                             
alias -g  V='|vim -c "setlocal buftype=nofile" -'
alias -g GV="|grep -v"
alias -g AO='2>&1'
alias -g DN='2>/dev/null'
alias -g  X='|xargs'
alias -g E='emacsclient -n'
alias -g DBR='diff --brief -r'
alias -g DR='diff -r'
alias ec='emacsclient'
alias ecn='emacsclient -n'
alias erlman='erl -man'
alias xmlcurl="curl -H Accept:text/xml"
alias mg="mg -n" # no backup files

# aliases with R break the bash compatibility layer
# completion :-(  Implemented these as wrapper
# scripts.
#alias R-2.10='R-2.10 --no-save -q'
#alias R-devel='R-devel --no-save -q'
alias rdci="R-devel CMD INSTALL"
alias r2ci="R-2.10 CMD INSTALL"

alias gls='git log opscode/master..'
alias gfo='git fetch opscode'
alias gsr='git svn rebase'
alias gst='git status -sb'
alias gc='git commit -v'
alias gca='git commit -v -a'

