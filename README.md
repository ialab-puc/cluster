# Cluster IALAB


**IALAB-cluster** es el *cluster* del grupo [IALAB](https://ialab.ing.puc.cl), de la Pontificia Universidad Católica de Chile.
El cluster cuenta con 248 cores divididos en 6 nodos y su uso principal es como plataforma de experimentación para las investigaciones
realizadas por el grupo IALAB.

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
| ahsoka   | Supermicro Thinkmate  | <p>3 x Titan X (Pascal)<p>1 x GeForce GTX 1080 Ti  |  20        |  40        |
| grievous | Supermicro Thinkmate  | 8 x GeForce GTX 1080 Ti |  20      |  40        |
| ventress | Tyan FT77CB7079       | 8 x GeForce RTX 2080 Super | 20    |  40        |
| yodaxico | Tyan Thunder HX FA77-B7119 |<p>2 x TITAN RTX<p>2 x GeForce RTX 2080 Ti | 20 | 40 |
| hydra    | Supermicro Thinkmate  |<p>5 x GeForce GTX 1080 Ti<p>3 x TITAN RTX |  20        |  40        |
| scylla   | Supermicro Thinkmate  |<p>3 x TITAN RTX<p>2 x GeForce GTX 1080 Ti<p>1 x GeForce RTX 2080 Ti<p>1 x GeForce RTX 2080 Super |  20        |  40        |
| Total:   |                       | 39                    | 120        | 248        |

### Topología (outdated)
![Topología](/doc/topologia2019ialab.png)



