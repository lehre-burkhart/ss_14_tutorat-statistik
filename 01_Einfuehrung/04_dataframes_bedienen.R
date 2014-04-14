##################################################################
#
# Dataframes
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 07.04.2014
#
###################################################################

# 1. Zunächst wird das Working Directory bestimmt
setwd("C:\Users\Christian\Dropbox\Christian_HiWi\_Statistik I_Tutorat\01_Einführung")


# 2. Anschließend wird die CSV-Datei in einer Variable gespeichert
schueler <- read.csv("schueler.csv", header=TRUE, sep=",")

# 3. Den Datensatz kennenlernen
# Mit der Funktion str() können wir sehen, welche Variablen in dem Datensatz enthalten sind
str(schueler)
# Wir sehen, dass es insgesamt 24 Reihen sowie 11 Variablen gibt
# Für jede Variable wird der Datentyp angezeigt. Int beispielsweise ist eine Ganzzahl. Dieser Wert ist
# wichtig, wenn wir die Skalierung der Daten beachten müssen.
# 
# Mit der Funktion names() können wir uns nur die Variablennamen ansehen
names(schueler)
#
# indem ich lediglich die Variable in R eingebe, bekomme ich den ganzen Datensatz 
schueler
#
# Falls ihr einen großen Datensatz habt, macht es Sinn, sich nur den Anfang des Datensatzes anzusehen
head(schueler)
#
# Die Länge des Datensatzes, wie viele Reihen er besitzt, lässt sich mit damit herausfinden
nrow(schueler)
#
# Die Anzahl der Spalten lässt sich folgendermaßen herausfinden
ncol(schueler)
#
# Es lassen sich auch nur Ausschnitte des Datensatzes ansehen
schueler[1,]  # nur die erste Reihe
schueler[nrow(schueler),] # nur die letzte Reihe
schueler[1, 4] # Erste Reihe, vierte Spalte
schueler[1, c(4:11)] # Erste Reihe, Spalten 4 bis 11
schueler[c(1:3), c(1:3)] # Erste drei Reihen, erste bis dritte Spalte
schueler[, c("job", "chemie13")] # Alle Reihen, Spalten "job" und "chemie13"
#
# Wenn ihr nominalskalierte Daten habt, könnt ihr die table() Funktion verwenden,
# um die Anzahl der Werte herauszufinden
table(schueler$sex) # Wie viele Frauen und wie viele Männer gibt es?
table(schueler$job) # Wie viele Menschen im Datensatz haben einen Job oder keinen Job?
table(schueler$sex, schueler$job) # Wie viele Frauen haben einen Job, wie viele Männer haben einen Job?
# 
# Mittelwerte berechnen
# Eine einzelne Variable in einem Datenblatt zu erfassen wird das $ Zeichen verwendet
schueler$chemie13
schueler$sport12
# Wenn ihr eine Variable so erfasst habt, könnt ihr den Mittelwert daraus berechnen
mean(schueler$chemie13)
# Ebenso die Varianz
var(schueler$chemie13)
# Oder auch die Standardabweichung
sd(schueler$chemie13)
# Bei der Varianz und der Standardabweichung wird Bessel's correction (n-1) für die Funktion verwendet!
#
# Die Funktion summary() liefert uns erste deskriptive Statistik 
summary(schueler)


# Wie erstelle ich mein eigenen Dataframe in R, um Dinge auszuprobieren?
#
# Ihr könnt zunächst einzelne Vectoren erstellen. Vectoren können später als Spalten im Dataframe benutzt werden und ihr könnt den Spalten anschließend einen Namen zuweisen
# z.B.
shoesize <- c(46, 36, 41, 43, 34, 46)
height <- c(181, 172, 175, 176, 160, 185)
# 
# Erstellen des Dataframes mit Namen der Spalten
probanden <- data.frame(Schuhgroesse=shoesize, Groesse=height)
#
# Nun könnt ihr den Dataframe so untersuchen, wie wir es oben getan haben

# Wie füge ich eine Variable an das Dataframe an?
age <- c(43, 50, 23, 18, 34, 29)
probanden$Alter <- age