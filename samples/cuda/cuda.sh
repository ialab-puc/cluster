#!/bin/bash
#SBATCH --job-name=MultiplyBy2       # Nombre del trabajo
#SBATCH --output=test_%j.log         # Nombre del output (%j se reemplaza por el ID del trabajo)
#SBATCH --error=test_%j.err          # Output de errores (opcional)
#SBATCH --ntasks=2                   # Correr 2 tareas
#SBATCH --cpus-per-task=1            # Numero de cores por tarea
#SBATCH --distribution=cyclic:cyclic # Distribuir las tareas de modo ciclico
#SBATCH --time=0-05:00:00            # Timpo limite d-hrs:min:sec
#SBATCH --mem-per-cpu=2000mb         # Memoria por proceso
#SBATCH --mail-type=END,FAIL         # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=usuario@uc.cl    # El mail del usuario
#SBATCH --partition=gpu              # Se tiene que elegir una partición de nodos con GPU
#SBATCH --gres=gpu:1                 # Usar 2 GPUs  (se pueden usar N GPUs de marca especifica usando --gres=gpu:marca:N)

srun --gres=gpu:1 -n 1 /user/slurm/samples/cuda/mulBy2


