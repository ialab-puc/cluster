#!/bin/bash
#SBATCH --job-name=primos           # Nombre del trabajo
#SBATCH --mail-type=END,FAIL        # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=usuario@uc.cl   # El mail del usuario
#SBATCH --ntasks=1                  # Correr una sola tarea
#SBATCH --mem=1gb                   # Memoria para el trabajo
#SBATCH --time=0-00:05:00           # Timpo limite d-hrs:min:sec
#SBATCH --output=test_%j.log        # Nombre del output (%j se reemplaza por el ID del trabajo)
#SBATCH --error=test_%j.err         # Output de errores (opcional)
#SBATCH --workdir=/user/mi_usuario  # Direccion donde correr el trabajo
#SBATCH --nodes 1                    # numero de nodos a usar
#SBATCH --cpus-per-task=1            # numero de cpus (threads) por trabajo (proceso)  


pwd; hostname; date
 
echo "Corriendo un programa de python en un solo CPU core"

python primes.py

echo "Finished with job $SLURM_JOBID"
date
