#!/bin/bash
#SBATCH --job-name=average_random         # Nombre del trabajo
#SBATCH --mail-type=END,FAIL              # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=usuario@uc.cl         # El mail del usuario
#SBATCH --ntasks=1                        # Correr una sola tarea
#SBATCH --mem=1gb                         # Job Memory
#SBATCH --time=0-00:05:00                 # Timpo limite d-hrs:min:sec
#SBATCH --output=results/array_%A-%a.log  # Output (%A se reemplaza por el ID del trabajo maestro, %a se reemplaza por el indice del arreglo)
#SBATCH --array=1-100%10                  # 100 procesos, 10 simultáneos

python3 /user/slurm/samples/array/average.py $SLURM_ARRAY_TASK_ID
