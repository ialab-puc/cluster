## Datasets IALAB

Aquí se encuentra una lista de los datasets que se encuentran disponibles en el cluster de IALAB, su ubicación y un link a una página con más detalles de éste.

| Dataset | Ubicación | Tamaño | Nodo |Dominio |
|---------|-----------|--------|------|------|
|      AVA Actions 2.2  |  /vault/araymond/ava_frames         |   34Gb (videos), 119 Gb (frames)   |    scylla  | Video | 
|       CLEVR 1.0  |    /mnt/nas2/GrimaRepo/datasets/CLEVR_v1.0/       |  64Gb (features)       |   Todos   | VQA |
|       Kinetics-400 |     /mnt/nas/GrimaRepo/datasets/kinetics-400      |       (videos), (frames)   |   Todos   | Video |
|       Something to Something v2 |     /mnt/nas2/GrimaRepo/datasets/20BN-SOMETHING-SOMETHING-V2-1    |       (videos), (frames)   |   Todos   | Video |
|       CrossTask |     /mnt/nas/GrimaRepo/datasets/CrossTask   |    32GB   (features), 85 Gb (videos)   |   Todos   | Video |
|      Places-205 |     /mnt/nas/GrimaRepo/datasets/Places-205  |    32GB   (features), 85 Gb (videos)   |   Todos   | Imágenes |

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
