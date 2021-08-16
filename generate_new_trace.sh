#!/bin/bash

OUTPUT_NAME=${1}
PROGRAM=${2}

../pin-3.2-81205-gcc-linux/pin -injection child -ifeellucky -t tracer/obj-intel64/champsim_tracer.so -o ${OUTPUT_NAME} -- ${PROGRAM}