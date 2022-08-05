program estability_integral_dp
implicit none
integer, parameter :: dp = selected_real_kind(8)
real(kind=dp) :: a, b, x, Erro_retangulo, Erro_trapezoidal, Erro_simpson1_3, Erro_simpson3_8, Erro_bode 
real(kind=dp) ::  retangulo, trapezoidal, simpson1_3, simpson3_8, bode
integer :: N, i
 
a = 1.5             
b = 3.
N = 128

open(unit=9, file='IntRetangulo.dat')
open(unit=10, file='IntTrapezoidal.dat')
open(unit=20, file='IntSimpson1_3.dat')
!open(unit=30, file='IntSimpson3_8.dat')
!open(unit=40, file='IntBode.dat')

do i=4, N
  Erro_retangulo = retangulo(a, b, i)
  Erro_trapezoidal = trapezoidal(a, b, i)
  Erro_simpson1_3 = simpson1_3(a, b, i)
  !Erro_simpson3_8 = simpson3_8(a, b, i)
end do
!Erro_bode = bode(a, b, N)

close(9)
close(10)
close(20)
!close(30)
!close(40)

call system('gnuplot -p template.gnu')
end program
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
real(kind=8) function fun(x)
implicit none 
real(kind=8), intent(in) :: x 
!fun = cos(2.*x)
!fun = exp(2.*x)
!fun = log(2.*x)
fun = 3.*x**2
end function
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
real(kind=8) function funExact(a, b)
implicit none 
real(kind=8), intent(in) :: a, b
!funExact = .5*(sin(2.*b) - sin(2.*a))
!funExact = .5*(exp(2.*b) - exp(2.*a))
!funExact = (b*(log(2.) + log(b)- 1.)) - (a*(log(2.) + log(a)- 1.))
funExact = b**3 - a**3
end function
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
real(kind=8) function retangulo(a, b, istep)
implicit none
real(kind=8), external :: fun, funExact
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real(kind=8) :: sum, h, x, Erro_retangulo

N = istep
if ( N < 2 ) stop
h = (b-a)/N
sum = fun(a)
do i=1, N-1             !loop sobre pontos de rede
  x = a + i * h
  sum = sum + fun(x)
end do
retangulo = sum * h
Erro_retangulo = funExact(a, b) - retangulo
write(9,*) N, ABS(Erro_retangulo), retangulo
end function
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
real(kind=8) function trapezoidal(a, b, istep)
implicit none
real(kind=8), external :: fun, funExact
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real(kind=8) :: sum, h, x, Erro_trapezoidal

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
write(10,*) N, ABS(Erro_trapezoidal), trapezoidal
end function
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
real(kind=8) function simpson1_3(a, b, istep)
implicit none
real(kind=8), external :: fun, funExact
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real(kind=8) :: sum, h, x, Erro_simpson1_3

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
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
real(kind=8) function simpson3_8(a, b, istep)
implicit none
real(kind=8), external :: fun, funExact
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real(kind=8) :: sum, h, x, Erro_simpson3_8

N = istep
if ( N < 3 ) stop 
do while (mod(N,3) /= 0)
  N = N + 1
end do 
h = (b-a)/N
sum = fun(a)          !contribuição de X=0 (valor inferior da                     !fator para a regra do trapézio
do i=1, N-1             !loop sobre pontos de rede
  fac = 3
  if (mod(i,3) == 0) fac = 2   !Alternância dos fatores 2 e 3
  x = a + i * h
  sum = sum + fac * fun(x)
end do
sum = sum + fun(b)    !contribuição de X=2 (valor superior da integral)
simpson3_8 = sum * h * (3./ 8.)
Erro_simpson3_8 = funExact(a, b) - simpson3_8
write(30,*) N, ABS(Erro_simpson3_8), simpson3_8
end function

real(kind=8) function bode(a, b, N)
implicit none
real(kind=8), external :: fun, funExact
real(kind=8), intent(in) :: a, b
integer, intent(in) :: N
integer :: n_pontos, i, j, fac, n_step
real(kind=8) :: sum, h, x, Erro_bode

do n_pontos=4, N, 4
  h = (b-a)/n_pontos
  sum = 7 * fun(a)          !contribuição de X=0 (valor inferior da integral)
  j = 0                 !fator para a regra do trapézio
  do i=1, n_pontos-1             !loop sobre pontos de rede
    j = j + 1
    if (j == 1 .OR. j == 3) then
      fac = 32 
    else if (j == 2) then
      fac = 12
    else if (j == 4) then
      fac = 14
    else 
      j = 1
      fac = 32
    end if
    x = a + (i * h)
    sum = sum + fac * fun(x)
  end do
sum = sum + 7 * fun(b)    !contribuição de X=2 (valor superior da integral)
bode = sum * h * (2./ 45.)
Erro_bode = funExact(a, b) - bode
write(40,*) n_pontos, ABS(Erro_bode), bode
end do
end function