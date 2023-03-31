# KalkulacjaPKBrozniczkowe

Projekt dotyczy praktycznego zastosowania równań różniczkowych zwyczajnych w prognozowaniu wzrostu PKB. Przy wykorzystaniu danych z data.worldbank.org obliczamy prognozowane PKB dla dowolnego kraju. Zakładamy przy tym, że zarówno za podstawowe PKB, jak i za współczynnik wzrostu przyjęto te z 2021 roku. 

# Zastosowane równanie różniczkowe
![](https://user-images.githubusercontent.com/112055662/221304001-6fb1b287-397a-4032-96c9-708bf0fb9fd0.png)
Gdzie:
x – PKB
t – czas (rok)
g – współczynnik wzrostu
Po rozwiązaniu otrzymano:
![](https://user-images.githubusercontent.com/112055662/221303895-474aab97-8a6b-4f62-9fe2-ad8a371e54aa.png)
x_0 – początkowe PKB

Następnie zastosowano powyższy wzór na realnych danych pobranych z _data.worldbank.org_.

#	Prognoza PKB na podstawie danych z 2021 roku
Pracowano na dwóch zestawach danych: current_gdp.csv oraz gdp_rate.csv.
Przy ich wykorzystaniu można obliczyć prognozowanie PKB dla dowolnego kraju. Zakładamy przy tym, że zarówno za podstawowe PKB, jak i za współczynnik wzrostu przyjęto te z 2021 roku.
Dodatkowo, PKB podane jest w dolarach.
Zaprezentujemy działanie kodu na danych z Polski na 10 lat do przodu.
![](https://user-images.githubusercontent.com/112055662/221304318-bb29cddc-3b5a-43d3-b582-1989361bacb9.png)

#Wykresy 
Aby lepiej zobrazować wyniki, sporządzono wykresy PKB (GDP) w zależności od roku:

![](https://user-images.githubusercontent.com/112055662/221303432-d13c34c9-929c-48fe-9be3-50e445b7a977.png)

![](https://user-images.githubusercontent.com/112055662/221303439-3c39bedd-e750-4a11-a560-680ba11fa369.png)

![](https://user-images.githubusercontent.com/112055662/221303448-a8907d7b-1cce-49e2-8c80-d90c90f74739.gif)

A university project made by /martynix and /abeestungme .
