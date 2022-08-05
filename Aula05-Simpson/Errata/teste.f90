program estability_integral_dp
implicit none
integer, parameter :: dp = selected_real_kind(8)
real(kind=dp) :: a, b, x, Erro_bode 
real(kind=dp) ::  bode
integer :: N
 
a = 1.5             
b = 3.
N = 16

open(unit=40, file='IntBode.dat')
Erro_bode = bode(a, b, N)
close(40)

!call system('gnuplot -p template.gnu')
end program

real(kind=8) function fun(x)
implicit none 
real(kind=8), intent(in) :: x 
!fun = cos(2.*x)
!fun = exp(2.*x)
!fun = log(2.*x)
fun = 1.
end function
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
real(kind=8) function funExact(a, b)
implicit none 
real(kind=8), intent(in) :: a, b
!funExact = .5*(sin(2.*b) - sin(2.*a))
!funExact = .5*(exp(2.*b) - exp(2.*a))
!funExact = (b*(log(2.) + log(b)- 1.)) - (a*(log(2.) + log(a)- 1.))
funExact = b - a
end function

real(kind=8) function bode(a, b, N)
implicit none
real(kind=8), external :: fun, funExact
real(kind=8), intent(in) :: a, b
integer, intent(in) :: N
integer :: n_pontos, i, j, fac, n_step
real(kind=8) :: sum, h, x, Erro_bode

do n_pontos=5, N, 4
  h = (b-a)/n_pontos
  sum = 7 * fun(a)          !contribuição de X=0 (valor inferior da integral)
  j = 0                 !fator para a regra do trapézio
  print *, n_pontos
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
    print *, "j", j, "fac", fac
  end do
sum = sum + 7 * fun(b)    !contribuição de X=2 (valor superior da integral)
bode = sum * h * (2./ 45.)
Erro_bode = funExact(a, b) - bode
write(40,*) n_pontos, ABS(Erro_bode), bode
end do
end function