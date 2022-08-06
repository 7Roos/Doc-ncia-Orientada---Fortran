set terminal pngcairo size 600,400 font 'arial,12' fontscale 1.0
set encoding utf8
set output 'figureAceleracao.png'
set xlabel "t[s]"
set ylabel "a[m/s^2]"
set title 'Corpo em queda livre - Aceleração'

#Dados "reais"
m = "./function_y.dat"
n = "./velocity.dat"
o= "./acceleration.dat"

#set key off
#range p/aceleração
#set yrange [-12:-4]
#DADOS TEÓRICOS
g(x) = -9.81    #Aceleração
h(x) = -9.81*x  #Velocidade
f(x) = 10. - .5*9.81*x*x   #Trajetória

plot o lt 1 pi 3 pt 5 linecolor rgb "#505e10" title "Real", g(x) with line lt -1 lw 2 title "Teoria" #p using 1:4 lt 3 pi 1 pt 1 title "Teoria"

