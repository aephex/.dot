#!/bin/bash -e
data=($(liquidctl status --json | jq -r '.[].status[] | select(.key | match(["Fan 1 (duty|speed)", "g"])) | [.value, .unit] | join("")'))
duty=${data[0]::-1}
duty=$(printf "%.0f%%" "${duty}")
speed=${data[1]}

case "$1" in
    duty)
        echo ${duty}
        ;;
    speed)
        echo ${speed}
        ;;
    *)
        echo ${duty}
        echo ${speed}
        ;;
esac
