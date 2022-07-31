program integrationSimpson
!func(x) = 2. - 2.*(x**2)      !Função a ser integrada
func(x) = 2*cos(0.5 + 0.1*x)
! Intervalo de 0 a 1.
a = 0.                 
b = 2.55
!exact = (2.*(b) - 2.*(b**3)/3.) - (2.*(a) - 2.*(a**3)/3.)  !Resultado analítico
exact = (2./0.1)*(sin(0.5 + 0.1*b) - sin(0.5 + 0.1*a))
do
  print *, 'Entre com o valor do números de passos (N<2 stop)'
  read *, N
  if ( N < 2 ) stop 
  if (mod(N,2) /= 0) N = N + 1  ! Mod resto da divisão por 2, pois teremos que ir de 2 em 2, como nas outras regras.
  h = (b-a) / N
  sum = func(a)          !contribuição de X=0 (limite inferior da integral)
  ifac = 2               !fator i*h par para a regra de Simpson 1/3
  do i=1, N-1            !loop sobre pontos de rede
    if (ifac == 2) then  !Alternância dos fatores 2 e 4
      ifac = 4           !fator i*h ímpar para a regra de Simpson 1/3
    else
      ifac = 2
    end if
    x = i * h
    sum = sum + ifac * func(x)
    !print *, ifac
  end do
  sum = sum + func(b)    !contribuição de X=1 (limite superior da integral)
  xint = sum * h / 3.     !integral numérica
  diff = exact - xint
  print 20, xint, diff
  20 format(5x, 'Resultado = ', E15.8, 5X, 'ERRO = ', E15.8) 
end do
end program integrationSimpson

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
write(20,*) N, ABS(Erro_simpson1_3)
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