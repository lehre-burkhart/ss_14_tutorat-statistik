##################################################################
#
# R anhand der Billboard 100 aus den Jahren 1990 bis 2010
#
# Albert-Ludwigs-UniversitÃ¤t Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 21.04.2014
#
###################################################################

# Der Datensatz
# Der Datensatz besteht aus den Songs der Billboard Hot 100 (https://de.wikipedia.org/wiki/Billboard_Hot_100) aus den Jahren 1990 bis 2010. Wikipedia nennt die Lieder "die offiziellen US-amerikanischen Singlecharts".

# Hier ist eine Beschreibung des Datensatzes
# year = the year the song was released
# songtitle = the title of the song
# artistname = the name of the artist of the song
# songID and artistID = identifying variables for the song and artist
# timesignature and timesignature_confidence = a variable estimating the time signature of the song, and the confidence in the estimate
# loudness = a continuous variable indicating the average amplitude of the audio in decibels
# tempo and tempo_confidence = a variable indicating the estimated beats per minute of the song, and the confidence in the estimate
# key and key_confidence = a variable with twelve levels indicating the estimated key of the song (C, C#, . . ., B), and the confidence in the estimate
# energy = a variable that represents the overall acoustic energy of the song, using a mix of features such as loudness
# pitch = a continuous variable that indicates the pitch of the song
# timbre_0_min, timbre_0_max, timbre_1_min, timbre_1_max, . . . , timbre_11_min, and timbre_11_max = variables that indicate the minimum/maximum values over all segments for each of the twelve values in the timbre vector (resulting in 24 continuous variables)
# Top10 = a binary variable indicating whether or not the song made it to the Top 10 of the Billboard Hot 100 Chart (1 if it was in the top 10, and 0 if it was not)


# TODO Lade die Datei lieder.csv von der Seite https://github.com/ch-bu/tutorat_statistik/tree/master/01_Einfuehrung herunter.

# TODO Setze dein Working-Directory auf das Verzeichnis mit der Datei lieder.csv
setwd("C:/Users/Christian/Dropbox/Christian_HiWi/_Statistik I_Tutorat/01_Einfuehrung")

# TODO Lade die Datei lieder.csv in R ein und speichere sie in der Variable lieder (TiPP: read.csv; für Hilfe, tippe ?read.csv in die Console)
# Achte darauf, dass die CSV-Datei einen header hat.
lieder <- read.csv("lieder.csv", header=T)


# TODO Wie viele Lieder sind im Datensatz
str(lieder) # structure of the dataset
nrow(lieder) # geht auch über die Anzahl der Reihen

table(lieder$year) # Wir sehen die Verteilung der Lieder, in den unterschiedlichen Jahren 
prop.table(table(lieder$year)) # Ebenso können wir uns die Verteilung in Prozent ansehen
sum(prop.table(table(lieder$year))) # In der Summe sollte sie 1 ergeben

# TODO In welchem Jahr gab es die meisten Lieder in den Billboards?
which.max(table(lieder$year)) # Hier wird das Jahr (2007) und die Position in dem Vector wiedergegeben (18)
sort(table(lieder$year)) # Alternativ kann man die Tabelle auch sortieren

table(lieder$year == 2007, lieder$Top10) # Zählen wir die zweite Reihe zusammen (564 + 58) ergeben sich die 622 Lieder aus dem Jahre 2007
# FALSE umfasst die Lieder, welche nicht 2007 in den Billboards waren. 
# Aus der Tabelle können wir herauslesen, dass es 2007 58 Lieder in den Top 10 der Billboards gab. 

# TODO Wie viele Top 10 Lieder gab es im Jahr 2010 in den Billboards
table(lieder$year == 1992, lieder$Top10)

# TODO In welchem Jahr gab es die wenigsten Lieder in den Top 10?
table(lieder$year, lieder$Top10) # 1996 mit 34 Liedern

# Nenne ein Lied aus den TOP 10 aus dem Jahr mit den wenigsten Liedern? Schwierige Frage!
wenigTop10 <- subset(lieder, lieder$year == 1996 & lieder$Top10 == 1) # Zunächst wird ein Teil des Dataframes gepeichert
wenigTop10$songtitle <- factor(wenigTop10$songtitle) # Da die Variable ein Faktor ist, werden alle Songtitles aus dem vorherigen Dataframe übernommen. Wir benötigen aber nur diejenigen 34, die es in diesem Jahr gab
wenigTop10$songtitle # Zeigt alle Songtitles aus diesem Jahr, die in den Top10 waren
# e.g. Smells Like Teen Spirit

# TODO Wie viele Lieder von Michael Jackson waren in den Top10
MichaelJackson <- subset(lieder, artistname == "Michael Jackson")
nrow(MichaelJackson)


# Eine weitere Variable ist die Lautstärke des Liedes (loudness)
# TODO Wie laut ist das lauteste Lied im ganzen Dataframe?
max(lieder$loudness)

# Wie heißt das lauteste Lied?
lieder[which.max(lieder$loudness), c("year", "artistname", "songtitle", "loudness")] # Vor dem Komma wird die Reihe angegeben, nach dem Komma werden die Spalten ausgewählt

# Wie heißt das leiseste Lied?
lieder[which.min(lieder$loudness), c("year", "artistname", "songtitle", "loudness")]

tapply(lieder$loudness, lieder$year, mean) # Hier sehen wir, in welchem Jahr die Lieder im Mittel am leisesten und lautesten waren. 
# Achtet darauf, dass Dezibel auch negativ sein können

# Welches Lied war im Jahr 2008 am lautesten?
loud2008 <- subset(lieder, year == 2008)
loud2008[which.max(loud2009$loudness), c("year", "artistname", "songtitle", "loudness")]


hist(lieder$tempo) # Hier sehen wir die Verteilung der Geschwindigkeit aller Lieder in Beats per Minute

# TODO Finde den Mittelwert des Tempos aller Lieder?
mean(lieder$tempo)

# TODO Welches Lied hat das höchste Tempo aller Lieder
lieder[which.max(lieder$tempo), c("year", "songtitle", "artistname", "tempo")]
 

# Mit der Funktion quantile() können wir bestimmen, wie viel Prozent der Daten unter oder über einem bestimmten Wert liegen
quantile(lieder$tempo, c(.05))

# TODO Zwischen welchen Werten liegen die oberen 5% der Geschwindigkeiten aller Lieder?
quantile(lieder$tempo, c(.95))
max(lieder$tempo)
# Antwort: zwischen 148 bis 244 BpM

# TODO Finde anhand der quantile() Funktion den Median der Verteilung
quantile(lieder$tempo, c(.50))

plot(lieder$tempo, lieder$loudness)

tapply(lieder$tempo, lieder$year >= 2000, mean) # Hierduch können wir sehen, ob im Mittel das Tempo der Lieder seit 2000 angestiegen ist


tail(sort(tapply(lieder$Top10, lieder$artistname, sum))) # Hier seht ihr, dass man mit R viele verschiedene Funktionen miteinander verschachteln kann. Der Output beschreibt diejenigen Künstler, mit den meisten Top10 Hits zwischen 1990 und 2010. 

# TODO Finde alle 20 Lieder, mit denen Mariah Carey in den Top10 war
mc <- subset(lieder, artistname == "Mariah Carey" & Top10 == 1)
mc$songtitle <- factor(mc$songtitle)
mc$songtitle

# TODO Falls du das Packet psych noch nicht installiert hast, installier es
install.packages("psych")

# TODO Lade das Packet psych
library(psych)

describe(lieder) # Hier sehen wir die deskriptive Statistik des Datensatzes 

# TODO Wie viel Prozent der Lieder waren in den Top10
prop.table(table(lieder$Top10)) # Die Lieder mit einer 1 waren in den Top 10; entspricht 14.8 Prozent

