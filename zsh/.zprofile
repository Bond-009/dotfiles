if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
then
    source .profile
    startxfce4
fi
