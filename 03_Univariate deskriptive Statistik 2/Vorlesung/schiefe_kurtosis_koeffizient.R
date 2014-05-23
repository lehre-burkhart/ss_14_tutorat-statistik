#########################################
#
# Schiefe- und Kurtosiskoeffizient
# Formel aus der Vorlesung
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 23.05.2014
#
#########################################


skew <- function(x) {
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