##################################################################
#
# 03_Univariate deskriptive Statistik 2
# Kapitel 6.3
#
# Albert-Ludwigs-UniversitÃ¤t Freiburg
# Institut fÃ¼r Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 05.05.2014
#
###################################################################

# Packete laden
library(ggplot2)
library(gridExtra)


# ************************* 6.3 Statistiken für die Streuung von Variablen ********************

# Dataframe aus beiden Verteilungen erstellen
verteilungen <- data.frame(breit = rnorm(5000, mean = 100, sd = 15), schmal = rnorm(5000, mean = 100, sd = 5))

histBreit <- ggplot(verteilungen, aes(breit)) + geom_histogram(binwidth = 5, colour = "black", fill = "grey") + theme_bw() + labs(title = "Streuung breit", x = "Testergebnis", y = "absolute Häufigkeit") + scale_y_continuous(limits=c(0, 1200)) + scale_x_continuous(limits=c(30, 160)) + theme(plot.title = element_text(size = 18)) # Histogram einer breiten Verteilung mit 5000 Datenpunkten

histSchmal <- ggplot(verteilungen, aes(schmal)) + geom_histogram(binwidth = 3, colour = "black", fill = "grey") + theme_bw() + labs(title = "Streuung schmal", x = "Testergebnis", y = "absolute Häufigkeit") + scale_y_continuous(limits=c(0, 1200)) + scale_x_continuous(limits=c(30, 160)) + theme(plot.title = element_text(size = 18))  # Histogram einer schmalen Verteilung mit 5000 Datenpunkten


grid.arrange(histBreit, histSchmal, ncol = 2) # Arrangiere beide Histogramme in eine Grafik

# 6.3.1 Die Spannweite einer Variablen
range(verteilungen$breit) 
max(verteilungen$breit)
min(verteilungen$schmal)
max(verteilungen$breit) - min(verteilungen$schmal) # = Range

# 6.3.2 Interquartilabstand
IQR(verteilungen$breit) # Gibt den Interquartilabstand einer Variablen zurück
quan75 <- quantile(verteilungen$breit, c(.75)) # 75. Quantile
quan25 <- quantile(verteilungen$breit, c(.25)) # 25. Quantile
quan75 - quan25 # Ergibt dasselbe wie IQR

# 6.3.3 Abweichungsquadrate, Varianz und Standardabweichung

# Sum of Squares (SS)
sumOfSquares <- sum((verteilungen$breit - mean(verteilungen$breit))^2) # Berechnet die SS (Sum of Squares)

# Verschiebungssatz
verschiebungsSatz <- abs(sum(verteilungen$breit^2)) - (nrow(verteilungen) * mean(verteilungen$breit)^2) # Entspricht sumOfSquares
verschiebungsSatz

# Varianz
varFromSS <- sumOfSquares / (nrow(verteilungen) - 1) # Aus SS wird die Varianz berechnet: SS / (n - 1)
# (n - 1) = Bessel's correction; hier wird auf die Population geschlossen, da die Varianz aus der Stichprobe aller Vorraussicht kleiner ist, als in der Population. Dies liegt daran, dass es unwahrscheinlicher ist, die extremen Werte einer Population in einer Stichprobe zu erfassen. Durch die Division mit (n - 1) statt (n) wird die Varianz größer und nähert sich daher eher der Population an.
# https://en.wikipedia.org/wiki/Bessel's_correction
varFromSS
var(verteilungen$breit)

# Standardabweichung
sqrt(varFromSS) # Die Wurzel aus der Varianz
sd(verteilungen$breit) # sd ist die Funktion, um die Standardabweichung sofort auszurechnen

# Die Zerlegung von Abweichungsquadraten: Ein Beispiel
matheNoten <- c(8,9,9,10,10,11,11,12)
SSmathe <- sum((matheNoten - mean(matheNoten))^2) # SS ausrechnen
SSmathe
matheNotenDidFaehigkeit <- c(10,11,11,12,10,11,11,12)
SSmatheDidFaehigkeit <- sum((matheNotenDidFaehigkeit - mean(matheNotenDidFaehigkeit))^2) # SS ausrechnen
SSmatheDidFaehigkeit
SSdf <- SSmathe - SSmatheDidFaehigkeit
SSdf
matheNotenLeistung <- c(11,12,11,12,11,12,11,12)
SSmatheLeistung <- sum((matheNotenLeistung - mean(matheNotenLeistung))^2) # SS ausrechnen
SSmatheLeistung
SSdf2 <- SSmatheDidFaehigkeit - SSmatheLeistung
SSdf2
matheNotenNatur <- c(12,12,12,12,12,12,12,12)
SSmatheLeistung <- sum((matheNotenNatur - mean(matheNotenNatur))^2) # SS ausrechnen
SSmatheLeistung
