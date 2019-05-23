#!/bin/bash
# usage: qsub job/tscc.sh
#PBS -N box-dm
#PBS -q condo
#PBS -l nodes=2:ppn=16
#PBS -l walltime=8:00:00
#PBS -j oe
#PBS -o gizmo.log
#PBS -d .
set -e
module list
spack env activate gizmo
set -x
pwd
date

export MPIRUN="mpirun -npernode 16"
if [[ -d output/restartfiles ]]; then
    RESTART_FLAG=1
else
    RESTART_FLAG=
fi
export RESTART_FLAG

make run-gizmo

date
