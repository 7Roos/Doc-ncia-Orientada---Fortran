set terminal pngcairo size 600,400 font 'arial,12' fontscale 1.0
set encoding utf8
set output 'graphPrecisionD_Log.png'      #Escolhe o formato e nome do arq de saída
set xlabel "N Passos"              #Rotula o eixo x
set ylabel "Erro"           #Rotula o eixo y
set title "Integral função Log"    #Título do gráfico

#Agrupa algumas configurações gerais da linha do plot
set style line 1 lt -1 pi -1 pt 1 lc rgb "red" lw 2
set style line 2 lt 2 pi -2 pt 2 lc rgb "orange" lw 2
set style line 3 lt 2 pi -3 pt 3 lc rgb "blue" lw 3
set style line 4 lt 2 pi -4 pt 4 lc rgb "green" lw 2
set style line 5 lt 2 pi -5 pt 4 lc rgb "#505e10" lw 2

#Armazena o local do arquivo de dados
ret = "./IntRetangulo.dat"
m = "./IntTrapezoidal.dat"    
n = "./IntSimpson1_3.dat"
o = "./IntSimpson3_8.dat"
p = "./IntBode.dat"

set xrange [4:130]
set yrange [log(0.0000000001):log(0.1)]

#Demarcamos valores específicos no eixo x e y
set xtics ("4" 4, "16" 16, "32" 32, "64" 64, "128" 128)

set ytics ("10^{-1}" log(0.1), "10^{-2}" log(0.01), "10^{-3}" log(0.001), "10^{-4}" log(0.0001), "10^{-5}" log(0.00001), "10^{-6}" log(0.000001), "10^{-7}" log(0.0000001), "10^{-8}" log(0.00000001), "10^{-9}" log(0.000000001), "10^{-10}" log(0.0000000001))

#set key at graph .35, 0.9
set key outside
#Podemos acessar cada coluna do arquivo dat por $1.
plot ret using ( ($1) ):( log($2) ) with linespoints ls 1 title "Retangulo", m using ( ($1) ):( log($2) ) with linespoints ls 2 title "Trapezoidal", n using ( ($1) ):( log($2) ) with linespoints ls 3 title "Simpson 1/3", o using ( ($1) ):( log($2) ) with linespoints ls 4 title "Simpson 3/8"#, p using ( ($1) ):( log($2) ) with linespoints ls 5 title "Boole"