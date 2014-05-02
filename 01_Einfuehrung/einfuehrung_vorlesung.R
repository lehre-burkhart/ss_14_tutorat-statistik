##################################################################
#
# R | Einführung
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 02.05.2014
#
###################################################################


# ************************** R | Skript ******************************
# https://github.com/ch-bu/tutorat_statistik/blob/master/01_Einfuehrung/einfuehrung_vorlesung.R
# Skript herunterladen:
  # 1. Seite öffnen
  # 2. Auf RAW klicken
  # 3. Rechtsklick->Speichern unter->Beliebiger Ordner

# ************************** Befehl ausführen ************************
version # Aus einem Skript: Strg + Enter; in der Console: Enter
R.Version()

# ************************* Working Directory erstellen **************
# Dies ist wichtig, damit der Pfad für die zu einlesenden Dateien bestimmt wird
getwd() # Aktuelles WD
setwd("~/Dropbox/Christian_HiWi/_Statistik I_Tutorat/01_Einfuehrung") # Working Directory bestimmen
getwd() # Neues Directory sichtbar

# ************************ Daten einlesen ****************************
# Facebook Daten | Simuliert
# https://www.udacity.com/course/ud651
facebook <- read.delim("facebook.txt", header=T, sep="\t") # Facebook Daten

# Pisa Daten
# http://nces.ed.gov/pubsearch/pubsinfo.asp?pubid=2011038
pisa <- read.csv("pisa.csv", header=T) # Pisa Daten

# *********************** Datensatz kennenlernen *********************
names(facebook) # Variablennamen finden
nrow(facebook) # Anzahl der Zeilen im Datensatz
ncol(facebook) # Anzahl der Spalten im Datensatz

# Eine Variable kann in R anhand des $-Zeichen aufgerufen werden
facebook$age # Die Variable anzeigen | ACHTUNG: Es werden nicht alle Daten angezeigt, da es zu viele Daten gibt

head(facebook$age) # Zeigt die ersten Daten der Variable age an
hist(facebook$age) 
max(facebook$age) # Wer ist der älteste Nutzer
min(facebook$age) # Wer ist der jüngste Nutzer
which.max(facebook$likes) # Welche Zeile hat die Person mit den meisten gegebenen Likes

# TODO Finde in der Variable likes den höchsten Wert
max(facebook$likes)

# Es lassen sich auch Daten in einer Variable speichern
verteilungGeschlecht <- table(facebook$gender) # Wie viele Frauen und Männer sind im Datensatz?
barplot(verteilungGeschlecht) # Grafische Darstellung der Geschlechter

mean(facebook$likes_received) # Wie viele likes haben die Nutzer im Durchschnitt bekommen?

# Einzelne Zeilen und Spalten betrachten
# facebook[ersterWert, zweiterWert]
  # ersterWert = Zeile
  # zweiterWert = Spalte
facebook[1,] # Erste Zeile
facebook[nrow(facebook),] # Letzte Zeile
facebook[c(1:5]),] # Erste bis fünfste Zeile
facebook[5, c(1:4)] # Fünfte Zeile, erste bis vierte Spalte
facebook[4, c(1,3,5)] # Vierte Zeile, erste, dritte und fünfte Spalte

# TODO Finde die 20. Zeile mit den Spalten 3 bis 7
facebook[20, c(3:7)]

# Wer hat eigentlich die meisten Freunde? | Achtung knifflig
facebook[which.max(facebook$friend_count),]

# Wie alt ist die Person mit den meisten Freunden? | Achtung knifflig
facebook[which.max(facebook$friend_count),][2]

# ******************* Deskriptive Statisik ********************
mean(facebook$friend_count) # Durchschnittliche Freundesanzahl
sd(facebook$friend_count) # Standardabweichung
var(facebook$friend_count) # Varianz
median(facebook$friend_count) # Median 

