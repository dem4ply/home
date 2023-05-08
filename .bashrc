#
# ~/bashrc
#
# PS

#PS1='[\u@\h \W]\$ '

#PS4='+ $(date "+%s.%N")\011 '
#exec 3>&2 2>/tmp/bashstart.$$.log
#set -x

export XDG_CONFIG_HOME="$HOME/.config"
export VIRTUAL_ENV_DISABLE_PROMPT=1


#para que firefox no este lento
export MOZ_DISABLE_PANGO=1
export ANDROID_HOME="$HOME/Android/Sdk"

#django default logger INFO
export DJANGO_LOG_LEVEL="INFO"
# para inportar las gem de ruby
PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"
PATH="/home/dem4ply/bin:$PATH"

# Set up Node Version Manager
# source /usr/share/nvm/init-nvm.sh


export EDITOR=vim

#PS1='\[\e[1;32m\]┌──[\u]─\[\e[m\]\[\e[1;34m\]─[\w]\[\e[m\]\n\[\e[0;32m\]└─>$ \[\e[m\]\[\e[1;32m\] '
#PS1='┌─[\[\e[1;34m\]\w\[\e[1;32m\]]\[\e[m\]\n\[\e[1;32m\]└─>\u\[\e[m\] \[\e[0;32m\]\$ \[\e[m\]\[\e[1;32m\] '


# history ignora ls, pwd y date
export HISTIGNORE=’ls:pwd:date:’
# history ignora dupplicados
export HISTCONTROL=ignoredups


#FUCK
alias fuck='sudo $(history -p \!\!)'
alias please='sudo'
alias sorry='fuck'

alias virtualenv='virtualenv --system-site-packages'

# ls
alias ls='ls --color=auto'

# regresa un comando de say aleatorio
alias say='eval $(shuf -n1 -e ponysay cirnosay)'

# clear
alias clear='clear; fortune -c | say'
bind -x '"\C-l": clear'

# curl
alias curl='curl -w "\n"'

# grep
export GREP_COLOR="mt=1;33"
alias grep='grep --color=auto'

# para matar moscas con cañones
alias python='ipython'
alias his='history'

alias cut_line='cut -c-$COLUMNS'

# pacman a color
#alias pacman='pacman-color'
#alias pacman='sudo pacman-color'

# colores man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#android añadir el abd
PATH=$PATH:/opt/android-sdk/platform-tools/
PATH=$PATH:/home/dem4ply/Documentos/scripts/
export PATH

# Colores
#Negro       0;30     Gris Obscuro  1;30
#Azul        0;34     Azul Claro    1;34
#Verde       0;32     Verde Claro   1;32
#Cyan        0;36     Cyan Claro    1;36
#Rojo        0;31     Rojo Claro    1;31
#Purpura     0;35     Fiuscha       1;35
#Café        0;33     Amarillo      1;33
#Gris Claro  0;37     Blanco        1;37

        RED="\[\033[0;31m\]"
     YELLOW="\[\033[1;33m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[1;34m\]"
     PURPLE="\[\033[0;35m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"


source /etc/profile.d/vte.sh

if [[ $(type -t "__vte_prompt_command") != function ]]; then
    function __vte_prompt_command(){
        return 0
    }
fi

function set_prompt {
	if [ $? -eq 0 ]; then
		emoticon=(^_^)─
	else
		emoticon=(O_O)─
	fi

	__vte_prompt_command

	#get vitual env
	if [[ -n "$VIRTUAL_ENV" ]]; then
		VENV="─${PURPLE}─[`basename \"$VIRTUAL_ENV\"`]"
	else
		VENV=""
	fi

	branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')
	if test -n "$branch"; then
		branch="─${YELLOW}─${branch}"
	fi

	PS1="${COLOR_NONE}${LIGHT_GREEN}┌──${emoticon}[\u]─${BLUE}─[\w]${VENV}${branch}\n${GREEN}└─>${COLOR_NONE}${LIGHT_GREEN} "

}

source ~/garbage/autoenv/activate.sh

PROMPT_COMMAND=set_prompt

fortune -c | say
