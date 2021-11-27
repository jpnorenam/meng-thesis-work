#!/bin/bash

set -e

j=$1 # Threads

for (( i = 0; i < 20 ; i++ )) # Copies
do
    for (( k = 1 ; k <= 100; k++ )) # Sequences
    do
        cd dpsim
        sudo taskset --all-tasks --cpu-list $2-$3 chrt --fifo 99 build/Examples/Cxx/WSCC_9bus_mult_decoupled -ocopies=$i -othreads=$j -oseq=$k
        sudo mv logs/WSCC_9bus_decoupled_${i}_${j}_${k}/WSCC_9bus_decoupled_${i}_${j}_${k}_step_times.log logs
        sudo rm -rf logs/WSCC_9bus_decoupled_${i}_${j}_${k}/
    done
done