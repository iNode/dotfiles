#!/bin/sh

time_start()
{  # init timer
    timer=$(($(date +%s%N)/1000000))
}

time_show_and_reset()
{  # show elapsed time and reset timer

    now=$(($(date +%s%N)/1000000))
    elapsed=$((now - timer))
    echo "$elapsed: $1"
    time_start
}
