#!/bin/bash

#MAIN ACCENT
GREEN="#bae2de"
#############
GRAY="#b6b8bb"
BLACK="#0c0c0c"

SONG=$(media-control get 2>/dev/null | jq -r 'select(.playing == true) | "\(.artist) - \(.title)" | .[:50]')


if [ -n "$SONG" ]; then
    # PLAYING:
    echo "#[fg=$GRAY,bg=default,nobold,nounderscore,noitalics]#[fg=$BLACK,bg=$GRAY] ♫ $SONG #[fg=$GREEN,bg=$GRAY]"
else
    # NOT PLAYING:
    echo "#[fg=$GREEN,bg=default]"
fi
