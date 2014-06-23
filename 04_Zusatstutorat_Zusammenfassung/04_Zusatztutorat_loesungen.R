###############################################################################
#
# 04_Zusatzstutorat
# Zusammenfassung
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 23.06.2014
#
###############################################################################


# *************************** D2-R ********************************************
# "Der Test dient der Messung der Konzentration bei Aufgaben, die 
# Aufmerksamkeit verlangen (konzentrierte Aufmerksamkeit). Er erfasst die
# Konzentrationsfähigkeit der Testperson sowie die Schnelligkeit und 
# Genauigkeit bei der Unterscheidung ähnlicher visueller Reize 
# (Detail-Diskrimination)." (http://www.testzentrale.de/programm/test-d2-
# revision.html)
#
# Variablen
# geschlecht = 1: weiblich, 0: männlich
# sehilfe = 0: nein, 1: ja, aber nicht verwendet, 2: ja, verwendet
# haendigkeit = 0: linkshändig, 1: rechtshändig
# F = Sorgfalt bei der Testbearbeitung (Fehleranteil; bezogen auf BZO)
#      ((AF + VF) / BZO) * 100
# BZO = Tempo bei Testbearbeitung (Anzahl bearbeiteter Zielobjekte)
# AF = Auslassungsfehler (Anzahl ausgelassener Zielobjekte)
# VF = Verwechslungsfehler (Anzahl markierter Distraktoren)
# KL = Konzentrationsleistung (Entdeckte Zielobjekte minus VF)
# SW_F = Standardwert Fehlerprozent | 70 bis 130
# SW_BZO = Standardwert Bearbeitete Zielobjekte (BZO) | 70 bis 130
# SW_KL = Standardwert Konzentrationsleistung (KL) | 70 bis 130


# *********************** Datensatz laden *************************************
# TODO: Bestimmen Sie das Arbeitsverzeichnis und fügen Sie dieses unter 
# diese Zeile des Skripts ein. 
#setwd("C:/Users/Christian/Dropbox/Christian_HiWi/_Statistik I_Tutorat/04_Zusatstutorat_Zusammenfassung")
setwd("~/Dropbox/Christian_HiWi/_Statistik I_Tutorat/04_Zusatstutorat_Zusammenfassung")

# TODO: Laden Sie den Datensatz 'd2_R.csv' mit der Funktion 'read.csv'. Die Werte der
# Datei sind durch ein Komma getrennt. 
d2.R <- read.csv("d2_R.csv", header = T, sep = ",")

# TODO: Wie viele Spalten enthält der Datensatz?
ncol(d2.R)

# TODO: Wie viele Reihen enthält der Datensatz?
nrow(d2.R)

# TODO: Laden Sie das Packet 'psych' in R, wenn Sie es bereits installiert haben
# Sollten Sie das Packet noch nicht installiert haben, installieren Sie das 
# Packet mit 'install.packages("psych")
# library(PACKETNAME)
library(psych)

# TODO: Benutzen Sie die describe()-Funktion, um die deskriptive Statistik
# des Datensatzes zu betrachten
describe(d2.R)


# ********************** Nominalskalierte Variablen kennenlernen **************
table(d2.R$geschlecht)  # Anzahl der Frauen und Männer
table(d2.R$sehilfe)  # Anteile der Menschen mit oder ohne Sehilfe

# TODO: Wie viele Frauen sind im Datensatz?
# 15

# TODO: Wie viele Probanden trugen eine Sehilfe bei dem Test?
# 8


# ********************* Gruppenunterschiede herausfinden **********************
tapply(d2.R$SW_KL, d2.R$sehilfe, mean)
# d2.R$SW_KL: Metrisch skalierte Variable, die für die Gruppen bestimmt wird
# d2.R$sehilfe: Nominalskalierte Variable, aus denen die Gruppen gebildet werden
# mean: Die Funktion, die auf die Gruppen angewendet wird: Mittelwert

# TODO: Welche Gruppe schneidet in der Konzentrationsleistung der Standardwerte
# (SW_KL) am schlechtesten ab? Nennen Sie die Art der Sehilfe und nicht die Zahl. 
# ANTWORT: Jene Gruppe mit Sehilfe, die die Sehilfe jedoch nicht verwendete.


# TODO: Verwenden Sie die tapply()-Funktion, um herauszufinden, ob die Jungen
# oder Mädchen im Schnitt mehr Zielobjekte bearbeitet haben (BZO)
tapply(d2.R$BZO, d2.R$geschlecht, mean)


# *************** Bestimmung von Ausreissern und Extremwerten *****************
# TODO: Erstellen Sie einen Boxplot der Variable SW_BZO
boxplot(d2.R$SW_BZO)

# TODO: Berechnen Sie den Interquartilabstand der Variable SW_BZO
# Speichern Sie diesen Wert in der Variable iqr.
# TIPP: IQR() oder quantile(VARIABLE, c(.25, .75))
iqr <- IQR(d2.R$SW_BZO)

# TODO: Speichern Sie das erste und dritte Quartil in den Variablen q1 und q3
# TIPP: quantile(VARIABLE, c(.25, .75), names = F)[1]: Erstes Quartil
# TIPP: quantile(VARiable, c(.25, .75), names = F)[2]: Drittes Quartil
q1 <- quantile(d2.R$SW_BZO, c(.25, .75), names = F)[1]
q3 <- quantile(d2.R$SW_BZO, c(.25, .75), names = F)[2]

# TODO: Berechnen Sie den 1.5 fachen Interquartilabstand der Variable SW_BZO
# Speichern Sie diesen Wert in der Variable iqr.bzo.15
iqr.bzo.15 <- 1.5 * iqr

# TODO: Berechnen Sie aus der Variable iqr.bzo.15 den oberen und unteren 
# Whisker des Boxplots. Speichern Sie die Werte in den Variablen
# out.q3 und out.q1.
out.q3 <- q3 + iqr.bzo.15
out.q1 <- q1 - iqr.bzo.15

# TODO: Finden Sie die Ausreisser der Variable SW_BZO
# TIPP: d2.R[d2.R$SW_BZO > ZAHL | d2.R$SW_BZO < ZAHL, ]
# TIPP: | bedeutet ODER in R
d2.R[d2.R$SW_BZO > out.q3 | d2.R$SW_BZO < out.q1, ]

# Führen Sie folgende Funktion aus:
box.sw_bzo <- boxplot(d2.R$SW_BZO, range = 1.5)
box.sw_bzo$out

# TODO: Schauen Sie, ob Sie die gleichen Ausreisser wie in der Funktion 
# box.sw_bzo$out gefunden haben?

# Führen Sie folgende Funktion (ausEx) in R aus:
# TIPP: Alle Zeilen markieren und Strg + Enter drücken
ausEx <- function(vector, range) {
  # Gibt Extremwert oder Ausreißer abhängig von range zurueck
  iqr <- IQR(vector)  # Interquartilabstand der Variable
  quants <- quantile(vector, c(0.25, 0.75), names = F)  # 1. Quartil, Median und 2. Quartil
  q1 <- quants[1]  # 1. Quartil
  q2 <- quants[2]  # 2. Quartil
  lower.boundary <- q1 - range * iqr  # Untere Grenze
  upper.boundary <- q2 + range * iqr  # Obere Grenze
  cat("Obere Grenze:", upper.boundary, "\nUntere Grenze:", lower.boundary, 
      "\n", sep = " ")
  werte <- vector[vector < lower.boundary | vector > upper.boundary]
  return(sort(werte))
}

# Die Funktion ausEx berechnet Ihnen Ausreisser oder Extremwerte
ausEx(d2.R$SW_BZO, 1.5)
# 1. Argument: Die Variable, welche Sie untersuchen möchten
# 2. Argument: 1.5 = Ausreisser, 3 = Extremwert


# *************** Bestimmung der Schiefe von Variablen ************************

# TODO: Laden Sie das Packet ggplot2
library(ggplot2)

# Führen Sie folgende Funktionen aus:
d2.R.small <- d2.R[, c("SW_F", "SW_BZO", "SW_KL")]  # Der Dataframe wird
# auf nach den letzten drei Spalten gefiltert
d2.R.small.stacked <- stack(d2.R.small)  # Die Werte werden aufeinander 
# geschichtet -> Für die Funktion ggplot
box.sw <- ggplot(d2.R.small.stacked, aes(x = ind, y = values))
box.sw + geom_boxplot(aes(fill = ind)) + labs(title = "Boxplots der Standardwerte", x = "Variablen", y = "Standardwerte")


# TODO: Beschreiben Sie anhand der Boxplots die Schiefe der drei Verteilungen
# SW_BZO: linksschief
# SW_F: linksschief
# SW_KL: rechtsschief

# Führen Sie folgende Funktion (lageregel) in R aus:
# TIPP: Alle Zeilen markieren und Strg + Enter drücken
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
    
    cat(paste("Mittelwert = ", round(m, 2), "\n", sep = ""))
    cat(paste("Median = ", round(med, 2), "\n", sep = ""))
    cat(paste("Modus = ", round(mode, 2), "\n", sep = ""))
    
    if (m > med) {
      if (med > mode) {
        cat("-> rechtsschief\n")
      }
    } else if (m < med) {
      if (med < mode) {
        cat("-> linksschief\n")
      }
    }
  } else {
    cat("Variable hat keine Werte\n")
  }
}

# Führen Sie nun folgende Zeilen aus
lageregel(d2.R$SW_BZO)
lageregel(d2.R$SW_F)
lageregel(d2.R$SW_KL)

skew(d2.R$SW_BZO)
skew(d2.R$SW_F)
skew(d2.R$SW_KL)

# TODO: Vergleichen Sie die Ergebnisse der Schiefe der drei 
# Verteilungen anhand der Boxplots, der Lageregel und
# des Schiefekoeffizienten. 
# Tragen Sie Ergebnisse (linksschief oder rechtsschief)
# in die untenstehende Tabelle ein.
# Wie würden Sie die Schiefe der drei Verteilungen anhand 
# der drei verschiedenen Kriterien beschreiben?
# 
#           |  Boxplot         | Lageregel     | Schiefekoeffizient
-------------------------------------------------------------
# SW_BZO    |  linksschief    |     -          |  rechtsschief                     
-------------------------------------------------------------
# SW_F      |  linksschief    |  linksschief   |  rechtsschief   
-------------------------------------------------------------
# SW_KL     |  rechtsschief   |  rechtsschief  |  linksschief          
-------------------------------------------------------------
  
# SW_BZO -> Art der Schiefe: rechtsschief -> Tendenz rechtschief
# SW_F -> Art der Schiefe: linksschief -> Schiefekoeffizient verschwindend gering
# SW_KL -> Art der Schiefe: rechtsschief -> Schiefekoeffizient verschiedend gering
  

# *************** Z-Standardsierung ************************

# TODO: Führen Sie für die Variable d2.R$SW_KL eine 
# Z-Standardisierung durch und speichern Sie diese in der 
# Variable alter_z
SW_KL_z <- scale(d2.R$SW_KL)

# TODO: Fügen Sie Variable alter_z dem Dataframe d2.R hinzu
d2.R$SW_KL_z <- SW_KL_z

# Sanity check, ob die Variable wirklich angefügt wurde
names(d2.R) 

# Nehmen Sie an, dass die Standardwerte der Konzentrations-
# leistung normalverteilt sind. 

# Die pnorm()-Funktion
pnorm(0)  # Die Fläche einer Standardnormalverteilung links von
# einem Z-Wert -> hier 50%
pnorm(1)  # Hier -> 84.13 %

# TODO: Finden Sie den Z-Wert der Variable SW_KL_z bei der Person
# mit der ID HO21
# TIPP: d2.R[d2.R$VARIABLENNAMEN == "ID DER PERSON", c("VAR1", c("VAR2"))]
d2.R[d2.R$ID == "HO21", c("ID", "SW_KL_z")]


# TODO: Bestimmen Sie anhand der pnorm()-Funktion, wie viel Prozent
# der Normstichprobe schlechter sind als diese Person mit der ID HO21
pnorm(.85)
