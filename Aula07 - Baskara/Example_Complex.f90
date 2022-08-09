program exComplex
implicit none
integer :: Icase 
complex :: c 
real :: a, b

do
write(*,*) 'Escolha o exemplo (0 stop)'
read(*,*) Icase

a = 1.
b = 1.5

SELECT CASE(Icase)
case(15)
  !Exemplo 15 - Convertendo para um número complexo
  print '(16X,A)', 'Exemplo 15 - Convertendo para um número complexo'
  print *, '---------------------------------------------------------------------------'

  c = cmplx(a, b)
  print *, 'cmplx(1,1.5)=', 'c=', c

case (16)
  !Exemplo 16 - Absoluto de um num. complexo
  print '(16X,A)', 'Exemplo 16 - Absoluto de um num. complexo'
  print *, '---------------------------------------------------------------------------'

  c = cmplx(a, b)
  print *, 'cabs(c)=', cabs(c), 'sqrt(a**2+b**2)=', sqrt(a**2 + b**2)

case(17)
  !Exemplo 17 - Separando a parte real da imaginária
  print '(16X,A)', 'Exemplo 17 - Separando a parte real da imaginária'
  print *, '---------------------------------------------------------------------------'

  c = cmplx(a, b)
  print *, 'c=', c, 'é um num. complexo'
  print *, 'cuja parte real é', real(c), 'e a parte imaginária é', aimag(c)
case(0)
  stop
END SELECT

end do

end program