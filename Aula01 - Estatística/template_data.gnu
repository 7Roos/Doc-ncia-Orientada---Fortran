set terminal pngcairo       #Seleciona o terminal 
set output 'graph.png'      #Escolhe o formato e nome do arq de saída
set xlabel "x"              #Rotula o eixo x
set ylabel "y"              #Rotula o eixo y
set title "Experimento ##"  #Título do gráfico

#Armazena o local do arquivo de dados
m = "./data_plot.dat"    
n(x)=x

#Demarcamos valores específicos no eixo x e y
#set xtics ("10^{-1}" log(0.1), "10^{-2}" log(0.01), "10^{-3}" log(0.001), "10^{-4}" log(0.0001), "10^{-5}" log(0.00001), "10^{-6}" log(0.000001))
set xtics ("0" 0, "2" 2, "4" 4)
#set ytics ("10^{-1}" log(0.1), "10^{-2}" log(0.01), "10^{-3}" log(0.001), "10^{-4}" log(0.0001), "10^{-5}" log(0.00001), "10^{-6}" log(0.000001))

#set key top center
#Podemos acessar cada coluna do arquivo dat por $1.
plot m using 1:2:3 title "Experimento" with yerrorbars, n(x) t "Teoria" w lines linewidth 3.000

