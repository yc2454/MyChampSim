This repo's code is adapted from https://github.com/ChampSim/ChampSim.

# Generate Profile
To find the instructions where cache miss happened, first compile and build with:
```
./build_champsim.sh ${BRANCH} ${L1I_PREFETCHER} ${L1D_PREFETCHER} ${L2C_PREFETCHER} ${LLC_PREFETCHER} ${LLC_REPLACEMENT} ${NUM_CORE}
```
then run
```
Usage: ./run_champsim.sh [BINARY] [N_WARM] [N_SIM] [TRACE] [OPTION]
$ ./run_champsim.sh bimodal-no-no-no-no-lru-1core 1 10 400.perlbench-41B.champsimtrace.xz

${BINARY}: ChampSim binary compiled by "build_champsim.sh" (bimodal-no-no-lru-1core)
${N_WARM}: number of instructions for warmup (1 million)
${N_SIM}:  number of instructinos for detailed simulation (10 million)
${TRACE}: trace name (400.perlbench-41B.champsimtrace.xz)
${OPTION}: extra option for "-low_bandwidth" (src/main.cc)
```
and the result will be stored in `results_${N_SIM}M` as a form of `${TRACE}-${BINARY}-${OPTION}.txt`.

# Generate Trace with Pintool
For our task, we need to customize the trace format. This can be done with:
```
./generate_new_trace.sh [OUTPUT_NAME] [BINARY]
```
