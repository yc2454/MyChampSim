#!/bin/bash

TRACER=${1}
OUTPUT_NAME=${2}
PROGRAM=${3}

../pin-3.2-81205-gcc-linux/pin -injection child -ifeellucky -t ${TRACER} -o ${OUTPUT_NAME} -- ${PROGRAM}