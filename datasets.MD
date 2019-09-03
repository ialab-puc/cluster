# Datasets IALAB

Aquí se encuentra una lista de los datasets que se encuentran disponibles en el cluster de IALAB, su ubicación y un link a una página con más detalles de éste.

| Dataset | Ubicación | Tamaño | Nodo |Dominio |
|---------|-----------|--------|------|------|
|      [AVA Actions 2.2](https://github.com/ialab-puc/cluster/blob/datasets/datasets/ava_actions2_2.MD)  |  /vault/araymond    |   34 Gb (videos), 119 Gb (frames)   |    scylla  | Video | 
|       [CLEVR 1.0](https://github.com/ialab-puc/cluster/blob/datasets/datasets/clevr1_0.MD)  |    /mnt/nas2/GrimaRepo/datasets/CLEVR_v1.0/       |  64 Gb (features)       |   Todos   | VQA |
|       CLEVR-CoGenT v1.0  |    /storage1/datasets/CLEVR_CoGenT_v1.0       |  24 Gb (imagenes) 98 Gb (features)       |   grievous   | VQA |
|       [Kinetics-400](https://github.com/ialab-puc/cluster/blob/datasets/datasets/kinetics400.MD) |     /mnt/nas/GrimaRepo/datasets/kinetics-400      |       (videos), (frames)   |   Todos   | Video |
|       Something to Something v2 (jpg) |     /mnt/nas2/GrimaRepo/datasets/20BN-SOMETHING-SOMETHING-V2-1    |       (videos), (frames)   |   Todos   | Video |
|       Something to Something v2 (webm) |     /mnt/nas2/GrimaRepo/datasets/20BN-SOMETHING-SOMETHING-V2    |       (videos), (frames)   |   Todos   | Video |
|       CrossTask |     /mnt/nas/GrimaRepo/datasets/CrossTask   |    32Gb   (features), 85 Gb (videos)   |   Todos   | Video |
|      Places-205 |     /mnt/nas/GrimaRepo/datasets/Places-205  |       (features),  (videos)   |   Todos   | Imágenes |
|     Stanford 2D-3D-S |     /mnt/nas2/GrimaRepo/datasets/Stanford-2D-3D-S_Dataset  |   874 Gb (features)   |   Todos   | Ambientes 2D y 3D |
|      AgeDB |     /mnt/nas2/GrimaRepo/datasets/AgeDB  |      164 Mb (imágenes)   |   Todos   | Imágenes |
|       IMDB-WIKI |     /mnt/nas2/GrimaRepo/datasets/VGGFace  |     9.5 Gb (imágenes)  |   Todos   | Imágenes |
|       [GQA](https://cs.stanford.edu/people/dorarad/gqa/about.html) |     /mnt-vault/scylla/GQA/  |     174 Gb (Spatial and Object features)  |   Todos   | VQA |

## Procedimiento para agregar datasets al Cluster IALAB

* Consultar con Cristián Ruz (cruz@ing.puc.cl) para revisar disponibilidad de espacio y ubicación posible (NAS, NAS2, VAULT).
* Una vez cargado el dataset agregar la línea correspondiente a la tabla anterior con información de:
  * Nombre dataset, el cual actúa como link a una página específica para el dataset.
  * Ubicación en el cluster
  * Tamaño del dataset
  * Nodo desde el que se puede acceder al dataset en caso (por ejemplo, si está alojado en vault)
  * Dominio del dataset: Imágenes, Sonido, VQA, Texto, Video u otro.
* Asegurarse que en la ubicación del dataset se puedan encontrar todos los elementos para trabajar con éste como:
  * Features, sean imágenes, precomputados, texto, etc.
  * Archivos de train, val y test (en caso de haber).
  * Archivos que identifiquen las relación entre clases e ids (en caso de haber)
