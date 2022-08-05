program estability_integral
implicit none
real :: a, b, x, Erro_retangulo, Erro_trapezoidal, Erro_simpson1_3, Erro_simpson3_8, Erro_bode
integer :: N, i
real ::  retangulo, trapezoidal, simpson1_3, simpson3_8, bode

a = 1.5              
b = 3.
N = 128

open(unit=9, file='IntRetangulo.dat')
open(unit=10, file='IntTrapezoidal.dat')
open(unit=20, file='IntSimpson1_3.dat')
open(unit=30, file='IntSimpson3_8.dat')
open(unit=40, file='IntBode.dat')

do i=4, N
  Erro_retangulo = retangulo(a, b, i)
  Erro_trapezoidal = trapezoidal(a, b, i)
  Erro_simpson1_3 = simpson1_3(a, b, i)
  Erro_simpson3_8 = simpson3_8(a, b, i)
  Erro_bode = bode(a, b, i)
end do

close(9)
close(10)
close(20)
close(30)
close(40)

call system('gnuplot -p template.gnu')
end program

real function fun(x)
implicit none 
real, intent(in) :: x 
real ::g, v_t
!fun = 2*cos(0.5 + 0.1*x)
!g = 9.81
!v_t = (5.*10.**(-7)*g/(1.85*10.**(-7)))
!fun = g*exp(-g*x/v_t)
fun = 3.*x**2
end function

real function funExact(a, b)
implicit none 
real, intent(in) :: a, b
real ::g, v_t
!funExact = (2./0.1)*(sin(0.5 + 0.1*b) - sin(0.5 + 0.1*a))
!g = 9.81
!v_t = (5.*10.**(-7)*g/(1.85*10.**(-7)))
!funExact = v_t*((exp(-g*b/v_t) - 1.) - (exp(-g*a/v_t) - 1))
funexact = b**3 - a**3
end function

real function retangulo(a, b, istep)
implicit none
real, external :: fun, funExact
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real :: sum, h, x, Erro_retangulo

N = istep
if ( N < 2 ) stop
h = (b-a)/N
x = 0
sum = 0
do i=1, N-1             !loop sobre pontos de rede
  x = a + i * h
  sum = sum + fun(x)
end do
retangulo = sum * h
Erro_retangulo = funExact(a, b) - retangulo
write(9,*) N, ABS(Erro_retangulo)
end function

real function trapezoidal(a, b, istep)
implicit none
real, external :: fun, funExact
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real :: sum, h, x, Erro_trapezoidal

N = istep
if ( N < 2 ) stop
if (mod(N,2) .NE. 0) N = N + 1
h = (b-a)/N
sum = fun(a)          !contribuição de X=0 (valor inferior da integral)
fac = 2                 !fator para a regra do trapézio
do i=1, N-1             !loop sobre pontos de rede
  x = a + i * h
  sum = sum + fac * fun(x)
end do
sum = sum + fun(b)    !contribuição de X=2 (valor superior da integral)
trapezoidal = sum * h / 2.
Erro_trapezoidal = funExact(a, b) - trapezoidal
write(10,*) N, ABS(Erro_trapezoidal)
end function

real function simpson1_3(a, b, istep)
implicit none
real, external :: fun, funExact
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real :: sum, h, x, Erro_simpson1_3

N = istep
if ( N < 2 ) stop 
if (mod(N,2) /= 0) N = N + 1
h = (b-a)/N
sum = fun(a)          !contribuição de X=0 (valor inferior da integral)
fac = 2                 !fator para a regra do trapézio
do i=1, N-1             !loop sobre pontos de rede
  if (fac == 2) then   !Alternância dos fatores 2 e 4
    fac = 4
  else
    fac = 2
  end if
  x = a + i * h
  sum = sum + fac * fun(x)
end do
sum = sum + fun(b)    !contribuição de X=2 (valor superior da integral)
simpson1_3 = sum * h / 3.
Erro_simpson1_3 = funExact(a, b) - simpson1_3
write(20,*) N, ABS(Erro_simpson1_3), simpson1_3
end function

real function simpson3_8(a, b, istep)
implicit none
real, external :: fun, funExact
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac, j
real :: sum, h, x, Erro_simpson3_8

N = istep
if ( N < 3 ) stop 
do while (mod(N,3) /= 0)
  N = N + 1
end do 
h = (b-a)/N
sum = fun(a)          !contribuição de X=0 (valor inferior da integral)
fac = 3
J = 1                 !fator para a regra do trapézio
do i=1, N-1             !loop sobre pontos de rede
  if (j < 3) then   !Alternância dos fatores 2 e 3
    fac = 3.
    j = j + 1
  else
    fac = 2.
    j = 1
  end if
  x = a + i * h
  sum = sum + fac * fun(x)
end do
sum = sum + fun(b)    !contribuição de X=2 (valor superior da integral)
simpson3_8 = sum * h * (3./ 8.)
Erro_simpson3_8 = funExact(a, b) - simpson3_8
write(30,*) N, ABS(Erro_simpson3_8)
end function

real function bode(a, b, istep)
implicit none
real, external :: fun, funExact
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac, j
real :: sum, h, x, Erro_bode

N = istep
if ( N < 4 ) stop 
do while (mod(N,4) /= 0)
  N = N + 1
end do 
h = (b-a)/N
sum = 7.*fun(a)          !contribuição de X=0 (valor inferior da integral)
fac = 32
J = 1                 !fator para a regra do trapézio
do i=1, N-1             !loop sobre pontos de rede
  if (j == 1 .OR. j == 3) then   !Alternância dos fatores 2 e 3
    fac = 32
    j = j + 1
  else
    if (j == 2) then
      fac = 12
      j = j + 1
    else
      fac = 14
      j = 1
    end if
  end if
  x = a + i * h
  sum = sum + fac * fun(x)
end do
sum = sum + 7. * fun(b)    !contribuição de X=2 (valor superior da integral)
bode = sum * h * (2./ 45.)
Erro_bode = funExact(a, b) - bode
write(40,*) N, ABS(Erro_bode)
end function