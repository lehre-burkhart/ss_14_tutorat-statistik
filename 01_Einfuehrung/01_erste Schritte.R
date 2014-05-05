##################################################################
#
# Einführung in R
# Erste Schritte
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 05.04.2014
#
###################################################################


# **************************** Allgemeines über R *****************

# Was ist R?
# R ist eine Programmiersprache, kein Programm
# R ist auf den drei gängigen Betriebssystemen (Linux, Windows, Mac) kompatibel
# R ist kostenlos
# R wurde speziell für statistische Auswertungen geschrieben
# R hat gegenüber SPSS den Vorteil, dass es größere Funktionalität hat

# Wo kann ich R herunterladen?
# http://www.r-project.org/

# Was ist R-Studio?
# R-Studio ist ein so genanntes IDE (Integrated developement environment)
# Das bedeutet, es handelt sich um eine Software, die den Umgang mit R erleichtern soll
# Es ist ebenfalls kostenlos
# https://www.rstudio.com/


# **************************** Erste Schritte **********************
# Zunächst sollte die neuerste Version von R installiert werden
# Anschließend sollte R-Studio installiert werden

# Wie führe ich Befehle aus?
# R hat eine Console. 
# Eine Console erkennt ihr an diesem Cursor: >
# Hinter diesem Cursor könnt ihr Befehle eingeben.
# Anschließend drückt ihr die Enter-Taste
3
# Wenn ihr ein einem Skript in R-Studio schreibt, drückt Strg + Enter
# und eure Zeile im Skript wird ausgeführt

# R kann rechnen :)
3 + 3 # Addition
5 - 1 # Substraktion
3 * 2 # Multiplikation
6 / 3 # Division

# R-Packages
# Da R eine Programmiersprache ist, könnte man jede Funktion (z.B. Bestimmung des Mittelwerts)
# selbstständig programmieren. R bietet allerdings eine Unzahl an Packages (in denen 
# Funktionen erhalten sind), welche man benutzen kann, ohne zu wissen, wie diese
# Funktionen implementiert sind. 
# z.B. gibt es die Funktion mean(), welche den Mittelwert einer Variable bestimmt. Zu wissen, welche
# Rechenoperationen dahinter liegen, ist für euch als Anwender nicht wichtig. 
mean(c(1,2,3,4,5))
# mean() ist die Funktion, welche ihr aufruft. 
# Viele Funktionen haben Argumente, die ihr der Funktion gebt. In diesem Fall verlangt die 
# Funktion mean(x) das Argument x. Hier ist es ein Vektor.
#
# R besitzt eine Reihe von Packages, die automatisch installiert werden (z.B. Das Packet base). 
# Um zu sehen, welche Packages bereits installiert sind, gebt ihr folgenden Befehl in der Console ein:
library()
#
# Mit folgendem Befehl seht ihr, wo eure Packete installiert sind
.libPaths()

# Variablen
# Da R eine Programmiersprache ist, besitzt R Variablen. In Variablen können Daten gespeichert werden,
# so, dass sie später erneut verwendet werden können
x <- 3 # Die Variable x speichert die Nummer 3
y <- 4 # Die Variable y speichert die Nummer 4
# Achtet darauf, dass ihr Variablen überschreiben könnt. Wenn ihr einer Variable den gleichen Namen#
# wie eine andere Variable gibt, dann wird die ürsprüngliche Variable überschrieben
x <- 5
x # Ihr seht nun, dass x den Wert 5 einnimmt. Der Wert 3 wurde bereits überschrieben
# 
# Mit den Variablen kann ebenfalls gerechnet werden
x + y
x * y
(x + y)^2 # Hoch 2
result <- (x + y)^3
result
#
# Variablennamen sollten für euch verständlich sein. Gebt ihnen wenn möglich keine willkürlichen Bezeichnungen
#
# R ist zudem case-sensitive. Das bedeutet, x und X sind zwei verschiedene Variablen. 

# Wo kann ich Hilfe zu R finden?
#
# Sehr ausführliche und übersichtliche Seite, welche sich mit Statistik auseinandersetzt
# http://www.statmethods.net/
# 
# Folgendes Buch ist vermutlich bald in der UB zugänglich; sehr lustig und unterhaltsam
# http://www.amazon.de/Discovering-Statistics-Using-Andy-Field/dp/1446200469
#
# CrossValidated ist ein Forum für jene von euch, die sich eingehender mit der Thematik beschäftigen möchten
# https://stats.stackexchange.com/


# Wie kann ich mir innerhalb von R helfen?
# R hat verschiedene Befehle, mit denen Funktionen gesucht werden können
?mean # Wenn ihr eine Funktion untersuchen wollt, schreibt ein Fragezeichen davor
??mean # Solltet ihr hierdurch nichts finden, könnt ihr ein zweites Fragezeichen hinzufügen. Dies gilt für Funktionen, für die ihr kein Packet geladet habt


# Welche zusätlichen Ressourcen kann ich zur Vorlesung nutzen?
# 
# Khan Academy
# https://www.khanacademy.org/math/probability/descriptive-statistics
# https://www.khanacademy.org/math/probability/regression
#
# Udacity
# https://www.udacity.com/course/st095
# https://www.udacity.com/course/ud651
# https://www.udacity.com/course/st101