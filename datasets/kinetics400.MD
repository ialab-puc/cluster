# Kinetics-400

URL: https://deepmind.com/research/open-source/open-source-datasets/kinetics/

Este dataset fue creado por Deepmind para reconocimiento de acciones en video. 
Existen 400 clases que pueden ser predichas. Existen ya también versiones de más clases como Kinetics-600 y Kinetics-700.

## Carpetas Relevantes
* *frames*: contiene los frames de cada video.
* *test/train/val*: contienen los videos completos del split correspondiente. Los videos están organizados por clase.
* *train_video_folder.txt/val_video_folder.txt*: contienen el ground truth de los splits de train y validación. 
Estos archivos fueron preprocesados por nosotros para poder trabajar con un dataloader de Pytorch que ya teníamos. No son estándar.
* *categories.txt*: contiene los labels de las clases. Tampoco es estándar.

## Comentarios

Los videos tienen su propia carpeta dentro de la carpeta frame, independiente del split al que pertenezcan.
