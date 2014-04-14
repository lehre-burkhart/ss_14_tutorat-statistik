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

# Lade Bibliotheken
library(ggplot2)
library(gridExtra)


# ************* 5.4 Formen von Häufigkeitsverteilungen ********************

# Intelligenzdaten
iq <- c(54, sample(55:69, 21, replace=T), sample(70:84, 100, replace=T), sample(85:99, 174, replace=T), sample(100:114, 192, replace=T), sample(115:129, 92, replace=T), sample(130:144, 16, replace=T), 146, 150)
# Der folgende Vector erzeugt ähnliche Werte wie sie in Kapitel 5.3.3 (S. 66) dargestellt werden
iqStudie <- as.data.frame(iq) # Konvertiere Vector in dataframe
colnames(iqStudie) <- c("IQ") # Gebe der einzigen Spalte den Namen IQ

# Histogram der Intelligenzdaten mit einer Gauß'schen Glockenkurve
histIQGaus <- ggplot(iqStudie, aes(x=IQ)) +  geom_histogram(aes(y = ..density..), binwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iqStudie, c(mean = mean(IQ), sd = sd(IQ))), colour="red") + labs(title="IQ mit Gauß'scher Gockenkurve", x="Intelligenz", y="Density")  + theme_bw() + theme(plot.title = element_text(size = rel(1.5))) # erstelle Histogram der Intelligenzdaten mit Gauß'scher Normalverteilung
histIQGaus

# Histogram normalverteilter Daten
iq20 <- data.frame(IQ = rnorm(20, mean=100, sd=10)) # normalverteilte Daten mit 20 Datensätzen
iq50 <- data.frame(IQ = rnorm(50, mean=100, sd=10)) # normalverteilte Daten mit 50 Datensätzen
iq100 <- data.frame(IQ = rnorm(100, mean=100, sd=10)) # normalverteilte Daten mit 100 Datensätzen
iq500 <- data.frame(IQ = rnorm(500, mean=100, sd=10)) # normalverteilte Daten mit 500 Datensätzen
iq1000 <- data.frame(IQ = rnorm(1000, mean=100, sd=10)) # normalverteilte Daten mit 1000 Datensätzen
iq5000 <- data.frame(IQ = rnorm(5000, mean=100, sd=10)) # normalverteilte Daten mit 5000 Datensätzen
iq10000 <- data.frame(IQ = rnorm(10000, mean=100, sd=10)) # normalverteilte Daten mit 10000 Datensätzen

histIQ20 <- ggplot(iq20, aes(x=IQ)) + geom_histogram(aes(y = ..density..), bindwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iq20, c(mean=mean(IQ), sd=sd(IQ))), colour="red") + labs(title="IQ mit 20 Datensätzen", x="IQ", y="Density") + theme_bw() + theme(plot.title=element_text(size=18))

histIQ50 <- ggplot(iq50, aes(x=IQ)) + geom_histogram(aes(y = ..density..), bindwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iq50, c(mean=mean(IQ), sd=sd(IQ))), colour="red") + labs(title="IQ mit 50 Datensätzen", x="IQ", y="Density") + theme_bw() + theme(plot.title=element_text(size=18))

histIQ100 <- ggplot(iq100, aes(x=IQ)) + geom_histogram(aes(y = ..density..), bindwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iq100, c(mean=mean(IQ), sd=sd(IQ))), colour="red") + labs(title="IQ mit 100 Datensätzen", x="IQ", y="Density") + theme_bw() + theme(plot.title=element_text(size=18))

histIQ500 <- ggplot(iq500, aes(x=IQ)) + geom_histogram(aes(y = ..density..), bindwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iq500, c(mean=mean(IQ), sd=sd(IQ))), colour="red") + labs(title="IQ mit 500 Datensätzen", x="IQ", y="Density") + theme_bw() + theme(plot.title=element_text(size=18))

histIQ1000 <- ggplot(iq1000, aes(x=IQ)) + geom_histogram(aes(y = ..density..), bindwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iq1000, c(mean=mean(IQ), sd=sd(IQ))), colour="red") + labs(title="IQ mit 1000 Datensätzen", x="IQ", y="Density") + theme_bw() + theme(plot.title=element_text(size=18))

histIQ5000 <- ggplot(iq5000, aes(x=IQ)) + geom_histogram(aes(y = ..density..), bindwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iq5000, c(mean=mean(IQ), sd=sd(IQ))), colour="red") + labs(title="IQ mit 5000 Datensätzen", x="IQ", y="Density") + theme_bw() + theme(plot.title=element_text(size=18))

histIQ10000 <- ggplot(iq10000, aes(x=IQ)) + geom_histogram(aes(y = ..density..), bindwidth=5, colour="black", fill="grey") + stat_function(fun = dnorm, args = with(iq5000, c(mean=mean(IQ), sd=sd(IQ))), colour="red") + labs(title="IQ mit 10000 Datensätzen", x="IQ", y="Density") + theme_bw() + theme(plot.title=element_text(size=18))

grid.arrange(histIQ20, histIQ50, histIQ100, histIQ500, histIQ1000, histIQ5000, histIQ10000, ncol=2)


# ****************** 5.4.2 Gipfel von Verteilungen *********************************

# Erzeuge bimodale Verteilung
vector1 <- rnorm(300, mean=100, sd=10) # Vector mit normalverteilten Daten erstellen. Mittelwert = 20, SD = 3
vector2 <- rnorm(300, mean=60, sd=10) # Vector mit normalverteilten Daten erstellen. Mittelwert = 10, SD = 3
vector3 <- c(vector1, vector2) # Kombiniere beide Populationen zu einem Vector
bimodal <- data.frame(Pop2 = vector3) # Erzeuge dataframe 
# Bimodales Histogramm mit Mittelwert
histBimodal <- ggplot(bimodal, aes(Pop2)) + geom_histogram(binwidth=5, colour="black", fill="grey") + geom_vline(aes(xintercept=mean(Pop2)), color="red", linetype="dashed", size=1) + theme_bw() + labs(title="Bimodale Verteilung", x="Beliebige Variable", y="Häufigkeit") + theme(plot.title=element_text(size = rel(1.5)))
histBimodal

# Erzeuge uniforme Verteilung
uniform <- data.frame(x=runif(1000, min=0, max=100)) # Erzeuge uniforme Verteilung
# Uniformes Histogramm mit Mittelwert
histUniform <- ggplot(uniform, aes(x)) + geom_histogram(binwidth=5, colour="black", fill="grey") + geom_vline(aes(xintercept=mean(x)), color="red", linetype="dashed", size=1) + theme_bw() + labs(title="Uniforme Verteilung", x="Beliebige Variable", y="Häufigkeit") + theme(plot.title=element_text(size = rel(1.5)))
histUniform


# *************************** 5.4.3 Schiefe von Verteilungen ***************************

# Histogram der Bewertungen der Filme der Seite imdb.com mit Mittelwert und Median
histMovies <- ggplot(movies, aes(rating)) + geom_histogram(binwidth=.3, colour="black", fill="grey") + geom_vline(aes(xintercept=mean(rating)), linetype="dashed", size=1, colour="red") + geom_vline(aes(xintercept=median(rating)), linetype="dashed", size=1, colour="blue") + geom_text(aes(mean(rating) - .4, 5200, label="Mean")) + geom_text(aes(median(rating) + .5, 5200, label="Median")) + theme_bw() + labs(title="Filmratings von imdb.com", x="Rating", y="Häufigkeit") + theme(plot.title=element_text(size=18))
histMovies

# Beispiel einer rechtschiefen Verteilung
skewedLeft <- data.frame(x = rbeta(10000, 5, 2))
skewedRight <- data.frame(x = rbeta(10000, 2, 5))

histLeft <- ggplot(skewedLeft, aes(x)) + geom_histogram(binwidth=.05, colour="black", fill="grey") + geom_vline(aes(xintercept=mean(x)), linetype="dashed", size=1, colour="red") + geom_vline(aes(xintercept=median(x)), linetype="dashed", size=1, colour="blue") + theme_bw() + labs(title="Linksschiefe Verteilung", x="x", y="Häufigkeit") + theme(plot.title=element_text(size=18))
histLeft

# Beispiel einer linksschiefen Verteilung
histRight <- ggplot(skewedRight, aes(x)) + geom_histogram(binwidth=.05, colour="black", fill="grey") + geom_vline(aes(xintercept=mean(x)), linetype="dashed", size=1, colour="red") + geom_vline(aes(xintercept=median(x)), linetype="dashed", size=1, colour="blue") + theme_bw() + labs(title="Rechtschiefe Verteilung", x="x", y="Häufigkeit") + theme(plot.title=element_text(size=18))
histRight


# ***************** 5.5 Darstellung der empirischen Verteilungsfunktion **********************

# Empirische Verteilungsfunktion
empVIQ <- ggplot(iqStudie, aes(IQ)) + stat_ecdf(colour="blue") + theme_bw() + labs(title="Empirische Verteilungsfunktion des IQs", x="IQ", y="Density") + theme(plot.title=element_text(size=18))
empVIQ


# ********************** Weitere Informationen ***********************************
# http://www.mathsisfun.com/data/skewness.html