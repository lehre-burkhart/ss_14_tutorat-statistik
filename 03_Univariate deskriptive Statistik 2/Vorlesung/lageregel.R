##################################################################
#
# 03_Univariate deskriptive Statistik 2
# Funktion für die Lageregeln
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 24.05.2014
#
###################################################################


lageregel <- function(x) {
  ##############################
  #
  # Gibt Mittelwert, Median
  # und Modus der Variablen 
  # zurück
  # Bestimmt hieraus die Schiefe
  # der Verteilung
  #
  ##############################
  
  if (length(x) > 0) {
    m <- mean(x, na.rm = T)
    med <- median(x, na.rm = T)
    mode <- as.integer(names(sort(table(x), decreasing = T))[1])
    
    print(paste("Mittelwert = ", m, sep = ""))
    print(paste("Median = ", med, sep = ""))
    print(paste("Modus = ", mode, sep = ""))
    
    if (m > med) {
      if (med > mode) {
        return("-> rechtsschief")
      }
    } else if (m < med) {
      if (med < mode) {
        return("-> linksschief")
      }
    } 
  } else {
    print("Variable hat keine Werte")
  }
}