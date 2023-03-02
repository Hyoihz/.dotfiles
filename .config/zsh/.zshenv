# Default programs
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"

# XDG variables
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# PATH variables
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share:$PATH

export PATH=$CARGO_HOME/bin:$PATH
export PATH="$XDG_DATA_HOME"/npm/bin:$PATH

# Cleanups
export HISTFILE="$XDG_STATE_HOME"/zsh/history

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export PYTHONSTARTUP="${XDG_CONFIG_HOME}"/python/pythonrc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GEM_HOME="${XDG_DATA_HOME}"/gem
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}"/gem
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export TERMINFO="$XDG_DATA_HOME"/terminfo 
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export CONAN_USER_HOME="$XDG_CONFIG_HOME"
