reset
set terminal pngcairo dashed enhanced size 480,360 font 'arial,12' fontscale 1.0
set encoding utf8
set output 'figure.png'
set xlabel "x"
set ylabel "y"
m = "./function1.dat"
set title 'function root'
set xzeroaxis linetype 3 linewidth 2.5
set key off

plot m w l

