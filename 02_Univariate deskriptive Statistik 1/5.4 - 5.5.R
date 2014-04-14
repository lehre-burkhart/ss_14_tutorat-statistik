##################################################################
#
# 02_Univariate deskriptive Statistik 1
# Kapitel 5.4
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
library(gridExtra)

# ************* 5.4 Formen von Häufigkeitsverteilungen ********************
#
# Intelligenzdaten
# Der folgende Vector erzeugt ähnliche Werte wie sie in Kapitel 5.3.3 (S. 66) dargestellt werden
iq <- c(54, sample(55:69, 21, replace=T), sample(70:84, 100, replace=T), sample(85:99, 174, replace=T), sample(100:114, 192, replace=T), sample(115:129, 92, replace=T), sample(130:144, 16, replace=T), 146, 150)
# Erzeuge Dataframe aus vector
iqStudie <- as.data.frame(iq)
colnames(iqStudie) <- c("IQ")

# Histogram mit einer Gauß'schen Glockenkurve
# Bindwidth = 5
histIQGaus <- ggplot(iqStudie, aes(x=IQ)) +  geom_histogram(aes(y = ..density..), binwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iqStudie, c(mean = mean(IQ), sd = sd(IQ))), colour="red") + labs(title="IQ mit Gauß'scher Gockenkurve", x="Intelligenz", y="Häufigkeit")  + theme_bw() + theme(plot.title = element_text(size = rel(1.5)))
histIQGaus

# 5.4.2 Gipfel von Verteilungen
#
# Erzeuge bimodale Verteilung
vector1 <- rnorm(300, mean=100, sd=10) # Vector mit normalverteilten Daten erstellen. Mittelwert = 20, SD = 3
vector2 <- rnorm(300, mean=60, sd=10) # Vector mit normalverteilten Daten erstellen. Mittelwert = 10, SD = 3
vector3 <- c(vector1, vector2) # Kombiniere beide Populationen zu einem Vector
bimodal <- data.frame(Pop2 = vector3) # Erzeuge dataframe 
# Bimodales Histogramm mit Mittelwert
histBimodal <- ggplot(bimodal, aes(Pop2)) + geom_histogram(binwidth=5, colour="black", fill="grey") + geom_vline(aes(xintercept=mean(Pop2)), color="red", linetype="dashed", size=1) + theme_bw() + labs(title="Bimodale Verteilung", x="Beliebige Variable", y="Häufigkeit") + theme(plot.title=element_text(size = rel(1.5)))
histBimodal
#
# Erzeuge uniforme Verteilung
uniform <- data.frame(x=runif(1000, min=0, max=100)) # Erzeuge uniforme Verteilung
# Uniformes Histogramm mit Mittelwert
histUniform <- ggplot(uniform, aes(x)) + geom_histogram(binwidth=5, colour="black", fill="grey") + geom_vline(aes(xintercept=mean(x)), color="red", linetype="dashed", size=1) + theme_bw() + labs(title="Uniforme Verteilung", x="Beliebige Variable", y="Häufigkeit") + theme(plot.title=element_text(size = rel(1.5)))
histUniform