#!/bin/bash

export BENCHMARK_PATH=/scratch/cluster/akanksha/SPEC17_installation/benchspec/CPU/
#ARRAY=('603.bwaves_s' '607.cactuBSSN_s' '619.lbm_s' '621.wrf_s' '627.cam4_s' '628.pop2_s' '638.imagick_s' '644.nab_s' '649.fotonik3d_s' '654.roms_s' '600.perlbench_s' '605.mcf_s' '620.omnetpp_s' '623.xalancbmk_s' '625.x264_s' '631.deepsjeng_s' '641.leela_s' '648.exchange2_s' '657.xz_s' '602.gcc_s')
ARRAY=('603.bwaves_s' '607.cactuBSSN_s' '621.wrf_s' '627.cam4_s' '628.pop2_s' '644.nab_s')

ELEMENTS=${#ARRAY[@]}
for (( i=0;i<$ELEMENTS;i++))
do
    benchmark=${ARRAY[${i}]}
    ffwd=`cat $BENCHMARK_PATH/$benchmark/run/run_base_refspeed_x86-m64.0000/single_simpoint_1B/*.Data/t.simpoints | awk '{print $1}'`
    ffwd="$ffwd""000000000"

    echo "$benchmark $ffwd"

    output_dir="/scratch/cluster/akanksha/CRCTraces_SPEC17"
    if [ ! -e "$output_dir" ] ; then
        mkdir $output_dir
        mkdir "$output_dir/scripts"
    fi
    condor_dir="$output_dir"
    script_name="$benchmark"
    output_file="/scratch/cluster/akanksha/CRCTraces_SPEC17/""$benchmark"".gz"

    command=`cat $BENCHMARK_PATH/$benchmark/run/run_base_refspeed_x86-m64.0000/specrun.sh`
#    echo $command

    pin_command="cd $BENCHMARK_PATH/$benchmark/run/run_base_refspeed_x86-m64.0000/;  /u/akanksha/tools/pin-3.2-81205-gcc-linux/pin -injection child -follow_execv -t /u/akanksha/MyChampSim/ChampSim/tracer/obj-intel64/champsim_tracer.so -s $ffwd -t 1000000000 -o $output_file -- $command"
#    echo $pin_command

    /u/akanksha/cache_study/condor_shell --silent --log --condor_dir="$condor_dir" --condor_suffix="$benchmark" --output_dir="$output_dir/scripts" --simulate --script_name="$script_name" --cmdline="$pin_command"

        #Submit the condor file
     /lusr/opt/condor/bin/condor_submit $output_dir/scripts/$script_name.condor

done
