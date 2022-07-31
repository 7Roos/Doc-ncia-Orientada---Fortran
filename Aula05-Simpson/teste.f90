program estability_integral_dp
implicit none
integer, parameter :: dp = selected_real_kind(8)
real(kind=dp) :: a, b, x, Erro_bode 
real(kind=dp) ::  bode
integer :: N, i
 
a = 0.             
b = 1.
N = 12

open(unit=40, file='IntBode.dat')
do i=4, N
  Erro_bode = bode(a, b, i)
end do
close(40)

end program

real(kind=8) function fun(x)
implicit none 
real(kind=8), intent(in) :: x 
fun = cos(2.*x)
!fun = exp(2.*x)
!fun = log(2.*x)
!fun = 1.
end function
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
real(kind=8) function funExact(a, b)
implicit none 
real(kind=8), intent(in) :: a, b
funExact = .5*(sin(2.*b) - sin(2.*a))
!funExact = .5*(exp(2.*b) - exp(2.*a))
!funExact = (b*(log(2.) + log(b)- 1.)) - (a*(log(2.) + log(a)- 1.))
!funExact = b - a
end function

real(kind=8) function bode(a, b, istep)
implicit none
real(kind=8), external :: fun, funExact
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, j, fac
real(kind=8) :: sum, h, x, Erro_bode

N = istep
if ( N < 4 ) stop 
do while (mod(N,4) /= 0)
  N = N + 1
end do 
h = (b-a)/N
sum = 7*fun(a)          !contribuição de X=0 (valor inferior da integral)
fac = 32
j = 1                 !fator para a regra do trapézio
print *, "ori", sum
do i=1, N-1             !loop sobre pontos de rede
  if (mod(j,2) == 0) then
      fac = 12
      j = j + 1
  else
    fac = 32
    j = j + 1
  end if
  if (j == 4) j = 1
  x = a + i * h
  sum = sum + fac * fun(x)
  print *, N, sum, h
end do
sum = sum + 7 * fun(b)    !contribuição de X=2 (valor superior da integral)
bode = sum * h * (2./ 45.)
Erro_bode = funExact(a, b) - bode
write(40,*) N, ABS(Erro_bode), bode
end function