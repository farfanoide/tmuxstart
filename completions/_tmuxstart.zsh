#compdef tmuxstart
# ------------------------------------------------------------------------------
# Description
# -----------
#
#  Completion script for tmuxstart (https://github.com/farfanoide/tmuxstart).
#
# ------------------------------------------------------------------------------
# Authors
# -------
#
#  * Farfanoide (https://github.com/farfanoide)
#
# ------------------------------------------------------------------------------
local sessions sessiondir

sessiondir=${TMUXSTART_DIR:-$HOME/.tmuxstart}
# TODO: use own -l arg
sessions=($(\ls $sessiondir))

_arguments -s \
    '-h::Show help menu'\
    '-l::List all available session files'\
    '-c:Copy local session file to global directory:_files ./*'\
    '-o:Edit/Create session file:($sessions)'\
    '-d:Delete session file:($sessions)'\
    '*:Start/Attach session:($sessions)'

