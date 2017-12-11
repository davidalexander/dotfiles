# Set up a Git-aware prompt - https://github.com/csswizardry/dotfiles/blob/master/.bashrc
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
RESET="\033[m"
ITALIC="\e[3m"
function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1)/"
}
export PS1="\[$GREEN\]\u \[$RESET\]\[$ITALIC\]in \[$RESET\]\[$BLUE\]\w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" \[$RESET\]\[$ITALIC\]on \")\[$YELLOW\]\$(parse_git_branch)\[$RESET\]\n» "

# custom listing shortcut (alias for mac osx format)
alias ll='ls -GAhFl'
alias lt='ls -GAhFltr'

# Disk usage human readable and sorted by size.
# Source: http://www.earthinfo.org/linux-disk-usage-sorted-by-size-and-human-readable/
alias duf='du -sk * .??* | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.n98-magerun.phar ]; then
    . ~/.n98-magerun.phar
fi

# Set VI as default editor
#export VISUAL=vi
#export EDITOR="$VISUAL"
