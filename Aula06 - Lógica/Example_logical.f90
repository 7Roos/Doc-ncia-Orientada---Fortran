program exLogical
!Para o exemplo 5
!integer :: i,j, k
logical :: vf

do
write(*,*) 'Escolha o exemplo'
read(*,*) Icase

SELECT CASE(Icase)
case(1)
!Exemplo 1 - Operações básicas com op. relacionais
print '(16X,A)', 'Exemplo 1 - Operações básicas com op. relacionais'
print *, '---------------------------------------------------------------------------'
print *, '3<2', 3<2, '3<5', 3<5
print *, '2==3', 2==3, 'A<B', 'A'<'B', 'C<B', 'C'<'B'

case(2)
!Exemplo 2 - Hierarquia dos op. relacionais
print '(16X,A)', 'Exemplo 2 - Hierarquia dos op. relacionais'
print *, '---------------------------------------------------------------------------'
print *, '5+2 < 3+8', 5+2 < 3+8
print *, '3+4 < 3+8', 3+4 < 3+8

case(3)
!Exemplo 3 - Conversão entre tipos diferentes ao relacioná-los
print '(12X,A)', 'Exemplo 3 - Conversão entre tipos diferentes ao relacioná-los'
print *, '---------------------------------------------------------------------------'
print *, '2.==2', 2.==2

case(4)
!Exemplo 4 - Op. combinacionais - triângulo retângulo
print '(16X,A)', 'Exemplo 4 - Op. combinacionais - triângulo retângulo'
print *, '---------------------------------------------------------------------------'

a = 3
b = 4
r = sqrt(a**2 + b**2)  !r=5
print *, "a=3, b=4, r=sqrt(a**2 + b**2)"
print *, 'Op. r>a .and. r>b =', r>a .and. r>b
print *, 'Op. r>a .or. r<b =', r>a .or. r<b
print *, 'Op. r<a .eqv. r<b=', r<a .eqv. r<b
print *, 'Op. r>a .neqv. r<b=', r>a .neqv. r<b
print *, 'Op. .not. r<b=', .not. r<b

case(5)
!Exemplo 5 - Trablhando com constantes lógicas
print '(16X,A)', 'Exemplo 5 - Trablhando com constantes lógicas'
print *, '---------------------------------------------------------------------------'

i = 2 
j = 3
k = 5
vf = i + j == k
print *, vf
if (vf .eqv. .true.) print *, 'verdadeiro'

case(6)
!Exemplo 6 - Contrutor IF, declaração EXIT e STOP
print '(16X,A)', 'Exemplo 6 - Contrutor IF, declaração EXIT e STOP'
print *, '---------------------------------------------------------------------------'

do j=1, 2
  do i=1, 4
    if (i == 3) then
      print *, i, 'Iterações abaixo do bloco'
    end if
  end do
  print *, j, "loop externo completado"
end do
print *, 'Abaixo dos dois loops'

case(7)
!Exemplo 7 - Cláusula ELSE e ELSE IF
print '(18X,A)', 'Exemplo 7 - Cláusula ELSE e ELSE IF'
print *, '---------------------------------------------------------------------------'

do i=1, 10
  if (mod(i,2) == 0) then
    print 10, "números pares", i
  else if (mod(i,3) == 0) then
    print 20, "num. ímpar mult. de 3", i
  else
    print 30, "demais números", i
  end if
!
  10 format(A14, 10X, I2)
  20 format(A22, 2X, I2)
  30 format(A15, 9X, I2)
end do

case(8)
!Exemplo 8 - Blocos nomeados
print '(18X,A)', 'Exemplo 8 - Blocos nomeados'
print *, '---------------------------------------------------------------------------'

IF (2 > 0) THEN
  PRINT *, "bloco 1"
  IF (3 > 0) THEN
    PRINT *, "bloco 2"
    IF (4 > 0) THEN
      PRINT *, "bloco 3"
    END IF 
  END IF
END IF

case(82)
teste1: IF (2 > 0) THEN
  PRINT *, "bloco 1"
  teste2: IF (3 > 0) THEN
    PRINT *, "bloco 2"
    teste3: IF (4 > 0) THEN
      PRINT *, "bloco 3"
    END IF teste3
  END IF teste2
END IF teste1

case(9)
!print *, .true. > .false.


case(10)
!!!!! IF ARITMÉTICO !!!!!!!!!!
!    IF (x-y) 10, 20, 30
!10  (executa se der negativo)
!    GO TO 100
!20  (executa se der zero)
!    GO TO 100
!30  (executa se der positivo)
!    GO TO 100
!100 CONTINUE

case(0)
  stop
END SELECT

end do
end program