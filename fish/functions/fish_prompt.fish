#######################################################################
# Sexy Prompt with Ruby and Git info
# https://gist.github.com/KELiON/4721946
#######################################################################
function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  git status --porcelain ^/dev/null| egrep "^(M| M)"
end

function _rb_prompt
  echo (rbenv version | awk '{print $1}')
end

function _my_pwd --description 'more verbose version of prompt_pwd'
	echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||' -e 's-\([^/]\{0,5\}\)[^/]*/-\1/-g'
end

function fish_prompt
  set -l red (set_color -o red)
  set -l normal (set_color normal)
  set -l arrow "$red➜ $normal"
  set -l cwd (set_color cyan)(_my_pwd)
  echo -s $cwd $normal " " $arrow
end

function fish_right_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l blue (set_color -o blue)

  set -l git_branch (_git_branch_name)
  set -l dirty (_is_git_dirty)
  set -l git_info (set_color cyan)$git_branch
  if [ $git_branch ]
    if [ $dirty ]
       set git_info (set_color yellow)$git_branch
    end
    echo -s $git_info \n
  end

end