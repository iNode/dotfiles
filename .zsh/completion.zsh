# Hosts to use for completion (see later zstyle)
hosts=(`hostname` `awk '!/^#|^$/{print $2}' /etc/hosts | sort | uniq`)

# Setup new style completion system. To see examples of the old style (compctl
# based) programmable completion, check Misc/compctl-examples in the zsh
# distribution.
autoload -U compinit promptinit
compinit
promptinit
# promptinit; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
autoload -U incremental-complete-word
zle -N incremental-complete-word

autoload -U insert-files
zle -N insert-files

autoload -U predict-on
zle -N predict-on
#zle -N predict-off
zstyle ':completion::complete:*' use-cache 1

# Autocomplete for current dir on filetypes
compctl -g '*.Z *.gz *.tgz' + -g '*' zcat gunzip
compctl -g '*.tar.Z *.tar.gz *.tgz *.tar.bz2' + -g '*' tar
compctl -g '*.zip *.ZIP' + -g '*' unzip
compctl -g '*.(mp3|MP3|ogg|OGG|temp|TEMP)' + -g '*(-/)'  mpg123 xmms mpg321

# Completion Styles
# vim: set noet ts=4 tw=80 syntax=zsh :
