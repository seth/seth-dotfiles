#######################################################################
# Base System Stuff
#######################################################################
ulimit -n 1024

set -gx GPGKEY C81B042D
set -gx JAVA_HOME /System/Library/Frameworks/JavaVM.framework/Home
set -gx COPY_EXTENDED_ATTRIBUTES_DISABLE true
# Prefer /usr/local/bin
set -gx PATH ~/bin \
             /usr/local/bin \
             /usr/local/sbin \
             /Applications/Emacs.app/Contents/MacOS/bin \
             /usr/local/share/python \
             /usr/local/Cellar/python/2.7.2/bin \
             /usr/local/texlive/2007/bin/i386-darwin \
             /usr/texbin \
             $JAVA_HOME \
             $PATH

# base environment
set -gx EDITOR 'emacsclient -n'
# set -gx EDITOR '/usr/bin/vim'
# set -gx CC gcc

#######################################################################
# Secret Stuff
#######################################################################
if test -f ~/.localrc/secrets.fish
  # use .localrc directory for SUPER SECRET CRAP that you don't
  # want in your public, versioned repo.
  source ~/.localrc/secrets.fish
end

# keychain stuff for ssh agent
/usr/local/bin/keychain -Q -q opscode-platform-20100217 \
                              opscode-preprod-20101208 \
                              sfalcon \
                              sf_github
set -gx HOST (hostname)
if test -f ~/.keychain/$HOST-fish
    . "$HOME/.keychain/$HOST-fish"
end
if test -f ~/.keychain/$HOST-fish-gpg
    . "$HOME/.keychain/$HOST-fish-gpg"
end


#######################################################################
# Ruby
#######################################################################

# rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# set brew_rbenv /usr/local/var/rbenv/shims
# set -gx PATH /usr/local/var/rbenv/shims $PATH
# set -gx RBENV_ROOT /usr/local/var/rbenv

# Ruby Helpers
function be
  if test -f Gemfile.lock
    bundle exec $argv
  else
    eval $argv
  end
end

#######################################################################
# Git
#######################################################################

# alias `git` to `hub`
# eval (hub alias -s)

#######################################################################
# Code Directory Helpers
#######################################################################

# Fish Shell does not support traditional HERE DOCS
echo "\
CB /Users/seth/oc/code/opscode-cookbooks
OC /Users/seth/oc/code/opscode
S /Users/seth/src
E /Users/seth/oc/environments" | while read line

  # Split the line on spaces, assign to env variables
  set -l IFS=' '
  echo $line | read upper_name full_path

  set -l lower_name (echo $upper_name | tr '[:upper:]' '[:lower:]')

  eval "complete --command $lower_name --arguments '(__fish_complete_directories $full_path/ '' | cut -d / -f 7)'"
  eval "function $lower_name; cd $full_path/\$argv; end"
end

#######################################################################
# Eliminate the Fish welcome message
#######################################################################
set -g -x fish_greeting ''
