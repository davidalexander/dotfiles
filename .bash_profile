# show git branch info and customise command prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\[\e[01;31m\]\w \$(parse_git_branch): \[\e[00m\]"

# custom listing shortcut (alias)
alias ll='ls -AlhG'

# Disk usage human readable and sorted by size.
# Source: http://www.earthinfo.org/linux-disk-usage-sorted-by-size-and-human-readable/
alias duf='du -sk * | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done'

# use MAMP for cli php
# http://stackoverflow.com/questions/4145667/how-to-override-the-path-of-php-to-use-the-mamp-path
# export MAMP_PHP=/Applications/MAMP/bin/php/php5.3.6/bin
# export PATH="$MAMP_PHP:$PATH"