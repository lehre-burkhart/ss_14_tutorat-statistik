##################################################################
#
# R anhand der IMDB (Internet Movie Database) kennenlernen
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 15.04.2014
#
###################################################################

# Zunächst müssen wir das Packet ggplot2 installieren, dort sind die Daten der Filme gespeichert
chooseCRANmirror() # Wählt den Server aus, von dem die Packete installiert werden; wählt z.B. Göttingen
install.packages("ggplot2") # Installiert das Packet ggplot2
install.packages("psych") # Zusätlich installieren wir das Packet psych
library(ggplot2) # Das Packet wird geladen, so dass wir es benutzen können
library(psych) # Das Packet psych wird geladen


# ************************** Das Dataframe movies kennenlernen*************************
?movies # Öffnet das Hilfefenster

names(movies) # Hier sehen wir, welche Variablen das Dataframe hat

str(movies) # Alternativ können wir das Dataframe mit dieser Funktion inspizieren. Diese Methode ist genauer

# Einzelne Variablen im Dataframe inspizieren
head(movies$year) # Mit einem Dollarzeichen und dem Variablennamen können wir eine Variable betrachten. Die Funktion head sorgt dafür, dass wir nur die ersten Werte der Variablen betrachten. Dies ist wichtig, da wir über 28000 Reihen haben. 
movies[c(1:10),]$year # Mit eckicken Klammern können wir Teile des Dataframes ausschneiden. Der erste Wert vor dem Komme sind die Reihen, der zweite die Spalten
movies[1, c(1:3)] # Hier inspizieren wir die erste Reihe und die ersten drei Spalten

# TODO Inspiziere die fünfte Reihe mit den Spalten 3 bis 5
movies[5, c(3:5)]

# TODO Inspiziere die Reihen 28 bis 31 mit den Spalten 2 und 5 (Achtung! Hier müsst ihr bei den Spalten etwas anderes setzen als einen Doppelpunkt)
movies[c(28:31), c(2, 5)]

head(movies[,c("year", "Action", "Documentary")]) # Das Dataframe lässt sich ebenso anhand der Variablennamen inspizieren

# TODO Inspiziere Reihe 700 mit den Variablen rating, votes und Animation
movies[700, c("rating", "votes", "Animation")]

# ******************** Die Table-Funktion ***********************************************
# Mit dieser Funktion lassen sich nominalskalierte Daten sehr gut betrachten
table(movies$Comedy) # Wie viele Comedyfilme sind im Dataframe?

# TODO Bestimme den prozentualen Anteil der Actionfilme im Dataframe
prop.table(table(movies$Action))

# TODO Gibt es mehr Romanzen als Actionfilme in der Database? Wenn das zu einfach ist, versuche die Antwort in einer einzigen Zeile zu finden. Tipp: table(movies$Comedy)[2] liefert die Anzahl der Comedyfilmet
table(movies$Romance, movies$Action)
table(movies$Romance)[2] > table(movies$Action)[2]

table(movies$Comedy, movies$Animation) # Es lassen sich auch zwei Variablen in einer Tabelle betrachten

# TODO Wie viel Filme sind weder ein Kurzfilm noch ein Drama?
table(movies$Short, movies$Drama)
# Result: 28618

# ******************* Weitere wichtige Funktionen ********************************
nrow(movies) # Bestimmt wie viele Reihen im Dataframe sind
ncol(movies) # Bestimmt die Anzahl der Spalten im Dataframe

# TODO Inspiziere die letzte Reihe im Dataframe movies. Benutze hierfür die nrow()-Funktion
movies[nrow(movies),]

min(movies$year) # Findet den geringsten Wert in der Variable year
which.min(movies$year) # Findet die Position des geringsten Wertes in der Variable year

# TODO Finde die Position des Films mit dem höchsten Budget
which.max(movies$budget)

# TODO Wie heißt der Film mit dem höchsten Budget?
movies[which.max(movies$budget), c("title")]

# TODO Wie hoch ist das höchste Budget?
max(movies$budget, na.rm = T)

sum(movies$votes) # Wie viele Stimmen wurden bisher für alle Filme abgegeben

# TODO Wie viele Tage dauern alle Filme, die im Dataframe sind? Speichere das Ergebnis in einer Variable mit dem Namen tage
days <- (sum(movies$length) / 60) / 24
days

# TODo Wie viele Jahre dauert es, alle Filme des Dataframes zu schauen? Benutze die Variable tage, um zu der Antwort zu kommen.
years <- days / 365
years

# ****************** Einen Dataframe teilen *************************************
comedies <- subset(movies, Comedy == 1) # Erzeugt einen neuen Dataframe nur mit Comedyfilmen

# TODO Erzeuge einen Dataframe namens documentary, in welchem alle Dokumentationen sind
documentary <- subset(movies, movies$Documentary == 1)

goodDrama <- subset(movies, Drama == 1 & rating >= 7) # Erzeugt einen Dataframe, mit allen Dramen, welche mindestens eine Bewertung von 7 bekommen haben

# TODO Wie viele Filme unter goodDrama gibt es?
nrow(goodDrama)

# ***************** Die tapply() Funktion ***************************************
tapply(movies$rating, movies$Action, mean) # Werden Actionfilme im Schnitt besser bewertet als Nicht-Action-Filme?
tapply(movies$votes, movies$rating >= 5, sum) # Zeigt, wie viele Stimmen Filme mit einem Rating unter und über 5 bekommen haben

tapply(movies$budget, movies$Documentary, mean, na.rm= T) # Manchmal gibt es keine Werte in einer Reihe (NAs). Manche Funktionen muss man sagen, dass man NAs nicht verwenden möchte. Hierfür verwendet man das Argument na.rm=T. 

# TODO Wie hoch ist das mittlere Budget (Mittelwert) im Vergleich von Romanzen zu Nicht-Romanzen?
tapply(movies$budget, movies$Romance, mean, na.rm = T)

# TODO Wie hoch ist das mittlere Rating zwischen Filmen vor und nach dem Jahr 1970?
tapply(movies$rating, movies$year < 1970, mean)


# ********************* Funktionen der Lage- und Streuungsmaße ********************************

mean(movies$rating) # Mittelwert der Ratings der Filme

# TODO finde den Mittelwert der Länge aller Filme
mean(movies$length)

median(movies$year) # Median der Veröffentlichungen der Filme

# TODO finde den Median des Budgets aller Filme
median(movies$budget, na.rm = T)

sd(movies$budget) # Standardabweichung des Budgets aller Filme

var(movies$length) # Varianz der Länge aller Filme

describe(movies$rating) # Zeigt die deskriptive Statistik einer Variable des Dataframes

describe(movies[,c(4:5)]) # Zeigt die deskriptive Statistik der Variablen 4 bis 5 des Dataframes

describeBy(movies$rating, movies$Action) # Zeigt die deskriptive Statistik abhängig einer Gruppe

summary(movies$rating) # Eine weitere Funktion zur Darstellung der deskriptiven Statistik


# ************************ Einfache grafische Darstellungen *************************

hist(movies$rating) # Histogram der Ratings aller Filme

# Ein Beispiel eines Histograms mit ggplot2
histRating <- ggplot(movies, aes(x = rating)) + geom_histogram(binwidth=.5, colour="black", fill="grey") + theme_bw() + labs(title="Imdb-Ratings", x = "rating", y = "Häufigkeit") + theme(plot.title=element_text(size=19))
histRating 

# TODO Erstelle ein Histogram des Budgets der Filme
hist(movies$budget)

boxplot(movies$rating) # Erstellt ein Boxplot der Ratings der Filme

# TODO Erstelle einen Boxplot der Länge der Filme
boxplot(movies$length)

# Es gibt ein paar Filme, die sehr lang sind. Dies erzeugt einen Boxplot, der schwer zu interpretieren ist

# TODO Erzeuge einen neuen Dataframe, in dem die Filme maximal 200 Minuten lang sind
shorterFilms <- subset(movies, movies$length <= 200)

# TODO Erstelle erneut einen Boxplot mit dem neuen Dataframe
boxplot(shorterFilms$length)

