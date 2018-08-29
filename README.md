# Cluster IALAB


IALAB es un cluster ubicado en la Pontificia Universidad Católica de Chile el cual tiene 196 cores. Los nodos que cuentan con GPU integrada corresponden a Titan, Icarus, Hydra, Scylla y Ahsoka. 


### Obteción de acceso

Para tener acceso al cluster debes poseer una cuenta, si no tienes una debes completar el siguiente [formulario](https://docs.google.com/forms/d/e/1FAIpQLSfbmOJrBAHTIk2atyXRN_vPMGN94Bx7OMLBPAd23ew6xGzh0w/viewform) con tus datos.

### Ingresar al Cluster

Una vez que tengas una cuenta en IALAB, deberías poder conectarte al cluster con el password que se te fue otorgado. Para acceder a los nodos del cluster deber hacer uso de ssh, para los usuarios de Linux y Mac esté viene ya implementado mientras que para usuarios de Windows recomendamos el uso de [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).

Desde la terminal te puedes conectar usando el siguiente comando:


```
ssh usuario@hercules.ing.puc.cl
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
#### [Guía de uso de Slurm](/doc/Guia.md)

### Nodos del Cluster

| Nodo     | Modelo                | GPU                   | Cores(fis) | Cores(vir) |
| -------- | --------------------- | --------------------- | ---------- | ---------- |
| Hercules | Dell PowerEdge SC1435 | N/A                   | 8          | 8          |
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



