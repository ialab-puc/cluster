#!/bin/bash
#SBATCH --job-name=matrixMul        # Nombre del trabajo
#SBATCH --mail-type=END,FAIL        # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=usuario@uc.cl   # El mail del usuario
#SBATCH --ntasks=1                  # Correr una sola tarea
#SBATCH --mem=500mb                 # Memoria para el trabajo
#SBATCH --time=0-00:05:00           # Timpo limite d-hrs:min:sec
#SBATCH --output=test_%j.log        # Nombre del output (%j se reemplaza por el ID del trabajo)
#SBATCH --cpus-per-task=4           # Numero de CPU cores por tarea
pwd; hostname; date

export OMP_NUM_THREADS=4
echo "Corriendo el programa en $SLURM_CPUS_ON_NODE CPU cores"

/user/slurm/samples/openmp/matrixMul

date