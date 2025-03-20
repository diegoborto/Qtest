dati <- read.table('Dati qtest.txt', header=FALSE, dec = ",")
dati <- dati[,1]
l <- length(dati)
#N dati
l
dati
valori <- read.table('Valori qtest.txt', header=TRUE, sep= ",", dec=".")

if (l<3 || l>10)  {stop("Non è presente il valore di riferimento tabulato")}

rif = valori[l-2,2]
#il valore di riferimento per il qtest
rif
vmin = min(dati)
vmax= max(dati)
vtest <- vmax
#calcola tutte le differenze per trovare il valore più vicino
diff <- dati
for(i in 1:l){
  diff[i] = abs(dati[i] - vtest)
  if(diff[i] == 0.0) { diff[i] <- 10000000 }
}
mindiff <- min(diff)

#posizione di dove si trova la minima differenza
for(i in 1:l){
  diff[i]
  if(diff[i] == mindiff) { vvicino <- dati[i] }
}

#valore sospetto
vtest
#valore vicino
vvicino
qtest = abs(vtest-vvicino)/(vmax-vmin)
qtest
if (qtest<rif){"Il valore massimo non è rigettabile"}
if(qtest>rif){"Il valore massimo è rigettabile"}

vtest <- vmin
#calcola tutte le differenze per trovare il valore più vicino
diff <- dati
for(i in 1:l){
  diff[i] = abs(dati[i] - vtest)
  if(diff[i] == 0.0) { diff[i] <- 10000000 }
}
mindiff <- min(diff)
#posizione di dove si trova la minima differenza
for(i in 1:l){
  diff[i]
  if(diff[i] == mindiff) { vvicino <- dati[i] }
}

#valore sospetto
vtest
#valore vicino
vvicino
qtest = abs(vtest-vvicino)/(vmax-vmin)
qtest
if (qtest<rif){"Il valore minimo non è rigettabile"}
if(qtest>rif){"Il valore minimo è rigettabile"}
#valore di q_tab
rif


