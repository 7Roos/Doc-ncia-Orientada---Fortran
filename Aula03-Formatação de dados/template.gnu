reset
set terminal pngcairo dashed enhanced size 480,360 font 'arial,12' fontscale 1.0
set encoding utf8
set output 'figure3.png'
set xlabel "t[s]"
set ylabel "a[m/s^2]"
m = "./fallingtennisball02.d.txt"
n = "./velocity.txt"
o= "./acceleration.txt"
set title 'Corpo em queda livre'
set key off
plot o using 1:2 w l 

