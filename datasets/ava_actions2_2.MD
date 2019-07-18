# AVA Actions 2.2

URL: https://research.google.com/ava/index.html

Este dataset fue creado por Google para las tareas de localización y clasificación de acciones en video. El dataset consiste en 430 videos largos (15 minutos), anotados densamente cada segundo. Los videos contienen múltiples actores (siempre personas) y múltiples acciones ocurriendo al mismo tiempo. Existen 80 clases que clasificar, sin embargo, usualmente sólo se ocupan 60, pues las 20 restantes no poseen datos suficientes en validación. El dataset se encuentra muy desbalanceado. Las primeras 6 clases concentran más del 85% de los datos.

## Carpetas Relevantes
* *ava_frames*: contiene los frames de cada video.
* *ava_videos/data_videos*: contiene el video completo.
* *ava_videos/processed*: contiene el video cortado al rango 900s-1800s.

## Comentarios

Para bajar el dataset se utilizó el código del siguiente repositorio:
https://github.com/alainray/ava_downloader

En el mismo repositorio se encuentra código para cortar los videos y convertirlos en frames. Los frames fueron sampleados a 25 fps. Sin embargo, algunos videos generaron sólo 24 frames. Bajar el dataset es relativamente rápido, tomando unas pocas horas. Cortar los videos toma unos cuantos días. El código no está optimizado para ocupar workers.

Los frames están guardados en la carpeta *ava_frames*. Los frames de cada video están guardados en su propia carpeta. Cada frame queda guardado con el siguiente formato:
```
<video_id>_{segundo}_{n_frame}.jpg
```

* El *video_id* corresponde al id de Youtube del video.
* El *segundo* corresponde a qué segundo del video corresponde el frame. El *segundo* va de 0 a 899. Detalle importante, los segundos de este archivo tienen un offset de 900 respecto al segundo real en que aparecen en el video. Luego si el archivo dice que es el segundo 105, en el video original se encontrará ese frame en el segundo 1005. El *segundo* siempre tiene 4 dígitos.
* *n_frame* es simplemente el número de frame dentro de ese segundo. Van de 0 a 24. Siempre tiene 2 dígitos.
