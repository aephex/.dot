#!/bin/bash -e

probe=Tctl
#probe=Tccd1
printf "%.0f°C\n" $(sensors -j k10temp-pci-00c3 | jq -r ".[] | (.${probe} | to_entries[].value)")
