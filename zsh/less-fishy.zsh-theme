# ZSH Theme emulating the Fish shell's default prompt.
# modified to be "less fishy".  notably the prompt colors are inverted,
# bolded, and the collapsed working directory only applies to /home/$user

_fishy_collapsed_wd() {
    echo $(pwd | perl -pe '
        BEGIN {
            binmode STDIN,  ":encoding(UTF-8)";
            binmode STDOUT, ":encoding(UTF-8)";
        }; s|^$ENV{HOME}|~|g; 
    ')
}

local user_color='green'; [ $UID -eq 0 ] && user_color='red'
#PROMPT='%n@%m %{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.>) '
PROMPT='%{$fg_bold[$user_color]%}%n@%m %{$fg_bold[white]%}$(_fishy_collapsed_wd)%{$fg_bold[$user_color]%} %(!.#.>) %{$reset_color%}'
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT='${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
