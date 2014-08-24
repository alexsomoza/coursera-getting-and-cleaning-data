# Lectura Datos de training y de testing
training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)

# Lectura de actividades
actividades = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Lectura de caracteristicas
caracteristicas = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
caracteristicas[,2] = gsub('-mean', 'Mean', caracteristicas[,2])
caracteristicas[,2] = gsub('-std', 'Std', caracteristicas[,2])
caracteristicas[,2] = gsub('[-()]', '', caracteristicas[,2])

# Incorporar columnas
training[,562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

testing[,562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

# Combinar los conjustos de train y test
mergeDatos = rbind(training, testing)

# Seleccionar solo media y desvio estandar
colsUtiles <- grep(".*Mean.*|.*Std.*", caracteristicas[,2])

# Reducir la tabla de caracteristicas a las columnas utiles
caracteristicas <- caracteristicas[colsUtiles,]

# Incorporar las dos columnas de actividad(562) y sujeto(563)
colsUtiles <- c(colsUtiles, 562, 563)

# Dejar solo las columnas de media y desvio
mergeDatos <- mergeDatos[,colsUtiles]

colnames(mergeDatos) <- c(caracteristicas$V2, "Activity", "Subject")
colnames(mergeDatos) <- tolower(colnames(mergeDatos))

actividad = 1
for (actividadLabel in actividades$V2) {
  mergeDatos$activity <- gsub(actividad, actividadLabel, mergeDatos$activity)
  actividad <- actividad + 1
}

mergeDatos$activity <- as.factor(mergeDatos$activity)
mergeDatos$subject <- as.factor(mergeDatos$subject)

tidy = aggregate(mergeDatos, by=list(activity = mergeDatos$activity, subject=mergeDatos$subject), mean)

write.table(tidy, "tidy.txt", sep=" ")
