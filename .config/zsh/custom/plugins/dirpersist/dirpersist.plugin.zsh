# Save dirstack history to $XDG_STATE_HOME/zsh/dirhistory
# adapted from:
# github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc#L1547

DIRSTACKSIZE=${DIRSTACKSIZE:-100}
dirstack_file=${dirstack_file:-${XDG_STATE_HOME}/zsh/dirhistory}

if [[ -f ${dirstack_file} ]] && [[ ${#dirstack[*]} -eq 0 ]] ; then
  dirstack=( ${(f)"$(< $dirstack_file)"} )
  # "cd -" won't work after login by just setting $OLDPWD, so
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi

autoload -U add-zsh-hook
add-zsh-hook chpwd chpwd_dirpersist
chpwd_dirpersist() {
  if (( $DIRSTACKSIZE <= 0 )) || [[ -z $dirstack_file ]]; then return; fi
  local -ax my_stack
  my_stack=( ${PWD} ${dirstack} )
  builtin print -l ${(u)my_stack} >! ${dirstack_file}
}
