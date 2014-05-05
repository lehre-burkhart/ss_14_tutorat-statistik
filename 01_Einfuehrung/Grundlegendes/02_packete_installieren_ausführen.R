##################################################################
#
# Packete installieren und ausführen
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


# 1. Was sind Packete?
# Da R eine Programmiersprache ist, kann die Funktionalität von R beliebig erweitert werden,
# schließlich können Programmierer mit der Sprache verschiedene Funktionen schreiben
# Funktionen, die thematisch miteinander verwandt sind (z.B. Mittelwert, Standardabweichung, Varianz)
# werden zu einem Packet zusammengefasst. Diese Packete lassen sich installieren.
# Der Vorteil dieser Methode ist, dass wir als Nutzer nicht immer wissen müssen, wie
# die Funktionen geschrieben wurden. Wir können sie einfach benutzen, ohne uns darum zu kümmern,
# was im Hintergrund geschieht.
# z.B. Bei der Funktion var(), welche die Varianz ausrechnet, muss ich nicht wissen, welche
# Rechenoperationen im Hintergrund laufen, um die Varianz auszurechnen. Am besten weiß ich 
# natürlich wie die Varianz ausgerechnet wird. Mit der Funktion kann ich sie dann ausführen,
# ohne auch nur ein bisschen rechnen zu müssen


# 2. Woher bekomme ich Packete?
# Momentan hat R 5407 Packete, die ihr einfach herunterladen könnt!!!
# http://cran.r-project.org/web/packages/available_packages_by_date.html
# Sucht zum Beispiel nach dem Packet psych
# R installiert Packete aus dem so genannten CRAN Mirror. Es handelt sich hierbei lediglich um Server, von
# denen ihr die Packete herunterladet
# Den CRAN Mirror könnt ihr mit folgender Funnktion auswählen
chooseCRANmirror()
# Wählt anschließend einen Ort in eurer Nähe (z.B. 34 für Göttingen) und klickt auf Enter
# Nun könnt ihr Packete herunterladen


# 3. Wie installiere ich Packete?
# Für unsere Zwecke ist das Packet "psych" interessant
install.packages("psych")

# 4. Wie lade ich Packete?
# damit wir die Funktionen des Packets verwenden können, müssen wir das Packet zunächst laden
library(psych)
# Nun können wir das Packet verwenden
# Um das Packet zu inspizieren, verwenden wir folgenden Befehl
help(psych)
# oder kurz durch
?psych

# 5. Was ist, wenn zwei Packete eine Funktion mit dem gleichen Namen haben?
# Es kommt tatsächlich vor, dass zwei Packete die gleiche Funktion implementiert haben
# In diesem Fall müsst ihr R angeben, welches Packet ihr für die Funktion nehmen wollt
# Keine Angst, für unsere Zwecke wird das kaum vorkommen. 
# 
# Installieren wir einmal das Packet Hmisc
install.packages("Hmisc")
# Lade Packet
library(Hmisc)
# Das Packet hat die Funktion describe(). Das Packet psych hat die gleiche. Wir müssen R daher sagen,
# welches Packet wir für die Funktion verwenden möchten
Hmisc::describe(schueler)
psych::describe(schueler)
# Diese Funktionen werden nicht funktionieren, da wir die Variable "schueler" noch nicht haben
# Wie das geht finde ihr unter "daten_einlesen.R"

# 6. Welche Packete brauche ich unbedingt dieses Semester?
# 
# stats
# Dieses Packet kommt automatisch mit R, das heißt, ihr müsst es nicht laden (library(stats) ist nicht nötig)
# Es enthält eine Reihe statistischer Funktionen
?stats
library(help = "stats")
#
# psych
# Hier findet ihr wichtige Funktionen für die deskriptive Statistik.
# z.B. describe(), describeBy()
?psych # Hierfür müsst ihr das Packet bereits installiert und ausgeführt haben (library(psych))
??psych # Wenn nicht, könnt ihr es so finden
#
# graphics
# Dieses Packet kommt ebenso vorinstalliert. Hier findet ihr Funktionen für Scatterplots, Boxplots
# als auch Histogramme
library(help = "graphics")
#
# ggplot2
# Wenn ihr sehr viel Kontrolle über eure Grafiken haben wollt, ist diesem Packet sehr gut.
# Es erfordert allerdings einen erhöhten Lernaufwand
# http://ggplot2.org/