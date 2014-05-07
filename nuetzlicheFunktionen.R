##################################################################
#
# Nützliche Funktionen in R
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 28.04.2014
#
###################################################################

# Packete
sessionInfo() # Zeigt R-Version, Platform, lokale Variablen und welche Packete geladen sind
chooseCRANmirror() # Wählt den Server aus, von dem die Packete installiert werden
# install.packages(); z.B. install.packages("psych"); Installiert ein Packet aus dem CRANmirror
# ?packet; z.B. ?psych; Zeigt Hilfe über das Packet
library() # zeigt alle Packete an, die installiert sind
library(help = stats) # Information, welche Funktionen ein Paket enth�lt
packageDescription("stats") # �berpr�fen, wo Pakete installiert sind

# Working Directory
getwd() # Gibt Pfad des Working Directory zur�ck
# setwd(Pfad) # Bestimmt das Working Directory

# Daten einlesen
# variablenName <- read.table("Datei.txt", header = TRUE)
# variablenName <- read.csv("Datei.csv", header = TRUE, sep = ";") 

# Dataframes
?str # Gibt die Variablentypen im Dataframe zurück
?names # Gibt die Namen der Variablen zurück
?subset # Verkleinerung eines Dataframes mit verschiedenen Bedingungen
?nrow # Anzahl der Reihen eines Dataframes
?ncol # Anazl der Spalten eines Dataframes
?head # Gibt die ersten Reihen eines Dataframes zurück
?tail # Gibt die letzten Reihen eines Dataframes zurück
?which.max # Gibt die Reihenposition des höchsten Wertes einer Variablen (in einem Dataframe) zurück
?which.min # Gibt die Reihenposition des niedrigsten Wertes einer Variablen (in einem Dataframe) zurück
?max # Gibt den höchsten Wert einer Variable (in einem Dataframe) zurück
?min # Gibt den niedrigsten Wert einer Variable (in einem Dataframe) zurück

# Missing Values 99
# mydata$v1[mydata$v1 == 99] <- NA # mydata = dataframe, v1 = variable
# x[!complete.cases(x),] # Gibt die Zeilen mit Missing values in einem Dataframe zur�ck

# Deskriptive Statistik
?mean # Arithmetische Mitteln einer Variablen
?median # Median einer Variablen
?sd # Standardabweichung einer Variablen
?var # Varianz einer Variablen

?table # Tabellen für nominalskalierte Daten
?prop.table # Gibt den prozentualen Anteil einer Tabelle zurück
?tapply # Funktionen über verschiedene Gruppen anwenden; z.B. mean, sum

?boxplot
?hist

# Psych-Packet
library(psych)
?psych
?describe # Deskriptive Statistik für ein Dataframe
?describeBy # Deskriptive Statistik für ein Dataframe anhand einer nomialskalierten Variable

# Base-Packet
?summary # Deskriptive Statistik für ein Dataframe