CodeBook para el dataset "tidy"
Data source

Dataset original del sitio http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Caracteristicas seleccionadas

Las caracteristicas provienens de señales del acelerometro y giroscopo 3-axial "tAcc-XYZ" y "tGyro-XYZ" muestreadas a 50 Hz y luego filtradas para remover el ruido.
La señal de aceleracion se separo en dos mediante un filtro pasabajos: cuerpo y gravedad (tBodyAcc-XYZ and tGravityAcc-XYZ)

Se derivaron en el tiempo para obtener las señales tBodyAccJerk-XYZ y tBodyGyroJerk-XYZ calculando su magnitud mediante la norma Euclidea: tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag.

Luego se aplica una FFT para producir el espectro en la frecuencia: fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

Para estas señales:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

se estiman:

mean(): valor medio
std(): desvio estandar

Las variables obtenidas son de la forma: 

tbodyaccmeanx   -valor medio de tBodyAcc-XYZ
