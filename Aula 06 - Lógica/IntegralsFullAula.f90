program aula26
implicit none
real :: a, b, result
integer :: N, i, j, k , l, m 
character(len=20) :: formula
real :: funExact, retangulo
real, external :: fun

!Definimos os inputs
a = 0
b = 2
N = 128
formula = 'trapezio'

call integral (fun, a, b, N, formula, result)
print *, "Utilizando a fórmula", formula
print *, "Resultado", result, "Erro", ABS(funExact(a,b) - result)

end program

real function fun(x)
implicit none
real, intent(in) :: x 
!fun = 3.*x**2
fun = cos(2.*x)
end function

real function funExact(a,b)
implicit none
real, intent(in) :: a, b 
!funExact = b**3 - a**3
funExact = .5*(sin(2*b) - sin(2*a))
end function

!Basta dizer o método, que esta subrotina calcula
subroutine integral(fun, a, b, N, formula, result)
implicit none 
real, external :: fun 
real, intent(in) :: a, b
integer, intent(inOUT) :: N 
character(len=20), intent(in) :: formula
real, intent(out) :: result

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
real function retangulo(fun, a, b, N)
implicit none
real, external :: fun
real, intent(in) :: a, b
integer, intent(in) :: N
integer :: i
real :: sum, h, x

h = (b-a)/N
sum = fun(a)
!loop sobre pontos de rede
do i=1, N-1             
  x = a + i * h
  sum = sum + fun(x)
end do
retangulo = sum * h
end function

real function trapezoidal(fun, a, b, istep)
implicit none
real, external :: fun
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real :: sum, h, x

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

real function simpson1_3(fun, a, b, istep)
implicit none
real, external :: fun
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac
real :: sum, h, x

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

real function simpson3_8(fun, a, b, istep)
implicit none
real, external :: fun
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac, j
real :: sum, h, x

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

real function bode(fun, a, b, istep)
implicit none
real, external :: fun
real, intent(in) :: a, b
integer, intent(in) :: istep
integer :: N, i, fac, j
real :: sum, h, x

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

