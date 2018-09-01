# Ejemplos Slurm Scripts
A continución se muestran los siguentes scripts tienen el objetivo de servir como base para tu código.

## Un Proceso
Este script tiene la esctructura básica para hacer correr un programa en Slurm.

Recordar`$SLURM_JOBID` es una variable de entorno la cual es seteada por Slurm con el ID del trabajo.

```bash
#!/bin/bash
#SBATCH --job-name=nombre_trabajo   # Nombre del trabajo
#SBATCH --mail-type=END,FAIL        # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=usuario@uc.cl   # El mail del usuario
#SBATCH --ntasks=1                  # Correr una sola tarea
#SBATCH --mem=1gb                   # Memoria para el trabajo
#SBATCH --time=0-00:05:00           # Timpo limite d-hrs:min:sec
#SBATCH --output=test_%j.log        # Nombre del output (%j se reemplaza por el ID del trabajo)
#SBATCH --error=test_%j.err         # Output de errores (opcional)
#SBATCH --workdir=/user/mi_usuario  # Direccion donde correr el trabajo

pwd; hostname; date
 
echo "Corrinedo un programa de python en un solo CPU core"

python plot_template.py

echo "Finished with job $SLURM_JOBID"
date
```

## Multiproceso

Este script permite correr programas que requieran más de un thread, como es el caso con pthreads o OpenMP. La línea `export OMP_NUM_THREADS` es opcional solo para trabajos con OpenMP.

```bash
#!/bin/bash
#SBATCH --job-name=nombre_trabajo   # Nombre del trabajo
#SBATCH --mail-type=END,FAIL        # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=usuario@uc.cl   # El mail del usuario
#SBATCH --ntasks=1                  # Correr una sola tarea
#SBATCH --mem=500mb                 # Memoria para el trabajo
#SBATCH --time=0-00:05:00           # Timpo limite d-hrs:min:sec
#SBATCH --output=test_%j.log        # Nombre del output (%j se reemplaza por el ID del trabajo)
#SBATCH --workdir=/user/mi_usuario  # Direccion donde correr el trabajo
#SBATCH --cpus-per-task=4           # Numero de CPU cores por tarea
pwd; hostname; date

export OMP_NUM_THREADS=4
echo "Corriendo el programa en $SLURM_CPUS_ON_NODE CPU cores"

./prog_multi_proc

date
```

## MPI
Este script es utilizado para correr varias tareas en un mismo o distintos nodos usando MPI para la comunicación entre los nodos en cada tarea.

Con la finalidad de mejorar el funcionamiento del script, se debe prestar atención a las siguentes directivas:

* `-c, --cpus-per-task=<ncpus>` Esta directiva indica el número de cpus por trabajo
* `-m, --distribution=arbitrary|<block|cyclic|plane=<options>[:block|cyclic|fcyclic]>` Esta directiva indica las altenativas distribución para procesos remotos.
    * Recomendamos usar `-m cyclic:cyclic`  el cual le dice a Slurm que distribuya las tareas ciclicamente sobre los nodos y sockets.
* `-N, --nodes=<minnodes[-maxnodes]>` Esta directiva indica el maximo y mínimo de nodos a usar.
* `-n, --ntasks=<number>` Esta directiva indica el numero de tareas (MPI ranks).
* `--ntasks-per-node=<ntasks>` Esta directiva indica el numero de tareas por nodo.
* `--ntasks-per-socket=<ntasks>` Esta directiva indica el numero de tareas por socket.

Para un mayor control sobre los trabajos, vea la [documentación de sbatch](slurm.schedmd.com/sbatch.html).

El siguiente script describe un trabajo con las siguientes caracteríticas:
* 24 tareas.
* 12 tareas por nod.
*  6 tareas por socket.
Por lo tanto serán 24 tareas, cada una con un core. Luego se dividiran en dos nodos, para luego separarse las 12 tareas en dos socket. Entonces cada CPU en los dos nodos tendrá 6 tareas, cada una con su propio core dedicado.

Slurm es muy flexible acerca del manejo de los recursos, permitiendo al usuario ser bastante específico en cuanto a los recursos que desea utilizar.

```bash
#!/bin/bash
#SBATCH --job-name=nombre_trabajo    # Nombre del trabajo
#SBATCH --mail-type=END,FAIL         # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=usuario@uc.cl    # El mail del usuario
#SBATCH --time=0-00:05:00            # Timpo limite d-hrs:min:sec
#SBATCH --output=test_%j.log         # Nombre del output (%j se reemplaza por el ID del trabajo)
#SBATCH --workdir=/user/mi_usuario   # Direccion donde correr el trabajo
#SBATCH --mem-per-cpu=600mb          # Memoria por proceso
#SBATCH --ntasks=24                  # Numero de MPI ranks
#SBATCH --cpus-per-task=1            # Numero de cores por MPI rank 
#SBATCH --nodes=2                    # Numero de nodos
#SBATCH --ntasks-per-node=12         # Numero de tareas por nodo
#SBATCH --ntasks-per-socket=6        # Numero de tareas por socket
#SBATCH --distribution=cyclic:cyclic # Distribuir las tareas de modo ciclico sobre los nodos y sockets
pwd; hostname; date

echo "Corriendo un programa con $SLURM_JOB_NUM_NODES nodos, con $SLURM_NTASKS tareas, cada una con $SLURM_CPUS_PER_TASK cores."

srun --mpi=pmix_v1 ./mpi_proc

date
```

## Array
El siguiente código permite correr múltiples procesos a la vez en forma de Array para lograr paralelizar trabajos externamente. En este ejemplo usamos un trabajo de "Un Proceso" pero se puede aplicar a todos los casos vistos en este documento.

La variable de entorno `$SLURM_ARRAY_TASK_ID` es seteada por Slurm para indicar el índice del arreglo. Puede ser usada como input, por ejemplo: `python test.py $SLURM_ARRAY_TASK_ID`.

Para más información se recomienda leer el wiki de "University of Florida" sobre [Slurm Job Arrays](https://help.rc.ufl.edu/doc/SLURM_Job_Arrays) (en inglés).


```bash
#!/bin/bash
#SBATCH --job-name=nombre_trabajo   # Nombre del trabajo
#SBATCH --mail-type=END,FAIL        # Enviar eventos al mail (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=usuario@uc.cl   # El mail del usuario
#SBATCH --ntasks=1                  # Correr una sola tarea
#SBATCH --mem=1gb                   # Job Memory
#SBATCH --time=0-00:05:00           # Timpo limite d-hrs:min:sec
#SBATCH --output=array_%A-%a.log    # Output (%A se reemplaza por el ID del trabajo maestro, %a se reemplaza por el indice del arreglo)
#SBATCH --array=1-100%10            # 100 procesos, 10 simultáneos
#SBATCH --output=test_%j.log        # Nombre del output (%j se reemplaza por el ID del trabajo)
pwd; hostname; date

echo This is task $SLURM_ARRAY_TASK_ID

date
```

## GPU 
Este es un script para correr programas en CUDA o OpenCL que necesiten GPU. El siguiente script corre el programa en CUDA `cuda_test` en 2 GPUs marca Tesla distintas.

```bash
#!/bin/bash
#SBATCH --job-name=nombre_trabajo    # Nombre del trabajo
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
#SBATCH --gres=gpu:tesla:2           # Usar 2 GPUs marca Tesla (se pueden usar N GPUs cualquiera de la manera --gres=gpu:N, la marca es un ejemplo)
date;hostname;pwd

srun --gres=gpu:tesla:1 -n 1 ./cuda_test

date
```

