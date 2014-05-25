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


gruppe2 <- c()
gruppe1 <- c()

# ************************** Zentrale Tendenzen *********************

# 1. Aufgabe - zentrale Tendenz
# Berechne Mittelwert, Median und Modus der Gruppen durch R. Trage das 
# Ergebnis in folgenden Zeilen ein:
#
#
# Gruppe 1:
# Trage deinen Code unterhalb von dieser Zeile ein:

# Mittelwert = 
# Median =
# Modus = 


# Gruppe 2:
# Trage deinen Code unterhalb von dieser Zeile ein:

# Mittelwert = 
# Median =
# Modus = 


# 2. Aufgabe - Interpretation
# Welche Aussage kannst du bezüglich des Mittelwertes für die
# Gruppen machen. 
#
# Antwort:
#


# ************************** Streuung *******************************

# 3. Aufgabe - Variation (Sum of Squares)
# Berechne die Variation der Gruppen händisch.
#  
# Gruppe1:
# Variation = 
#
# Gruppe2:
# Variation = 
#


# 4. Aufgabe - Varianz 
# Berechne die Varianz der Gruppen händisch.
#
# Gruppe1:
# Varianz = 
#
# Gruppe1:
# Varianz = 
# 


# 5. Aufgabe - Standardabweichung
# Berechne die Standardabweichung der Gruppen händisch.
#
# Gruppe1:
# SD = 
#
# Gruppe2:
# SD = 


# 6. Aufgabe - Interpretation der Standardabweichung
# Vergleiche die Standardabweichungen der Gruppen miteinander.
# Welche Aussagen kannst du aus diesen Werten machen?
#
# Antwort:
#
#

# ************************** Schiefe **************************************

# 5. Aufgabe - Lageregel
# Wende die Lageregel aus der Vorlesung auf die Gruppen an. Benutze hierfür
# die Antworten aus Frage 1. 
# Bestimme hieraus, ob die Variable rechtsschief oder linksschief ist. 
# 
# Gruppe1:
# Schiefe = 
# 
# Gruppe2:
# Schiefe = 


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
# Schiefe = 
#
# Gruppe 2:
# Schiefe = 

# 8. Aufgabe - Beschreibung der Schiefe
# Beschreibe die Schiefe beider Gruppen in deinen eigenen Worten. 
# Gehe dabei darauf ein, ob es sich um eine links- oder rechtschiefe
# Verteilung handelt. Erkläre dies anhand des Schiefekoeffiziente
# der Funktion kurtosis.
#
# Antwort:
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
# Kurtosis = 
#
# Gruppe 2:
# Kurtosis = 

# 11. Aufgabe - Beschreibung der Wölbung
# Beschreibe die Wölbung beider Gruppen in deinen eigenen Worten. 
# Gehe dabei darauf ein, ob es sich um eine leptokurtische, mesokurtische
# oder platykurtische Verteilung handelt. Erkläre dies 
# anhand des Wölbungskoeffizienten der Funktion kurtosis.
#
# Antwort:
#
#
#