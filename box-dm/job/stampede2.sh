#!/bin/bash
# usage: sbatch job/stampede2.sh
#SBATCH -J box-dm
#SBATCH -p skx-dev
#SBATCH -N 4
#SBATCH --ntasks-per-node=24
#SBATCH -t 2:00:00
#SBATCH -o gizmo.log
#SBATCH -D .
set -e
module list
spack env activate gizmo
set -x
pwd
date

export MPIRUN="ibrun"
if [[ -d output/restartfiles ]]; then
    RESTART_FLAG=1
else
    RESTART_FLAG=
fi
export RESTART_FLAG

make run-gizmo

date
