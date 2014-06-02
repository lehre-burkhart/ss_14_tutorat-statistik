###############################################################################
#
# 03_Zusatzstutorat
# ggplot2
#
# Albert-Ludwigs-Universität Freiburg
# Institut für Erziehungswissenschaft
# SS 2014
# Studienfach: Bildungswissenschaft und Bildungsmanagement (B.A.)
# Seminar: Statistik I
# 02.06.2014
#
###############################################################################


# **************** Befehle ausführen ******************************************
# In einem Skript werden Befehle ausgeführt, indem die Zeilen, die ausgeführt
# werden sollen zunächst markiert werden. Anschließend drückt man Strg + Enter
# auf dem Keyboard (Cmd + Enter auf dem Mac). Wenn du eine einzelne Zeile
# ausführen möchtest, klicke musst du lediglich den Cursor in der richtigen 
# Zeile haben und Strg + Enter drücken. 


# **************** ggplot2 ****************************************************
# Das Packet setzt Grafiken, um wie sie von Leland Wilkinson im Buch "The 
# Grammar of Graphics" empfohlen werden:
# http://www.amazon.de/The-Grammar-Graphics-Statistics-Computing/dp/0387245448
# Die Idee hinter ggplot2 ist, dass jede Grafik aus mehreren Schichten
# zusammengesetzt ist. Wenn ihr eine Grafik mit ggplot2 erstellt, werdet
# ihr mehrere dieser Schichten verwenden, um eure Grafiken hinreichend komplex
# zu machen. 


# **************** Packet installieren ****************************************
# Als erstes muss das Packet installiert werden. Währe dazu zunächst den 
# Server aus, aus dem die Packete installiert werden. Wähle dabei 35. Diese
# Zahl steht für den Server in Göttingen:
chooseCRANmirror()
# Installiere anschließend das Packet ggplot2:
install.packages("ggplot2")
# Allgemein werden Packete durch folgenden Befehl installiert:
# install.package("NAME DES PACKETS") -> Dabei steht der Name in Anführungs-
# zeichen


# **************** Den Datensatz laden ****************************************
# Um mit einem Packet in R arbeiten zu können, ist es notwendig, es zu laden.  
# Dies geschieht mit dem Befehl: library(NAME DES PACKETS)
# Man beachte, dass bei diesem Befehl der Name des Packets nicht in 
# Anführungszeichen geschrieben werden muss.
# Packete muss man jedesmal neu laden, um damit in R arbeiten zu können.
library(ggplot2)


# **************** Nützliche Links zu ggplot2 *********************************
# http://www.statmethods.net/advgraphs/ggplot2.html
# http://www.cookbook-r.com/Graphs/
# http://docs.ggplot2.org/current/ -> Sehr wichtige Seite. Es handelt sich hier
# um die Dokumentation des Packets. 


# **************** Den ersten Datensatz laden **********************************
# Führe den folgenden Befehl aus. Der Datensatz wird direkt aus dem Internet 
# geladen. Du musst ihn daher nicht vorher speichern:

facebook <- read.table(file.choose(), header = T, sep = "\t") # Facebook Datensatz


# **************** Der Facebook-Datensatz *************************************
names(facebook)


# **************** Die gplot() Funktion *************************************
# Mit der gplot() Funktion lassen sich Grafiken sehr schnell schreiben.
# Sie hat nicht den vollen Funktionsumfang Funktion ggplto(), die wir nachher
# sehen werden. 
# Eine Funktion hat immer einen Namen (hier gplot). Manche Funktionen 
# haben dazu Argumente, die das Verhalten der Funktion beeinflussen. 
# Die Argumente der Funktion gplot() lauten:
#
# qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, 
# formula=, facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)
#
# Mehr Informationen findet ihr hier: 
# http://docs.ggplot2.org/current/qplot.html
#
# *Histogramme*
qplot(x = age, data = facebook)
# qplot(): Dies ist die Funktion
# x = age: Hier wird die Variable für die X-Achse bestimmt
# data = facebook: Welcher Datensatz soll genommen werden
# Die Fehlermeldung kannst du zu diesem Zeitpunkt ignorieren.
#
# *TODO*: Erstelle ein Histogramm der Variable likes:
qplot(x = likes, data = facebook)

# Wir können das Histogramm des Alter mit weiteren Argumenten erweitern:
qplot(x = age, data = facebook, main = "Alter der Facebooknutzer", xlab = "Alter", ylab = "Häufigkeit", colour = I("black"), fill = I("yellow"))
# main = Gibt der Grafik eine Beschriftung
# xlab = Beschriftung der X-Achse
# ylab = Beschriftung der Y-Achse
# colour = I("red") = Bestimmung der Farbe des Randes des Balken
# fill = I("green") = Bestimmung der Fülle der Balken 
#
# *TODO*: Erstelle ein Histogramm der Variable 'friend_count'. Bestimme den
# Titel, die X-Achse, die Y-Achse, die Farbe und die Füllung des Histogramms
# nach deinen Wünschen:
qplot(x = friend_count, data = facebook, main = "friendship", xlab = "Alter", ylab = "Häufigkeit", colour = I("blue"), fill = I("red"))

# *Scatterplots*
# Scatterplots verwenden immer zwei Variablen (x und y):
qplot(x = age, y = mobile_likes, data = facebook)
#
# *TODO*: Erstele ein Scatterplot der Variablen likes und mobile_likes
# Bennene die X-Achse 'Likes' und die Y-Achse 'Mobile-Likes'. Die Punkte
# des Scatterplots sollen die Farbe blau haben. 
qplot(x = likes, y = mobile_likes, data = facebook, xlab = "Likes", ylab = "Mobile-Likes", colour = I("blue"))

# Mehr zu der qplot() Funktion findet ihr hier:
# http://docs.ggplot2.org/current/qplot.html


# **************** Die ggplot() Funktion *************************************
# Diese Funktion ermöglicht noch mehr Funktionalität als die qplot()-Funktion
# Hier wird vielmehr deutlich, wie Schichten aufeinander geschichtet werden 
# können. 


# **************** Histogramme mit ggplot() ***********************************
# Mehr Informationen: http://docs.ggplot2.org/current/geom_histogram.html
histAge <- ggplot(facebook, aes(age))
histAge <- histAge +  geom_histogram() 
histAge
# Zunächst erstellen wir die Grafik ggplot()
# histAge <- histAge + : Dies bedeutet, wir fügen eine weitere Schicht hinzu.
# geom_histogram(): Hiermit wird ein Histogramm erzeugt
# histAge: Hiermit wird die Grafik angezeigt. Die Befehle lassen sich
# ebenso kombinieren:
histAge <- ggplot(facebook, aes(age)) + geom_histogram()
histAge

# Führe nun folgende Funktion aus, um einen Film-Datensatz anzusehen, 
# der im Packet ggplot2 enthalten ist:
names(movies)
# *TODO*: Erstelle nun ein Histogramm der Variable *rating* des 
# movie-Datensatzes mit der Fuktion ggplot() und zeige dieses an.
histRating <- ggplot(movies, aes(rating))
histRating <- histRating + geom_histogram()
histRating

# Führe folgende Zeilen aus:
histVotes <- ggplot(movies, aes(budget)) + geom_histogram(binwidth = 10000000, colour = "black", fill = "yellow", linetype = "dashed") 
histVotes <- histVotes + labs(title = "Budget von Kinofilmen", x = "Budget", y = "Häufigkeiten")
histVotes <- histVotes + theme(plot.title = element_text(face="bold", size = 16))                                                                                                                                                                                                      
histVotes
# binwidth = 10000000: 10 Millionen wirklich? Ja, Filme sind teuer.
# binwidth steht also für die Breite der Bins.
# colour = "black": Bestimmt den Rand der Bins des Histogramms
# fill = "yellow": Bestimmt die Füllung der Bins
# linetype = "dashed": Die Linie der Bins soll gestrichelt sein
# labs(): Hiermit wird der Title, die X-Achse und die Y-Achse beschriftet
# theme(): Hier verwenden wir die Funktion, um die Darstellung des Titels zu verändern
# plot.title: Der Titel des Histogramms soll verändert werden
# face = "bold": Der Titel soll dick sein
# size = 16: Der Titel wird größer gemacht

# *TODO*: Erstelle ein Histogramm mit folgenden Eigenschaften:
# 1. Die X-Achse repräsentiert die Variable 'year'
# 2. Die binwidth ist 1 Jahr.
# 3. Die Randfarbe der Bins ist schwarz
# 4. Die Füllung der Bins ist weiß
# 5. Die X-Achse heißt: "Jahr"
# 6. Die Y-Achse heißt: "Häufigkeit"
# 7. Der Titel heißt: "Filmveröffentlichung über die Zeit"
# 8. Der Titel ist fettgedruckt und hat die size 16
histYear <- ggplot(movies, aes(x = year))
histYear <- histYear + geom_histogram(binwidth = 1, colour = "black", fill = "white")
histYear <- histYear + labs(title = "Filmveröffentlichung über die Zeit", x = "Jahr", y = "Häufigkeit")
histYear <- histYear + theme(plot.title = element_text(face = "bold", size = 16))
histYear


# **************** Barcharts mit ggplot() *************************************
# Mehr Informationen: http://docs.ggplot2.org/current/geom_bar.html
barGender <- ggplot(facebook, aes(x = gender))
barGender <- barGender + geom_bar(colour = "black", fill = "white", width = .8)
barGender <- barGender + labs(title = "Alter von FB-Nutzer", x = "Geschlecht", y = "Häufigkeiten")
barGender <- barGender + theme(plot.title = element_text(face="bold", size = 16))         
barGender
# geom_bar(): Mit dieser Funktion wird der Barchart erzeugt
# width = .8: Hiermit bestimmen wir die Breite der Bars
# Ansonsten handelt es sich um viel Code. Alles andere kennen wir aber schon!


# *TODO*: Füge folgenden Code aus, um die Datei 'studidaten.csv' zu laden:
# Hierbei handelt es sich um eure eigenen Daten über die Schuhgröße und
# die Körpergröße
studis <- read.csv(file.choose(), header = T, sep = ",") # Lieder Datensatz
studis$gender <- as.factor(studis$gender) # Die Variable muss vorher
# umgewandelt werden. An dieser Stelle für euch nicht wichtig. 

# *TODO*: Erstelle ein Barchart mit folgenden Eigenschaften:
# 1. Die X-Achse repräsentiert die Variable 'gender'
# 3. Die Randfarbe der Bins ist grau
# 4. Die Füllung der Bins ist grün
# 5. Die X-Achse heißt: "Geschlecht"
# 6. Die Y-Achse heißt: "Häufigkeit"
# 7. Der Titel heißt: "Geschlecht der Studierenden im Tutorat"
# 8. Der Titel hat die size 14
barGender <- ggplot(studis, aes(gender))
barGender <- barGender + geom_bar(colour = "grey", fill = "green")
barGender <- barGender + labs(title = "Geschlecht der Studierenden im Tutorat", x = "Geschlecht", y = "Häufigkeit")
barGender <- barGender + theme(plot.title = element_text(size = 14))
barGender

# **************** Scatterplot mit ggplot() ***********************************
# Mehr Informationen: http://docs.ggplot2.org/current/geom_point.html
scat.height.shoesize <- ggplot(studis, aes(x = height, y = shoesize))
scat.height.shoesize <- scat.height.shoesize + geom_point(colour = "blue", size = 4)
scat.height.shoesize <- scat.height.shoesize + labs(title = "Scatterplot Schuhgröße-Körpergröße", x = "Körpergröße", y = "Schuhgröße")
scat.height.shoesize <- scat.height.shoesize + theme(plot.title = element_text(face="bold", size = 16))  
scat.height.shoesize
# aes(x = height, y = shoesize): Nun müssen wir eine zweite Variable angeben,
# da ein Scatterplot immer zwei Variablen besitzt
# geom_point(): Hiermit wird ein Scatterplot erzeugt

# *TODO*: Erzeuge ein Scatterplot aus dem Facebookdatensatz mit folgenden 
# Eigenschaften:
# Achte darauf, dass du bei dieser Übung nicht jeden Code brauchst, der
# im vorherigen Beispiel gezeigt wurde!
# 1. Die X-Achse repräsentiert die Variable 'likes'
# 2. Die Y-Achse repräsentiert die Variable 'friendships_initiated'
# 3. Die X-Achse heißt: "Likes"
# 4. Die Y-Achse heißt: "Initiierte Freundschaften"
scat.likes.f_init <- ggplot(facebook, aes(x = likes, y = friendships_initiated))
scat.likes.f_init <- scat.likes.f_init + geom_point()
scat.likes.f_init <- scat.likes.f_init + labs(x = "Likes", y = "Initiierte Freundschaften")
scat.likes.f_init

# **************** Boxplot mit ggplot() ***************************************
# Mehr Informationen: http://docs.ggplot2.org/current/geom_boxplot.html

boxHeight <- ggplot(studis, aes(x = gender, y = height))
boxHeight <- boxHeight + geom_boxplot()
boxHeight <- boxHeight + geom_jitter()
boxHeight
# geom_boxplot(): Hiermit wird der Boxplot erzeugt
# geom_jitter(): Diese Funktion zeigt die einzelnen Werte der Variable 
# willkürlich zerstreut an.

# *TODO*: Erzeuge einen Boxplot aus dem Datensatz facebook mit folgenden
# Eigenschaften: 
# 1. Die X-Achse repräsentiert die Variable 'gender'
# 2. Die Y-Achse repräsentiert die Variable 'friend_count'
# 3. Die X-Achse heißt: "Geschlecht"
# 4. Die Y-Achse heißt: "Rating"
# 5. Die Box hat die Füllung 'tomato'
# 6. Benutze nicht die Funktion geom_jitter(). Wenn du dich fragst warum,
# probier es aus. 
# 7. Der Titel des Boxplots ist: "Boxplot Friend_count anhand des Geschlechts"
box.friend_count <- ggplot(facebook, aes(x = gender, y = friend_count))
box.friend_count <- box.friend_count + geom_boxplot(fill = "tomato")
box.friend_count <- box.friend_count  + labs(x = "Geschlecht", y = "Rating", title = "Boxplot Friend_count anhand des Geschlechts")
box.friend_count


# **************** Normalverteilung über ein Histogramm ***********************
histRating <- ggplot(movies, aes(rating)) + geom_histogram(aes(y = ..density..), binwidth = .5, colour = "black", fill = "white") 
histRating <- histRating + stat_function(fun = dnorm, colour="blue", args = list(mean = mean(movies$rating), sd = sd(movies$rating)))
histRating <- histRating + labs(title = "Budget von Kinofilmen", x = "Budget", y = "Dichte")
histRating <- histRating + theme(plot.title = element_text(face="bold", size = 16))                                                                                                                                                                                                         
histRating
# aes(y = ..density..): Hiermit verändern wir die Darstellung der Y-Achse.
# Von absoluten Häufigkeiten zu den relativen Häufigkeiten
# stat_function(): Hiermit bilden wir eine Funktion auf dem Graf ab. Hier
# die Normalverteilung
# fun = dnorm: Dies bedeutet, wir möchten eine Normalverteilung erstellen.
# args = list(): Hier geben wir die Argumente für die Normalverteilung an.
# mean = mean(movies$rating): Wir bestimmen den Mittelwert für die 
# Normalverteilung
# sd = sd(movies$rating): Wir bestimmen die Standardabweichung der
# Normalverteilung



