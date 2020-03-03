# Guía de uso Slurm

## Introducción a Slurm

**SLURM** es el administrador de trabajos o _scheduler_ del cluster. Es el encargado de gestionar las colas. En la actualidad es utilizado en el 60%  de los supercomputadores del [top500](https://www.top500.org/). La versión disponible en el cluster es la [ 17.11.2](https://slurm.schedmd.com/).

#### Principales funciones
* #### Gestión de tareas en la cola
* #### Asignación de recursos
* #### Permite la modificación de tareas durante su ejecución

## ¿Dónde se encuentra?

*SLURM* utiliza una topología _master_/_worker_ donde el nodo principal (_master_), que ejecuta el servicio _slurmctld_ se encuentra en `kraken.ing.puc.cl`.

*SLURM* define grupos de nodos llamados _particiones_. Para cada partición se administra una _cola de trabajos_ con parámetros propios de duración máxima, cantidad de nodos y procesos a utilizar.

## Comandos básicos

Existe documentación para cada comando en la página oficial de *SLURM*. Algunos de los comandos básicos para el uso del scheduler se encuentran detallados a continuación.

### [sinfo](https://slurm.schedmd.com/sinfo.html)
Imprime información sobre las particiones del cluster y sus estados.
##### Ejemplo:
```
user@kraken:~$ sinfo
PARTITION  AVAIL  TIMELIMIT  NODES  STATE NODELIST
ialab-low*    up 3-00:00:00      1  down* icarus
ialab-low*    up 3-00:00:00      1    mix ahsoka
ialab-high    up 8-00:00:00      3    mix grievous,hydra,scylla
ialab-high    up 8-00:00:00      1   idle kraken
all           up 3-00:00:00      1  down* icarus
all           up 3-00:00:00      4    mix ahsoka,grievous,hydra,scylla
all           up 3-00:00:00      1   idle kraken
```

### [squeue](https://slurm.schedmd.com/squeue.html)
Permite ver el estado de los trabajos que se encuentran en la cola de Slurm.
Además es posile filtrar la información del trabajo por usuario usando el parametro ```-u [usuario]```.
##### Ejemplo:
```
user@kraken:~$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
               586 ialab-low train_mo fcorenco  R 1-16:55:44      1 ahsoka
               587 ialab-low train_mo fcorenco  R 1-16:53:43      1 ahsoka
               652 ialab-hig  jupyter rmantero  R   17:47:04      1 grievous
               691 ialab-hig  jupyter fcorenco  R   16:38:51      1 grievous
               697 ialab-hig train_sl fariquel  R   16:06:14      1 hydra
               724 ialab-hig train_sl fariquel  R    9:32:31      1 hydra
               727 ialab-hig train_sl fariquel  R    9:19:54      1 hydra
               732 ialab-hig netx-dig   mgreco  R    8:30:29      1 scylla
               742 ialab-hig     bash ceyzagui  R       0:06      1 scylla

```

### sq (Comando creado por nosotros en el IA-Lab)
Es una versión mejorada de squeue
##### Ejemplo:
```
user@kraken:~$ sq

 JOBID                   NAME   USER  TIME TASKS CPU CPU/TSK GPU MEM     NODE
   291                mac-act  user1  1.9d     1                      (ended)
     3   scan-notebook-server  user2     -     1   2       1   1   -  (hydra)
   302                mac-act  user2     -     1   5       5   1   -  (hydra)
   320                 rsscnn  user3     -     1   4       4   1 24G (scylla)
   322                 rsscnn  user3     -     1   4       4   1 24G (scylla)
   323                 rsscnn  user3     -     1   4       4   1 24G (scylla)
   324                 rsscnn  user3     -     1   4       4   1 24G (scylla)
   325                 rsscnn  user3     -     1   4       4   1 24G (scylla)
   250             traindummy  user4  4.8d     1   2       1   1   - grievous
   271    preprocess_hydra.sh  user5  4.8d     1  10      10   - 30G    hydra
   273   preprocess_scylla.sh  user6  4.8d     1  10      10   - 30G   scylla
   275 preprocess_grievous.sh  user7  4.8d     1  10      10   - 30G grievous

```

### [srun](https://slurm.schedmd.com/srun.html)
Envía un trabajo iterativo a la cola de ejecución de Slurm.
Se debe definir el parametro ```-n [numero]``` para definir el numero de ejecucciones paralelas.
##### Ejemplo:
```
$ srun -n 2 python main.py
```

### [sbatch](https://slurm.schedmd.com/sbatch.html)
Permite añadir un trabajo a a cola de Slurm.

##### Ejemplo:
```
$ cat script.sh
#!/bin/bash
#SBATCH --job-name=compile
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o c_job.out                 # STDOUT (A = )
#SBATCH -e c_job.err                 # STDERR
#SBATCH --mail-type=END,FAIL         # notificacion cuando el trabajo termine o falle
#SBATCH --mail-user=usuario@uc.cl    # mail donde mandar las notificaciones
#SBATCH --workdir=/user/miusuario    # direccion del directorio de trabajo
#
#SBATCH --nodes 1                    # numero de nodos a usar
#SBATCH --ntasks-per-node=24         # numero de trabajos (procesos) por nodo
#SBATCH --cpus-per-task=1            # numero de cpus (threads) por trabajo (proceso)  

gcc -o a.out main.c
echo "Finished with job $SLURM_JOBID"
```
```
$ cat script-array.sh
#!/bin/bash
#SBATCH --job-name=trabajito
#SBATCH -t 0-2:00                    # tiempo maximo en el cluster (D-HH:MM)
#SBATCH -o slurm-%a.out              # STDOUT
#SBATCH -e slurm-%a.err              # STDERR
#SBATCH --mail-type=ALL              # notificacion cuando el trabajo termine o falle
#SBATCH --mail-user=usuario@uc.cl    # mail donde mandar las notificaciones
#SBATCH --workdir=/user/miusuario    # direccion del directorio de trabajo
#
#SBATCH --ntasks 1                   # 1 trabajo
#SBATCH --array 1-100%10             # 100 procesos, 10 simultáneos

python3 main.py $SLURM_ARRAY_TASK_ID

$ sbatch script.sh
Submitted batch job 60
```

### [scancel](https://slurm.schedmd.com/scancel.html)
Permite cancelar un trabajo por su JobID
##### Ejemplo:
```
$ sbatch script.sh
Submitted batch job 14

$ scancel 14
```
### [scontrol](https://slurm.schedmd.com/scontrol.html)
Es usado para ver o modificar el estado de un trabajo.
##### Ejemplo:
```
$ sbatch script.sh
Submitted batch job 29

$ scontrol hold 29
```
El comando hold detendrá la ejecución mientras que release la retomará.
```
$ scontrol release 29
```

### sshow <jobid> (Comando creado por nosotros en el IA-Lab)
Es usado para ver información relevante de un trabajo

##### Ejemplo:
```
$ sshow 250

JobId      : 250
JobName    : traindummy
UserId     : username
GroupId    : ialab
Partition  : ialab-high
NumNodes   : 1
Nodes      : grievous
ReqNodeList: grievous
ExcNodeList: (null)
NodeList   : grievous
BatchHost  : grievous
NumTasks   : 1
CPUs/Task  : 1
NumCPUs    : 2
cpu        : 2
Gres       : gpu:1
GRES_IDX   : gpu(IDX:1)
CPU_IDs    : 0-1
RunTime    : 4-19:17:12
TimeLimit  : 8-00:00:00
SubmitTime : 2020-02-27T14:51:15
StartTime  : 2020-02-27T17:24:19
EndTime    : 2020-03-06T17:24:19
JobState   : RUNNING
ExitCode   : 0:0
WorkDir    : /home/username
Command    : /home/username/train_dummy.sh
StdOut     : /home/username/logs/250-4294967294-dummy.log
```


### sfree (Comando creado por nosotros en el IA-Lab)
Es usado para saber qué recursos hay disponibles en el cluster

##### Ejemplo:
```
$ sfree

|   NODE   |    RAM    |  CPU  | GPU |         FREE GPU DETAIL         |
|----------+-----------+-------+-----+---------------------------------|
|  KRAKEN  | 126G/126G | 48/48 |  -  |                                 |
|----------+-----------+-------+-----+---------------------------------|
|  AHSOKA  |  56G/126G | 26/40 | 3/4 |   3 x TITAN X (Pascal) (12.8G)  |
|----------+-----------+-------+-----+---------------------------------|
|  HYDRA   | 222G/252G |  0/40 | 3/8 | 2 x GeForce-GTX 1080 Ti (11.7G) |
|          |           |       |     |      1 x Titan-RTX (25.4G)      |
|----------+-----------+-------+-----+---------------------------------|
|  SCYLLA  |  72G/126G | 24/40 | 5/7 |      2 x GeForce-GT (11.7G)     |
|          |           |       |     |      1 x GeForce-RT (11.6G)     |
|          |           |       |     |      1 x GeForce-RT (8.4G)      |
|          |           |       |     |      1 x Titan-RTX (25.4G)      |
|----------+-----------+-------+-----+---------------------------------|
| GRIEVOUS | 222G/252G |  4/40 | 4/8 | 4 x GeForce-GTX 1080 Ti (11.7G) |
|----------+-----------+-------+-----+---------------------------------|
|  ICARUS  | 126G/126G | 40/40 | 1/1 |      1 x Tesla K40m (12.0G)     |
+----------+-----------+-------+-----+---------------------------------+
```


## Variables de entorno

Slurm establecera o preestablecerá las variables de entorno que puedan ser usadas en el script. En la siguiente tabla se muestras las mas usadas:

|Descripción      |Slurm                        |
|-----------------|-----------------------------|
|JobID            |$SLURM_JOBID                 |
|Submit Directory |$SLURM_SUBMIT_DIR (default)  |
|Submit Host      |$SLURM_SUBMIT_HOST           |
|Node List        |$SLURM_JOB_NODELIST          |
|Job Array Index  |$SLURM_ARRAY_TASK_ID         |


## Flags comunes

A continuación se muestra una lista de los flags más comunes que un usuario puede incluir en su trabajo, ya sean para solicitar recursos o características para el trabajo.

|Descripción      |Slurm                           |
|-----------------|--------------------------------|
|Nombre del trabajo       |#SBATCH --job-name=My-Job_Name  |
|Número de nodos solicitados |#SBATCH --nodes=1 |
|Número de cores por nodo solicitados |#SBATCH --ntasks-per-node=24        |
|Copia las variables de entorno del usuario  |#SBATCH --export=[ALL\|NONE\|Variables]  |
|Restricción de tiempo |#SBATCH --time=24:0:0   |
|Reiniciar un trabajo en caso de falla|#SBATCH --requeue  |
|Compartir los nodos |#SBATCH --shared |
|Reservar los nodos para uso exclusivo|#SBATCH --exclusive |
|Uso de un recurso específico |#SBATCH --constraint="XXX"|
|Uso de memoria |#SBATCH --mem=[mem \|M\|G\|T] o --mem-per-cpu |
|Email usuario |#SBATCH --mail-user=username@uc.cl |
|Solicitud nodo específico |#SBATCH --nodelist=Caleuche |


## Flags importantes en tu trabajo

Es importante conocer los flags que puedes utilizar para una adecuada administración de los recursos dado que su correcto uso traerá beneficios tanto para scheduler como para tu trabajo.

#### Restricción de tiempo

Para restringir el tiempo que correrá un trabajo se hace uso de [--time](https://slurm.schedmd.com/sbatch.html)  donde se específica el tiempo mínimo y máximo que tiene permitido correr dentro del cluster. Por un lado, si el tiempo solicitado no es suficiente el programa será cortado y los resultados se perderán.  Por otro lado, si el tiempo específicado es demasiado el trabajo permanecerá en la cola por mucho tiempo mientras el scheduler busca los recursos que solicitó, además, una vez asignados los recursos otros programas no podrán acceder a ellos afectando la eficiencia de la administración de Slurm.

##### Ejemplo:
Al incluir la siguiente línea en el script el tiempo máximo serán dos horas.

```
#SBATCH -t 0-2:00                               # time (D-HH:MM)
```

#### Nodos

Reservar un nodo para uso es posible con el comando [--exlusive](https://slurm.schedmd.com/sbatch.html), sin embargo el uso de este flags se recomienda ser usado en el caso que el programa que se desea correr depende en gran parte de la transferencia de datos entre los trabajos, esto justificaría la asignación a un solo usuario de un nodo completo.En la mayoŕía de los casos los trabajos son relativamente pequeños permitiendo que puedan compartir un mismo nodo, para todas estas situaciones se mantendrá la configuración determinada [--shared](https://slurm.schedmd.com/sbatch.html) en el nodo. 

El número de nodos que se desea utilizar es definidos con [--nodes o -N](https://slurm.schedmd.com/sbatch.html) donde es posible usar un intervalo de nodos necesarios como 2-4  para este caso el scheduler correra el programa cuando encuentre al menos 2 nodos disponibles si encuentra los 4 correrá utilizando los 4 sugeridos, en cambio si específica un número de nodos específicos como 5 no correrá hasta hallar disponibles 5. Se recomienda verificar las disponibilidad de los nodos antes de lanzar el trabajo utilizando el comando [--sinfo](https://slurm.schedmd.com/sinfo.html) como se mencionó anteriormente.

### Uso de GPU

A pesar que hay muchos cores dentro de la GPU estos no son compatibles con el estándar intel x86, es por esto que el código debe ser escrito utilizando [CUDA](https://www.nvidia.es/object/cuda-parallel-computing-es.html).

Para solicitar el uso de gpu en tu trabajo se utilizan --gres=gpu ó --gres=gpu:N donde N es el número de gpus por nodo.

##### Ejemplo:
```
#SBATCH -t 0-2:00                               # time (D-HH:MM)
#SBATCH -N 4
#SBATCH --gres=gpu

cd /slurm/gpuExamples
./run_my_gpu_code

```
### Scripts básicos
En este [documento](/doc/slurm_samples.md) podrás encontrar algunos scripts básicos para el uso de slurm en determinados casos.

#### Valores por defecto en la configuración de SLURM
|||
|--|--|
|Node | available in the partition|
|Partition| ialab-low|
|DefMemPerNode  | UNLIMITED|
|MaxMemPerNode  | UNLIMITED|
|MaxTasksPerNode| 512      |
