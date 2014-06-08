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
local sessions_dir running_sessions session_files

sessions_dir=${TMUXSTART_DIR:-$HOME/.tmuxstart}

session_files=($(\ls $sessions_dir))
# all_sessions=$session_files

running_sessions=($(tmux list-sessions -F '#S' 2> /dev/null))

for session in ${session_files[@]}; do
    running_sessions=(${running_sessions[@]//*$session*})
done

_arguments -s \
    '-h::Show help menu'\
    '-l::List all available session files'\
    '-c:Copy local session file to global directory:_files ./*'\
    '-o:Edit/Create session file:($session_files)'\
    '-d:Delete session file:($session_files)'\
    '*:Start/Attach session:($session_files $running_sessions)'

