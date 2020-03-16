#!/bin/sh

# repos aliases
#======
alias repu='cd ~/repos/maint/; nice ./update all 2>&1 | tee -a last_update.log | ccze -A | less -R'
alias repul='cd ~/repos/maint/; cat last_update.log - | ccze -A | less -R'
# end repos
