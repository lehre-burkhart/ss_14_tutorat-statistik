##################################################################
#
# 02_Univariate deskriptive Statistik 1
# Kapitel 6.1 - 6.2
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 14.04.2014
#
###################################################################

# Lade Bibliotheken
library(psych)

# ************************* 6.1 Statistiken für die zentrale Tendenz ********************

# Das arithmetische Mittel | Mean
tempCelsius <- c(20, 21, 25) # Temperatur an drei Tagen
mean(tempCelsius) # Mittelwert der Temperaturen

# Positive affine Transformation bei der Mittelwertbildung
tempFahrenheit <- c(68, 69.9, 77)
mean(tempFahrenheit) # Mittelwert berechnen
celToFahr <- 32 + (9/5 * mean(tempCelsius)) # Konvertiere Celsius zu Fahrenheit
celToFahr

# Berechnung des Gruppenmittelwertes und des Gesamtmittelwertes
iqGruppe1 <- c(100, 110, 120)
iqGruppe2 <- c(110, 130)

iqGruppe <- (mean(iqGruppe1) + mean(iqGruppe2)) / 2 # Gruppenmittelwert
iqGruppe

iqGesamt <- (3*mean(iqGruppe1) + 2*mean(iqGruppe2)) / (length(iqGruppe1) + length(iqGruppe2)) # Gesamtmittelwert
iqGesamt

iqGruppe == iqGesamt # Ist der Gruppenmittelwert gleich dem Gesamtmittelwert?


# Der Median
blutdruckEven <- c(70, 87, 92) # Gerade Anzahl der Items
median(blutdruckEven)

blutdruckOdd <- c(70, 71, 87, 92)
median(blutdruckOdd)

iq <- c(85, 87, 88, 96, 96, 97, 101, 103, 124, 127)
median(iq)
mean(iq)

iqMitAusreiser <- c(85, 87, 88, 96, 96, 97, 101, 103, 124, 145)
median(iqMitAusreiser)
mean(iqMitAusreiser)

# Der Mode
names(sort(-table(iq)))[1] # Find Mode in iq-data
which.max(table(iq)) # Find Mode in iq-data

# Quantile
x <- c(4, 5, 6, 7, 7, 7, 8, 8, 9, 10) # Beliebiger Vector
quantile(x, c(.25, .50)) # 25. und 50. (Median) Quantil anzeigen

morleyLight <- morley$Speed + 299000 # Edward Morley wollte 1887 die Geschwindigkeit des Lichts bestimmen | km/sec - 299.000
speedOfLight <- 299792.458 # Lichtgeschwindigkeit

mean(morleyLight) - speedOfLight # Morley schätzte die Lichtgeschwindigkeit um 59.942 km/sec falsch ein

hist(morleyLight) # Histogram der Lichtgeschwindigkeitsbessungen nach Morley (1879)
quantile(morleyLight, c(.25, .50, .75)) - speedOfLight 


