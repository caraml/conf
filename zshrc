#
# zshrc
#

##############################
# env,style keybinding
##############################
export LANG=ja_JP.UTF-8
export GOROOT=$HOME/work/go
export GOOS=linux
export GOARCH=386
export GOBIN=$HOME/work/bin
export PATH=$GOBIN:$PATH
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
autoload colors
colors

if [[ "$TERM" != "dumb" ]]; then
    PROMPT="%{${fg[blue]}%}[%m:%~]%(!.#.$)%{$reset_color%}"
    SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
else
    export PROMPT="%(?..[%?] )%n@%m:%~>"
fi
# 補完機能の強化
autoload -U compinit
compinit
# Emacs keybind
bindkey -e
# カーソル位置からの前方削除
bindkey '^U' backward-kill-line
## 履歴検索のショートカット
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
## M-f/M-b/M-bの挙動を合わせる
bindkey "^[f" emacs-forward-word
bindkey "^[b" emacs-backward-word
export WORDCHARS=""
setopt nolistbeep

##############################
# zsh option
##############################
## ヒストリを共有
setopt share_history
##　直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## auto directory pushd that you can get dirs list by cd-[tab]
setopt auto_pushd
## 同じディレクトリをpushしない
setopt pushd_ignore_dups
## autc chenge dir
# setopt auto_cd
## no beep sound when complete lost displayed
setopt nolistbeep
## no beep
setopt nobeep
## aliased ls needs if file/dir
setopt complete_aliases
## 末尾の/を自動的に削除しない
# setopt noautoremoveslash
## --prefix=/usr などの=以降も補完
setopt magic_equal_subst
## compacked complete list display
setopt list_packed
## 補完候補を一覧表示
setopt auto_list
## 色を使う
setopt prompt_subst
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## TABで順に補完候補を切り替える
setopt auto_menu
## =command をcommandのパス名に展開する
setopt equals
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力8ビットを通す
setopt print_eight_bit
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
## 補完候補の色付け
zstyle ':completion:*:default' list-colors ${(s. :.)LS_COLORS}
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の/を自動的に付加し、次の補完に備える
setopt auto_param_slash
## スペルチェック
setopt correct
## sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
## blog error
setopt nonomatch
## 文字列文末に改行コードがない場合でも表示する
unsetopt promptcr

##############################
# alias
##############################
alias j="jobs"
alias h="history"
alias e="emacs -nw"
alias se="sudo emacs -nw"
alias ls="ls -F"
alias la="ls -la"
alias ll="la"
alias clean="rm -f *~ .*~ \#*"
alias sclean="sudo rm -f *~ .*~ \#*"