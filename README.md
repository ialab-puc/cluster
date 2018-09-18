# Cluster IALAB


**IALAB-cluster** es el *cluster* del grupo [IALAB](https://ialab.ing.puc.cl), de la Pontificia Universidad Católica de Chile.
El cluster cuenta con 248 cores divididos en 10 nodos y su uso principal es como plataforma de experimentación para las investigaciones
realizadas por el grupo IALAB.



### Obteción de acceso

Para tener acceso al cluster debes poseer una cuenta. Si no tienes una debes completar el siguiente [formulario](https://docs.google.com/forms/d/e/1FAIpQLSfbmOJrBAHTIk2atyXRN_vPMGN94Bx7OMLBPAd23ew6xGzh0w/viewform) con tus datos.

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
scp /home/usuario/repos/esquema.cu usuario@hercules.ing.puc.cl:~/cuda/esquema.cu
scp usuario@hercules.ing.puc.cl:~/output.txt /home/usuario/repos/output.txt
scp -r /home/usuario/repos usuario@hercules.ing.puc.cl:~/repos
```

### Slurm

El Cluster utiliza el sistema de colas de Slurm (Simple Linux Universal Resource Manager) para manejar y organizar los recursos y tareas.
#### [Guía de uso de Slurm](/doc/slurm_guide.md)

### Nodos del Cluster

| Nodo     | Modelo                | GPU                   | Cores(fis) | Cores(vir) |
| -------- | --------------------- | --------------------- | ---------- | ---------- |
| hercules | Dell PowerEdge SC1435 | N/A                   | 8          | 8          |
| ahsoka   | Supermicro Thinkmate  | 4 x Titan X           | 20         | 40         |
| caleuche | Supermicro 815-6      | N/A                   | 8          | 40         |
| hydra    | Supermicro Thinkmate  | 8 x GeForce GTX1080Ti | 20         | 40         |
| icarus   | Supermicro Thinkmate  | 1 x Tesla K40m        | 20         | 40         | 
| kraken   | Dell Poweredge R730   | N/A                   | 24         | 48         |
| makemake | DELL PowerEdge R815   | N/A                   | 64         | 64         |
| scylla   | Supermicro Thinkmate  | 8 x GeForce GTX1080Ti | 20         | 40         |
| titan    | Dell Precision R5500  | 1 x Tesla C2075       | 8          | 8          |
| trauco   | Dell PowerEdge R420   | N/A                   | 8          | 8          |
| tripio   | HP Proliant DL180 G6  | N/A                   | 4          | 8          |
| Total:   |                       | 22                    | 196        | 344        |

### Topología
![Topología](/doc/ialabtopology.png)



