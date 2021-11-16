#!/bin/bash
for (( i = 0; i < 20 ; i++ ))
do
    for (( j = 0 ; j <= 12; j = j+2 ))
    do
        for (( k = 1 ; k <= 100; k++ ))
        do
            sudo /dpsim-rt/dpsim/build/Examples/Cxx/WSCC_9bus_mult_decoupled -ocopies=$i -othreads=$j -oseq=$k
            sudo mv /dpsim-rt/dpsim/logs/WSCC_9bus_decoupled_${i}_${j}_${k}/WSCC_9bus_decoupled_${i}_${j}_${k}_step_times.log /dpsim-rt/dpsim/logs
            sudo rm -rf /dpsim-rt/dpsim/logs/WSCC_9bus_decoupled_${i}_${j}_${k}/
        done
    done
done