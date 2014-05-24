##################################################################
#
# 03_Univariate deskriptive Statistik 2
# Histogramme zum Test
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 24.05.2014
#
###################################################################


# Packete laden
library(ggplot2)
library(gridExtra)

# Working-Directory bestimmen
setwd("C:/Users/Christian/Dropbox/Christian_HiWi/_Statistik I_Tutorat/03_Univariate deskriptive Statistik 2/Tutorat")

# Daten laden
test <- read.table("03_daten.txt", header = T)

# Histogramm Statistik-Test
statHist <- ggplot(test, aes(stat)) + geom_histogram(binwidth = 1, colour = "black", fill = "white") + geom_vline(aes(xintercept = mean(stat)), color = "blue", linetype = "dashed", size = 1) + geom_vline(aes(xintercept = median(stat)), colour = "red", linetype = "dashed", size = 1) + scale_y_continuous(limits=c(0, 45)) + scale_x_continuous(limits=c(0,11), breaks=0:10) + labs(title = "Histogramm Statistik-Test", x = "stat", y = "Haeufigkeit") + annotate("text", x = 8.1, y = 44, label = "m = 3 (1.03)")

# Histogramm Kognitionspsychologie-Test
kopsyHist <- ggplot(test, aes(kopsy)) + geom_histogram(binwidth = 1, colour = "black", fill = "white") + geom_vline(aes(xintercept = mean(kopsy)), colour = "blue", linetype = "dashed", size = 1) + geom_vline(aes(xintercept = median(kopsy)), colour = "red", linetype = "dashed", size = 1) + scale_y_continuous(limits=c(0, 45)) + scale_x_continuous(limits=c(0,11), breaks=0:10) + labs(title = "Histogramm Kognitionspsychologie-Test", x = "kopsy", y = "Haeufigkeit") + annotate("text", x = 8.1, y = 44, label = "m = 4.97 (1.63)")

# Histogramm in einer Grafik anzeigen
grid.arrange(statHist, kopsyHist, ncol = 2)

