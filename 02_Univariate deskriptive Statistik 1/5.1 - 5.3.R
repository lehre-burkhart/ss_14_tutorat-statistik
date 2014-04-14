##################################################################
#
# 02_Univariate deskriptive Statistik 1
# Kapitel 5.1 - 5.3
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 09.04.2014
#
###################################################################

library(ggplot2)
library(grid)
library(gridExtra)

# **************** 5.2 Tabellarische Darstellung von Häufigkeitsverteilungen *********

# 5.2
# Dataframe Noten
schueler <- as.data.frame(c(rep(1,16), rep(2,145), rep(3,282), rep(4,139), rep(5,16)))
# Der einzigen Spalte einen Namen geben
colnames(schueler) <- c("Noten")

# Histogram der absoluten Häufigkeiten
histNotenAbs <- ggplot(schueler, aes(x=Noten))
histNotenAbs + geom_histogram(binwidth = 1, colour="black", fill="grey") + labs(title="Histogramm Schüler absolut", x="Note", y="Häufigkeit") + theme_bw() + theme(plot.title = element_text(size = rel(2)))

# Histogramm der relativen Häufigkeiten
histNotenRel <- ggplot(schueler, aes(x=Noten))
histNotenRel + geom_histogram(binwidth = 1, aes(y = (..count..)/sum(..count..)), colour="black", fill="grey") + labs(title="Histogramm Schüler relativ", x="Note", y="Häufigkeit") + theme_bw() + theme(plot.title = element_text(size = rel(2)))

# Häufigkeiten absolut und relativ
prop.table(table(schueler$Noten))*100
table(schueler$Noten)
sum(prop.table(table(schueler$Noten))) # Sanity check, dass die Prozente auch 1 ergeben

# Percentile, Quantile und Median anzeigen
quantile(schueler$Noten, c(.25, .50, .75))
quantile(schueler$Noten, seq(0, 1, by = .1))


# **************** 5.3 Grafische Darstellung von Häufigkeitsverteilungen *************

# 5.3.2 Stamm-Blatt Diagramm
# IQ-Daten als Dataframe
iqStudie <- as.data.frame(c(85, 87, 88, 96, 96, 97, 101, 103, 124, 127))
colnames(iqStudie) <- c("IQ")
stem(iqStudie$IQ)

# 5.3.3 Histogram
# Intelligenzdaten
# Der folgende Vector erzeugt ähnliche Werte wie sie in Kapitel 5.3.3 (S. 66) dargestellt werden
iq <- c(54, sample(55:69, 21, replace=T), sample(70:84, 100, replace=T), sample(85:99, 174, replace=T), sample(100:114, 192, replace=T), sample(115:129, 92, replace=T), sample(130:144, 16, replace=T), 146, 150)
# Erzeuge Dataframe aus vector
iqStudie2 <- as.data.frame(iq)
colnames(iqStudie2) <- c("IQ")
#
# Create Histograms
# Binwidth = 1
histIQBar1 <- ggplot(iqStudie2, aes(x=IQ)) + geom_histogram(binwidth=1, colour="black", fill="grey") + labs(title="IQ Binwidth = 1", x="Intelligenz", y="Häufigkeit") + theme_bw() + theme(plot.title = element_text(size = rel(1.5)))
#
# Binwidth = 3
histIQBar2 <- ggplot(iqStudie2, aes(x=IQ)) + geom_histogram(binwidth=3, colour="black", fill="grey") + labs(title="IQ Binwidth = 3", x="Intelligenz", y="Häufigkeit") + theme_bw() + theme(plot.title = element_text(size = rel(1.5)))
#
# Bindwidth = 5
histIQBar3 <- ggplot(iqStudie2, aes(x=IQ)) + geom_histogram(binwidth=5, colour="black", fill="grey") + labs(title="IQ Binwidth = 5", x="Intelligenz", y="Häufigkeit") + theme_bw() + theme(plot.title = element_text(size = rel(1.5)))
#
# Binwidth = 10
histIQBar4 <- ggplot(iqStudie2, aes(x=IQ)) + geom_histogram(binwidth=10, colour="black", fill="grey") + labs(title="IQ Binwidth = 10", x="Intelligenz", y="Häufigkeit") + theme_bw() + theme(plot.title = element_text(size = rel(1.5)))
#
# Binwidth = 15
histIQBar5 <- ggplot(iqStudie2, aes(x=IQ)) + geom_histogram(binwidth=15, colour="black", fill="grey") + labs(title="IQ Binwidth = 30", x="Intelligenz", y="Häufigkeit") + theme_bw() + theme(plot.title = element_text(size = rel(1.5)))
#
# Bindwidth = 30
histIQBar6 <- ggplot(iqStudie2, aes(x=IQ)) + geom_histogram(binwidth=30, colour="black", fill="grey") + labs(title="IQ Binwidth = 30", x="Intelligenz", y="Häufigkeit") + theme_bw() + theme(plot.title = element_text(size = rel(1.5)))
#
grid.arrange(histIQBar1, histIQBar2, histIQBar3, histIQBar4, histIQBar5, histIQBar6, ncol=2)
