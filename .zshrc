# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git taskwarrior)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias rsnapshot="rsnapshot -c ~/.rsnapshot.conf"
alias rmGeminiDb="rm -f /cygdrive/c/Users/hbi/db_gemini.*"
alias t2tmud="telnet t2tmud.org 9999"

precmd() {
	TCTX=$(task _get rc.context)

	CTX="$bg[white] $TCTX > "
	PRIO="$bg[green] prio: $(task prio: +PENDING -BLOCKED context.not:in count) "
	IN="$bg[blue] in: $(task context:in +PENDING -BLOCKED count) "
	DUE="$bg[red] due: $(task +OVERDUE +PENDING -BLOCKED count)/$(task due.before:1w  +PENDING -BLOCKED count) "

	LINE="$CTX$IN$PRIO$DUE$reset_color"

	print $fg[black]${(l:$COLUMNS+24:::)LINE}
}

PS1="\$(date +%d.%H:%M:%S)$PS1"
RPS1='%{$fg[yellow]%}%~%{$reset_color%} \
%{$fg[red]%}${return_code}%{$reset_color%} '


#zstyle ':completion:*' hosts off
#zstyle ':completion:*' accept-exact '*(N)'
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.zsh/cache

DEFAULT_PRINTER=nts.nearest

alias t.print="task print > ~/deleteme.txt && lpr -P $DEFAULT_PRINTER ~/deleteme.txt"
alias t.print.home='task print > ~/deleteme.txt && lpr -P home ~/deleteme.txt'
alias t.print.evernote='task print > ~/todo.txt && mv ~/todo.txt ~/links/winhome/Desktop/Evernote/Inbox'

alias g.diff.head="git difftool -t vim -d ^head"
alias g.h2.delete="rm ~/links/winhome/db_gemini.*"
alias g.product.test="mvn clean test-compile surefire-report:report  -Daggregate=true -fn"
alias g.it.test="~/bin/gem/it.test.sh"
alias g.failsafe.failures='grep -RilL **/failsafe-summary.xml -e ".*<failures>0</failures>.*"'
alias g.failsafe.errors='grep -RilL **/failsafe-summary.xml -e ".*<errors>0</errors>.*"'

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/hbi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
