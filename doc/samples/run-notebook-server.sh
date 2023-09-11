#!/bin/bash
#SBATCH --job-name=notebook-server
#SBATCH --mail-type=NONE                    # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=<mail>@uc.cl            # El mail del usuario
#SBATCH --ntasks=1                          # Correr una sola tarea
#SBATCH --output=%x_%j.log                  # Nombre del output (%j se reemplaza por el ID del trabajo)
#SBATCH --error=%x_%j.log                   # Output de errores (opcional)
#SBATCH --partition=ialab-high
#SBATCH --nodelist=<node>
#SBATCH --workdir=<workdir>                 # Direccion donde correr el trabajo
#SBATCH --time=6:00:00                      # job live for 6 hours max
##SBATCH --gres=gpu:1

pwd; hostname; date
echo "Running notebook server"

source ~/<venv-path>/bin/activate
pip install jupyter

jupyter notebook --no-browser --ip="*" --port=<port> # choose arbitrary port to connect to tunnel
