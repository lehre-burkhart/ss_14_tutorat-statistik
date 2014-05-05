##################################################################
#
# Daten einlesen
# Tutorat für R
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 07.04.2014
#
###################################################################


# Daten lassen sich aus allen möglichen Dateiformaten einlesen.
# Typisch sind csv, xls und sav Dateien. 
# R kann aber auch viele andere Dateiformate einlesen. 

# 1. Working Directory bestimmen
# Damit R weiß, woher die Dateien kommen, muss der Pfad eingeben werden
# Um zu sehen, welcher Ordner gerade der Working Directory ist, gebt ihr folgendes in der Konsole ein.
getwd()
# Das WD lässt sich folgendermaßen ändern
setwd("C:/Users/Christian/Dropbox/Programmierung/R")
# So findet ihr den Pfad in Windows: http://www.dummies.com/how-to/content/how-to-find-a-folders-path-name-in-windows-explore.html
# So findet ihr den Pfad in OS: http://osxdaily.com/2013/06/19/copy-file-folder-path-mac-os-x/
# Ganz einfach geht es mit R-Studio
# Geht in die Registerkarte "Session" in R-Studio (Die Menüleiste oben in der Software)
# Klickt "Set Working Directory"->"Choose Directory"
# Hierfür könnt ihr auch den Shortcut Strg + Shift + K verwenden
# Anschließend wählt ihr euren Ordner erneut aus
# Ihr seht in der Konsole, dass der gleiche Befehl wie unter 1 eingeben wird

# 2. Dateiformat bestimmen
# Nun ist es wichtig, herauszufinden, welchen Dateityp ihr einlesen wollt
# Am einfachsten und besten ist es, wenn ihr die Dateien in CSV-Dateien umwandelt.
# Hierduch erspart ihr euch viel Arbeit und stößt auf weniger Probleme
#
# Eine CSV-Datei einlesen (Comma-Seperated-Values)
schueler <- read.csv("schueler.csv", header=TRUE, sep=",")
# Zur Funktion:
# schueler: steht für euren Variablennamen; dieser kann beliebig sein, sollte allerdings lesbar sein
# <-: Dabei handelt es sich um den Assignment-Operator. Was dahinter kommt wird in der Variable gespeichert
# read.csv(): das ist die eigentliche Funktion, wir geben ihr in diesem Fall drei Argumente
# "schueler.csv": das erste Argument ist der Name der Datei. 
# header=TRUE: das zweite Argument besagt, ob die Datei als erste Zeile die Variablennamen enthält
# Wenn Ja, wird header auf TRUE gesetzt. Wenn nein, setzt ihr header auf FALSE
# achtet darauf, dass R case-sensitive ist, das heißt False und FALSE ist nicht das gleiche!
# sep=",": Hiermit gebt ihr an, wie eure Werte in der CSV-Datei getrennt sind. Standard ist ein Komma
# mehr unter
?read.csv
#
# Eine DAT-Datei einlesen 
# http://www.chip.de/downloads/DAT-Datei-oeffnen_42093596.html
schueler <- read.delim("schueler.dat", header=TRUE, sep=",")
# Das Prinzip ist das gleiche wie bei der CSV-Datei
#
# Eine XLS-Datei (Excel) einlesen
# Die erste Regel ist, darauf zu verzichten, Excel-Dateien einzulesen
# http://cran.r-project.org/doc/manuals/r-release/R-data.html#Reading-Excel-spreadsheets
# Es ist mit mehr Aufwand verbunden und die Packete benötigen teils ein Betriebssystem mit 32-Bit
# oder Java
# Am sinnvollsten ist es daher, die Excel-Datei in eine CSV-Datei umzuwandeln und diese Datei einzulesen
# https://office.microsoft.com/de-de/excel-help/importieren-oder-exportieren-von-textdateien-HP010099725.aspx


# Mehr findet ihr unter folgenden Webseiten: 
# http://www.r-tutor.com/r-introduction/data-frame/data-import
# http://www.statmethods.net/input/importingdata.html
