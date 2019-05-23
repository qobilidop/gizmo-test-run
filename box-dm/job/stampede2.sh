#!/bin/bash
# usage: sbatch job/stampede2.sh
# https://portal.tacc.utexas.edu/user-guides/stampede2#slurm-partitions-queues
#SBATCH -J toy-box
#SBATCH -p skx-dev
#SBATCH -N 4
#SBATCH --ntasks-per-node=24
#SBATCH -t 2:00:00
#SBATCH -o gizmo.log
#SBATCH -D .
set -e
spack env activate gizmo
module list
set -x

# https://portal.tacc.utexas.edu/user-guides/stampede2#job-scripts
export OMP_NUM_THREADS={{ job.run.omp }}
export MPIRUN="ibrun"
if [[ -d output/restartfiles ]]; then
    GIZMO_RUN_MODE=1
else
    GIZMO_RUN_MODE=
fi
export GIZMO_RUN_MODE

pwd
date
make run-gizmo
date
