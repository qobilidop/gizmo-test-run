#!/bin/bash
# usage: sbatch job/bridges.sh
#SBATCH -J box-dm
#SBATCH -p RM-small
#SBATCH -N 2
#SBATCH --ntasks-per-node=28
#SBATCH -t 8:00:00
#SBATCH -o gizmo.log
#SBATCH -D .
set -e
module list
spack env activate gizmo
set -x
pwd
date

export I_MPI_JOB_RESPECT_PROCESS_PLACEMENT=0
export MPIRUN="mpirun -n $SLURM_NTASKS -ppn $SLURM_NTASKS_PER_NODE"
if [[ -d output/restartfiles ]]; then
    RESTART_FLAG=1
else
    RESTART_FLAG=
fi
export RESTART_FLAG

make run-gizmo

date
