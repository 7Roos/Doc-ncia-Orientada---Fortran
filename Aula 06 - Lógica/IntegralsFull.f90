program aula26
implicit none
integer, parameter :: dp = selected_real_kind(8)
real(kind=dp) :: a, b, result
integer :: N, i, j, k , l, m 
character(len=20) :: formula
real(kind=dp) :: funExact, retangulo
real(kind=dp), external :: fun

!Definimosos os inputs
a = 1.5
b = 3
N = 128
!formula = 'bode'

!call integral (fun, a, b, N, formula, result)
!print *, formula
!print *, "Resultado", result, "Erro", ABS(funExact(a,b) - result)

open(unit=9, file='IntRetangulo.dat')
open(unit=10, file='IntTrapezoidal.dat')
open(unit=20, file='IntSimpson1_3.dat')
open(unit=30, file='IntSimpson3_8.dat')
open(unit=40, file='IntBode.dat')

do i=4, N
  formula = 'retangulo'
  call integral (fun, a, b, i, formula, result)
  write(9,*) i, ABS(funExact(a,b) - result), result
end do
do j=4, N, 2
  formula = 'trapezio'
  call integral (fun, a, b, j, formula, result)
  write(10,*) j, ABS(funExact(a,b) - result), result
end do
do k=4, N, 2
  formula = 'simpson'
  call integral (fun, a, b, k, formula, result)
  write(20,*) k, ABS(funExact(a,b) - result), result
end do
do l=4, N, 3
  formula = 'simpson3_8'
  call integral (fun, a, b, l, formula, result)
  write(30,*) l, ABS(funExact(a,b) - result), result
end do
do m=4, N, 4
  formula = 'bode'
  call integral (fun, a, b, m, formula, result)
  write(40,*) m, ABS(funExact(a,b) - result), result
end do

close(9)
close(10)
close(20)
close(30)
close(40)

call system('gnuplot -p template.gnu')

end program

real(kind=8) function fun(x)
implicit none
real(kind=8), intent(in) :: x 
fun = 3.*x**2
!fun = cos(2.*x)
!fun = exp(2.*x)
!fun = log(2.*x)
end function

real(kind=8) function funExact(a,b)
implicit none
real(kind=8), intent(in) :: a, b 
funExact = b**3 - a**3
!funExact = .5*(sin(2*b) - sin(2*a))
!funExact = .5*(exp(2.*b) - exp(2.*a))
!funExact = b*(log(2.*b) - 1.) - a*(log(2.*a) - 1.)
end function

!Basta dizer o método, que esta subrotina calcula
subroutine integral(fun, a, b, N, formula, result)
implicit none 
real(kind=8), external :: fun 
real(kind=8), intent(in) :: a, b
integer, intent(inOUT) :: N 
character(len=20), intent(in) :: formula
real(kind=8), intent(out) :: result

!Selecionamos os métodos
SELECT CASE(formula)
CASE('retangulo')
  result = retangulo(fun, a, b, N)
CASE('trapezio')
  result = trapezoidal(fun, a, b, N)
CASE('simpson')
  result = simpson1_3(fun, a, b, N)
CASE('simpson3_8')
  result = simpson3_8(fun, a, b, N)
CASE('bode')
  result = bode(fun, a, b, N)
CASE DEFAULT
  write(*,*) "Escreva um método válido"
END SELECT

contains
!Compilamos os diferentes métodos dentro de funções
real(kind=8) function retangulo(fun, a, b, N)
implicit none
real(kind=8), external :: fun
real(kind=8), intent(in) :: a, b
integer, intent(in) :: N
integer :: i
real(kind=8) :: sum, h, x

h = (b-a)/N
sum = fun(a)
!loop sobre pontos de rede
do i=1, N-1             
  x = a + i * h
  sum = sum + fun(x)
end do
retangulo = sum * h
end function

real(kind=8) function trapezoidal(fun, a, b, istep)
implicit none
real(kind=8), external :: fun
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real(kind=8) :: sum, h, x

N = istep
do while (mod(N,2) /= 0)
  N = N + 1
end do 
h = (b-a)/N
!contribuição do valor inicial da integral
sum = fun(a)      
!fator para a regra do trapézio    
fac = 2        
!loop sobre pontos de rede         
do i=1, N-1             
  x = a + i * h
  sum = sum + fac * fun(x)
end do
!contribuição do valor final da integral
sum = sum + fun(b)    
trapezoidal = sum * h / 2.
end function

real(kind=8) function simpson1_3(fun, a, b, istep)
implicit none
real(kind=8), external :: fun
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real(kind=8) :: sum, h, x

N = istep
do while (mod(N,2) /= 0)
  N = N + 1
end do 
h = (b-a)/N
!Contribuição inicial
sum = fun(a)   
!fator para a regra do trapézio       
fac = 2        
!Alternância dos fatores 2 e 4        
do i=1, N-1            
  if (fac == 2) then   
    fac = 4
  else
    fac = 2
  end if
  x = a + i * h
  sum = sum + fac * fun(x)
end do
!contribuição final
sum = sum + fun(b)    
simpson1_3 = sum * h / 3.
end function

real(kind=8) function simpson3_8(fun, a, b, istep)
implicit none
real(kind=8), external :: fun
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac, j
real(kind=8) :: sum, h, x

N = istep
do while (mod(N,3) /= 0)
  N = N + 1
end do 
h = (b-a)/N
sum = fun(a)                     
do i=1, N-1           
  if (mod(i,3) == 0) then   
    fac = 2
  else
    fac = 3
  end if
  x = a + i * h
  sum = sum + fac * fun(x)
end do
sum = sum + fun(b)    
simpson3_8 = sum * h * (3./ 8.)
end function

real(kind=8) function bode(fun, a, b, istep)
implicit none
real(kind=8), external :: fun
real(kind=8), intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac, j
real(kind=8) :: sum, h, x

N = istep
if ( N < 4 ) stop 
do while (mod(N,4) /= 0)
  N = N + 1
end do 
h = (b-a)/N
sum = 7*fun(a)          
fac = 32
J = 1                
do i=1, N-1           
  if (j == 1 .OR. j == 3) then   !Alternância dos fatores 2 e 3
    fac = 32
    j = j + 1
  else if (j == 2) then
    fac = 12
    j = j + 1
  else
    fac = 14
    j = 1
  end if
  x = a + i * h
  sum = sum + fac * fun(x)
end do
sum = sum + 7 * fun(b)    !contribuição de X=2 (valor superior da integral)
bode = sum * h * (2./ 45.)
end function
end subroutine

