# show git branch info and customise command prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\[\e[01;31m\]\w \$(parse_git_branch): \[\e[00m\]"

# custom listing shortcut (alias)
# for linux:
alias ll='ls --almost-all --human-readable -l --color'
# for mac osx:
# alias ll='ls -AlhG' # macosx