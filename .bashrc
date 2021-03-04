# ----------------------
# Git Aliases
# ----------------------
alias gi='git init'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -m $2'
alias gp='git push'
alias gpo='git push origin'
alias gpl='git pull'
alias gf='git fetch'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gsb='git status -sb'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
alias gr='git remote -v'
alias gra='git remote add $1 $2'

# -------
# Aliases
# -------
alias ls='ls -a -F --color=auto --show-control-chars'
alias ll='ls -la'
alias rm='rm -iv -rf'
alias exp='explorer .'
alias c='code .'
alias cf='code $2'
alias back="cd .."

# ----------
# Functions
# ----------
function mkcd()
{
	mkdir $1 && cd $1
}

# ------------------------------------
# Make sure all non-printable bytes in your PS1 are contained within \[ \]
# Otherwise, bash will count them in the length of the prompt.
# It uses the length of the prompt to determine when to wrap the line
# ------------------------------------

WINDOW_TITLE="💀 $(whoami) 💀"

echo -e "$(clear)"
echo -e "\e[38;5;15mWelcome back \e[38;5;9m$(whoami)\e[38;5;15m! 💀"
echo -e "\e[38;5;41m$(date)\e[38;5;15m"

cat << 'EOF'
              ...                            
             ;::::;                           
           ;::::; :;                          
         ;:::::'   :;                         
        ;:::::;     ;.                        
       ,:::::'       ;           OOO\         
       ::::::;       ;          OOOOO\        
       ;:::::;       ;         OOOOOOOO       
      ,;::::::;     ;'         / OOOOOOO      
    ;:::::::::`. ,,,;.        /  / DOOOOOO    
  .';:::::::::::::::::;,     /  /     DOOOO   
 ,::::::;::::::;;;;::::;,   /  /        DOOO  
;`::::::`'::::::;;;::::: ,#/  /          DOOO 
:`:::::::`;::::::;;::: ;::#  /            DOOO
::`:::::::`;:::::::: ;::::# /              DOO
`:`:::::::`;:::::: ;::::::#/               DOO
 :::`:::::::`;; ;:::::::::##                OO
 ::::`:::::::`;::::::::;:::#                OO
 `:::::`::::::::::::;'`:;::#                O 
  `:::::`::::::::;' /  / `:#                  
   ::::::`:::::;'  /  /   `#              
EOF


if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;$WINDOW_TITLE\007\]' 				# set window title
	PS1="$PS1"'\[\n\]'                                  # new line
    PS1="$PS1"'\[💀 \]'
    PS1="$PS1"'\[\e[38;5;9m{\]'
    PS1="$PS1"'\[\e[38;5;15m\u\]'
    PS1="$PS1"'\[\e[38;5;9m}\]'
    PS1="$PS1"'\[ 💀 \]'
    PS1="$PS1"'\[\e[38;5;226m★ \]'
    PS1="$PS1"'\[\e[38;5;45m${PWD#"${PWD%/*/*}/"}\]'
    if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PS1="$PS1"'\[\e[38;5;226m ★ \]'
            PS1="$PS1"'\[\e[38;5;9m[\]'
            PS1="$PS1"'\[\e[38;5;15m\A\]'
            PS1="$PS1"'\[\e[38;5;9m]\]'
			PS1="$PS1"'\[\e[38;5;40m\]'  # change color
			PS1="$PS1"'\[`__git_ps1`\]'   # bash function
		fi
	fi
    PS1="$PS1""\[ \`if [ \$? = 0 ]; then echo 🤖; else echo 🔥; fi\`\]"
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\[\e[38;5;126m\]$ '      # prompt: always $
	PS1="$PS1"'\[\e[38;5;46m\]'        # change color
    trap '[[ -t 1 ]] && tput sgr0' DEBUG # reset the terminal color right before bash executes the command
fi

MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc

# Evaluate all user-specific Bash completion scripts (if any)
if test -z "$WINELOADERNOEXEC"
then
	for c in "$HOME"/bash_completion.d/*.bash
	do
		# Handle absence of any scripts (or the folder) gracefully
		test ! -f "$c" ||
		. "$c"
	done
fi

# Permanently disable bash history
set +o history

set horizontal-scroll-mode off

# #Git status options
# export GIT_PS1_SHOWSTASHSTATE=true
# export GIT_PS1_SHOWDIRTYSTATE=true
# export GIT_PS1_SHOWUNTRACKEDFILES=true
# export GIT_PS1_SHOWUPSTREAM="auto"
