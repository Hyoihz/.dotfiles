# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# General settings
HISTSIZE=1000000
SAVEHIST=1000000

setopt no_beep auto_cd extended_glob nomatch menu_complete auto_pushd pushd_ignore_dups \
       cd_silent share_history

zle_highlight=('paste:none') # no highlight on paste

# Completions
zstyle :compinstall filename "$ZDOTDIR/.zshrc"
autoload -Uz compinit && compinit
_comp_options+=(globdots) # include hidden files

# Fzf
source /usr/share/fzf/key-bindings.zsh

export FZF_DEFAULT_COMMAND="fd -HL -E .git -E node_modules"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND -t f -t d"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND -t d"

export FZF_DEFAULT_OPTS="--color=16,prompt:15,info:5,fg+:4,hl+:2,hl:3,marker:6 
			 --prompt=' ' --pointer='﬌' --marker=' ' 
			 --bind=ctrl-space:toggle --border=left --reverse 
			 --margin=0,4,0,0"

# Functions
for file in "$ZDOTDIR"/custom/functions/*; do
    source $file
done

# Install or update plugins
add_or_update "Aloxaf/fzf-tab"
add_or_update "romkatv/powerlevel10k"
add_or_update "zsh-users/zsh-autosuggestions"
add_or_update "zsh-users/zsh-syntax-highlighting"

# Theme
source ~/.config/zsh/custom/themes/.p10k.zsh

# Fzf-tab customizations
zstyle ":fzf-tab:*" default-color "" # fg(+) doesn't work without this
zstyle ":fzf-tab:*" fzf-flags --color=16,prompt:15,info:5,fg+:4,hl+:2,hl:3,marker:6 

# Change zsh-autosuggestions color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=#878aa1 # brighter black

# Change zsh-syntax-highlighting colors
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[precommand]=fg=2 # green
ZSH_HIGHLIGHT_STYLES[path]=fg=5 # magenta
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=6 # cyan
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=6 # cyan

# Custom plugins/files

source $ZDOTDIR/custom/plugins/dirpersist/dirpersist.plugin.zsh
source $ZDOTDIR/custom/plugins/dirhistory/dirhistory.plugin.zsh

source $ZDOTDIR/custom/keymaps
source $ZDOTDIR/custom/aliases
