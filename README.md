# Cluster IALAB


**IALAB-cluster** es el *cluster* del grupo [IALAB](https://ialab.ing.puc.cl), de la Pontificia Universidad Católica de Chile.
El cluster cuenta con 248 cores divididos en 6 nodos y su uso principal es como plataforma de experimentación para las investigaciones
realizadas por el grupo IALAB.



### Obteción de acceso

Para tener acceso al cluster debes poseer una cuenta.

### Ingresar al Cluster

Una vez que tengas una cuenta en IALAB podrás conectarte al cluster con el _password_ que se te fue otorgado. Para acceder a los nodos del _cluster_ debes hacer uso de `ssh`. Para los usuarios de Linux y Mac, el comando `ssh` se encuentra disponible. Para usuarios de Windows recomendamos el uso de [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) o [MobaXterm](https://mobaxterm.mobatek.net/).

Desde la terminal te puedes conectar usando el siguiente comando:

```
ssh usuario@kraken.ing.puc.cl
```


### Almacenamiento y acceso archivos

Los usuarios pueden acceder a sus archivos a través de una copia a través de la red usando [scp](https://linux.die.net/man/1/scp).


#### Ejemplos:
```
scp /home/usuario/repos/esquema.cu usuario@kraken.ing.puc.cl:~/cuda/esquema.cu
scp usuario@kraken.ing.puc.cl:~/output.txt /home/usuario/repos/output.txt
scp -r /home/usuario/repos usuario@kraken.ing.puc.cl:~/repos
```

### Slurm

El Cluster utiliza el sistema de colas de Slurm (Simple Linux Universal Resource Manager) para manejar y organizar los recursos y tareas.
#### [Guía de uso de Slurm](/doc/slurm_guide.md)

### Nodos del Cluster

| Nodo     | Modelo                | GPU                   | Cores(fis) | Cores(vir) |
| -------- | --------------------- | --------------------- | ---------- | ---------- |
| ahsoka   | Supermicro Thinkmate  | 4 x Titan X (Pascal)  |  20        |  40        |
| hydra    | Supermicro Thinkmate  | 8 x GeForce GTX1080Ti |  20        |  40        |
| icarus   | Supermicro Thinkmate  | 1 x Tesla K40m        |  20        |  40        | 
| kraken   | Dell Poweredge R730   | N/A                   |  24        |  48        |
| grievous | Supermicro Thinkmate  | 8 x GeForce GTX1080Ti |  20        |  40        | 
| scylla   | Supermicro Thinkmate  |<p>3 x TITAN RTX<p>1 x GeForce GTX 1080Ti<p>1 x GeForce RTX 2080 |  20        |  40        |
| Total:   |                       | 26                    | 124        | 248        |

### Topología
![Topología](/doc/ialabtopology.png)



