#!/bin/sh

# repos aliases
#======
alias repu='cd ~/repos/maint/; nice ./update all 2>&1 | tee last_update.log | ccze'
alias repul='cd ~/repos/maint/; cat last_update.log - | ccze'
# end repos
