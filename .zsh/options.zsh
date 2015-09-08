setopt  APPEND_HISTORY
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash
setopt  No_Beep
# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt always_to_end
setopt auto_cd
setopt NO_auto_name_dirs
setopt auto_pushd
setopt NO_auto_resume
setopt NO_beep
setopt brace_ccl
setopt NO_c_bases
setopt cdable_vars
setopt NO_chase_dots
setopt NO_chase_links
setopt NO_complete_aliases
setopt complete_in_word
setopt NO_correct
setopt correct_all
setopt extended_glob
setopt NO_hist_allow_clobber
setopt NO_hist_beep
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt NO_hup
setopt inc_append_history
setopt interactive_comments
setopt NO_list_beep
setopt list_packed
setopt NO_list_rows_first
setopt list_types
setopt long_list_jobs
setopt magic_equal_subst
setopt mail_warning
setopt null_glob
setopt NO_numeric_glob_sort
setopt NO_path_dirs
setopt print_eight_bit
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent
setopt rc_quotes
setopt share_history


setopt hash_dirs
hash -d di=/usr/portage/distfiles/
hash -d dev=$HOME/devel

# vim: set noet ts=4 tw=80 syntax=zsh :
