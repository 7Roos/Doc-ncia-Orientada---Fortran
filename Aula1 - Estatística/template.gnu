set terminal pngcairo       #Seleciona o terminal 
set output 'graph.png'      #Escolhe o formato e nome do arq de saída
set xlabel "h"              #Rotula o eixo x
set ylabel "Erro"           #Rotula o eixo y
set title "Exercício #"    #Título do gráfico

#Agrupa algumas configurações gerais da linha do plot
set style line 1 lt -1 pi -1 pt 1 lc rgb "red" lw 2
set style line 2 lt 2 pi -2 pt 2 lc rgb "orange" lw 2
set style line 3 lt 2 pi -3 pt 3 lc rgb "blue" lw 3
set style line 4 lt 2 pi -4 pt 4 lc rgb "green" lw 2

#Armazena o local do arquivo de dados
m = "./dfun2PtsBack.dat"    
n = "./dfun2PtsFor.dat"
o = "./dfun3Pts.dat"
p = "./dfun5Pts.dat"
#q = "./d2fun3Pts.dat"
#r = "./d2fun5Pts.dat"

#Demarcamos valores específicos no eixo x e y
set xtics ("10^{-1}" log(0.1), "10^{-2}" log(0.01), "10^{-3}" log(0.001), "10^{-4}" log(0.0001), "10^{-5}" log(0.00001), "10^{-6}" log(0.000001))

set ytics ("10^{-1}" log(0.1), "10^{-2}" log(0.01), "10^{-3}" log(0.001), "10^{-4}" log(0.0001), "10^{-5}" log(0.00001), "10^{-6}" log(0.000001))

set key top center
#Podemos acessar cada coluna do arquivo dat por $1.
plot m using ( log($1) ):( log($2) ) with linespoints ls 1 title "2PtsBack", n using ( log($1) ):( log($2) ) with linespoints ls 2 title "2PtsFor", o using ( log($1) ):( log($2) ) with linespoints ls 3 title "3Pts", p using ( log($1) ):( log($2) ) with linespoints ls 4 title "5Pts"

#plot q using ( log($1) ):( log($2) ) with linespoints ls 1 title "d2fun3Pts", r using ( log($1) ):( log($2) ) with linespoints ls 2 title "d2fun5Pts"