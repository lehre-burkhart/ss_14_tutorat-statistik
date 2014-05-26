##################################################################
#
# 03_Univariate deskriptive Statistik 2
# Aufgaben
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 24.05.2014
#
###################################################################


gruppe2 <-c(1, 3, 2, 1) # Anzahl der Mitbewohner aus Gruppe1
gruppe1 <- c(2, 1, 2, 0) # Anzahl der Mitbewohner aus Gruppe2

# ************************** Zentrale Tendenzen *********************

# 1. Aufgabe - zentrale Tendenz
# Berechne Mittelwert, Median und Modus der Gruppen durch R. Trage das 
# Ergebnis in folgenden Zeilen ein:
#
#
# Gruppe 1:
# Trage deinen Code unterhalb von dieser Zeile ein:
mean(gruppe1)
median(gruppe1)
sort(table(gruppe1))

# Mittelwert = 1.25
# Median = 1.5
# Modus = 2

mean(gruppe2)
median(gruppe2)
sort(table(gruppe2))

# Gruppe 2:
# Trage deinen Code unterhalb von dieser Zeile ein:

# Mittelwert = 1.75
# Median = 1.5
# Modus = 1


# 2. Aufgabe - Interpretation
# Welche Aussage kannst du bezüglich des Mittelwertes für die
# Gruppen machen. 
#
# Antwort: Laut dem Mittelwert beider Gruppen hat Gruppe1
# mehr Mitbewohner als Gruppe2. Die Interpretation der Werte
# sollte jedoch vorsichtig sein, da nicht möglich ist, 
# 1.75 Mitbewohner zu haben. 
#


# ************************** Streuung *******************************

# 3. Aufgabe - Variation (Sum of Squares)
# Berechne die Variation der Gruppen händisch.
#
# So kann die Variation durch R händisch berechnet werden:
variation1 <- sum((gruppe1 - mean(gruppe1))^2)
variation2 <- sum((gruppe2 - mean(gruppe2))^2)
variation1
variation2

# Gruppe1:
# Variation = 2.75
#
# Gruppe2:
# Variation = 2.75
#

# TIPP: Je mehr Werte eine Variable hat, desto
# größer ist die Variation. 


# 4. Aufgabe - Varianz 
# Berechne die Varianz der Gruppen händisch.
varianz1 <- variation1 / length(gruppe1)
varianz2 <- variation2 / length(gruppe2)
varianz1
varianz2

#
# Gruppe1:
# Varianz = 0.6875
#
# Gruppe1:
# Varianz = 0.6875
# 
# ACHTUNG: R rechnet die Varianz mit (n - 1) im Nenner.
# Da wir aber nur die Stichprobe beschreiben, können
# wir die Varianz mit n im Nenner rechnen. 
# (n - 1) wird auch als Bessel's correction bezeichnet. 
# Man geht davon aus, dass die Varianz in einer Stichprobe
# im Vergleich zur Population immer unterschätzt wird.
# Durch die Teilung mit (n - 1) wird die Varianz größer
# und passt sich eher der Populationsvarianz an. 

# 5. Aufgabe - Standardabweichung
# Berechne die Standardabweichung der Gruppen händisch.
sqrt(varianz1) # Wurzel der Varianz
sqrt(varianz2) # Wurzel der Varianz

# Gruppe1:
# SD = 0.83
#
# Gruppe2:
# SD = 0.83


# 6. Aufgabe - Interpretation der Standardabweichung
# Vergleiche die Standardabweichungen der Gruppen miteinander.
# Welche Aussagen kannst du aus diesen Werten machen?
#
# Antwort: Die Standardabweichung beider Gruppen ist gleich.
# Das bedeutet, die Gruppen unterscheiden sich hinsichtlich 
# ihrer Streuung nicht voneinander. Sie sind gleich homogen. 
#


# ************************** Schiefe **************************************

# 5. Aufgabe - Lageregel
# Wende die Lageregel aus der Vorlesung auf die Gruppen an. Benutze hierfür
# die Antworten aus Frage 1. 
# Bestimme hieraus, ob die Variable rechtsschief oder linksschief ist. 
# 
# Gruppe1:
# Mittelwert (1.25) < Median (1.5) < Modus (2)
# Schiefe = linksschiefe Verteilung (Mittelwert < Median < Modus)
# 
# Gruppe2:
# Mittelwert (1.75) > Median (1.5) > Modus (1)
# Schiefe = rechtsschiefe Verteilung (Mittelwert > Median > Modus)


# 6. Aufgabe - Funktion
# Führe folgende Funktion in R aus. Markiere hierzu die ganze 
# Funktion (Zeile 111 bis 125)
# und drücke anschließend Strg + Enter

skewness <- function(x) {
  ############################
  #
  # Schiefekoeffizient einer 
  # Verteilung
  # x = Variable, deren Schiefe
  # berechnet werden soll
  #
  ############################
  
  n <- sum(!is.na(x)) # Laenge der Variable
  s <- sd(x) # Standardabweichung der Variable
  
  return(((n^2) / ((n-1) * (n-2))) * ((sum((x - mean(x))^3)) / (n * s^3)))
}


# 7. Aufgabe - Berechnung der Schiefe
# Berechne die Schiefe beider Gruppen.
# z.B. skewness(gruppe1) -> gibt die Schiefe der ersten Gruppe zurück
# Trage deinen Code unterhalb von dieser Zeile ein:

# Gruppe 1:
# Schiefe = -0.85 (Dies entspricht der Lageregel)
#
# Gruppe 2:
# Schiefe = 0.85 (Dies entspricht der Lageregel)

# 8. Aufgabe - Beschreibung der Schiefe
# Beschreibe die Schiefe beider Gruppen in deinen eigenen Worten. 
# Gehe dabei darauf ein, ob es sich um eine links- oder rechtschiefe
# Verteilung handelt. Erkläre dies anhand des Schiefekoeffizienten
# der Funktion skewness
#
# Antwort: Bei Gruppe 1 handelt es sich um eine linksschiefe Verteilung,
# da sowohl die Lageregel als auch der Koeffizient (negativer Wert) für eine
# linksschiefe Verteilung sprechen. Gruppe2 hat eine rechtschiefe Verteilung.
# Auch dies ist durch die Lageregel und den Koeffizienten (positiver
# Wert) bestimmbar. 
#
#
#


# ************************* Kurtosis *************************************

# 9. Aufgabe - Funktion
# Führe folgende Funktion in R aus. Markiere hierzu die ganze 
# Funktion (Zeile 159 bis 176)
# und drücke anschließend Strg + Enter


kurtosis <- function(x) {
  ############################
  #
  # Kurtosiskoeffizient einer 
  # Verteilung
  # x = Variable, deren Kurtosis
  # berechnet werden soll
  #
  ############################
  
  n <- sum(!is.na(x)) # Laenge der Variable
  s <- sd(x) # Standardabweichung der Variable
  
  first <-  (n^2 * (n + 1)) / ((n - 1) * (n - 2) * (n - 3))
  second <- sum((x - mean(x))^4) / (n * (s^4))
  third <- ((n - 1)^2) / ((n - 2) * (n - 3))
  return(first * second - 3 * third)
}


# 10. Aufgabe - Berechnung der Wölbung
# Berechne die Wölbung beider Gruppen.
# z.B. kurtosis(gruppe1) -> gibt die Wölbung der ersten Gruppe zurück
# Trage deinen Code unterhalb von dieser Zeile ein:

# Gruppe 1:
# Kurtosis = -1.29
#
# Gruppe 2:
# Kurtosis = -1.29

# 11. Aufgabe - Beschreibung der Wölbung
# Beschreibe die Wölbung beider Gruppen in deinen eigenen Worten. 
# Gehe dabei darauf ein, ob es sich um eine leptokurtische, mesokurtische
# oder platykurtische Verteilung handelt. Erkläre dies 
# anhand des Wölbungskoeffizienten der Funktion kurtosis.
#
# Antwort: Beide Verteilungen besitzen die gleiche Wölbung. 
# Der Koeffizient ist negativ. Dies bedeutet, es handelt sich um
# eine platykurtische Verteilung. 
#
#
#