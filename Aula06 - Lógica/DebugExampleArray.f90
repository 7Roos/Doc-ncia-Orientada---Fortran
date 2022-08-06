program example
implicit none
!Declaramos as constantes:
integer, parameter :: max_size = 4
!Declaração das variáveis:
integer, dimension(max_size) :: teste
integer :: i, j

! EXEMPLO 1 - Método 2003
!teste = [1,2,3,4]
!print *, teste
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! EXEMPLO 2 - Índices da lista
!teste = [1,2,3,4]
!print *, "i=1", teste(1), "i=3", teste(3)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!Exemplo 3 - Alterando valores da lista
!real, real :: resto
!teste = [1,2,3,4]
!print *, "lista original=",teste
!teste(1) = 0
!print *, "alterando primeiro valor da lista", teste
!resto = mod(teste(2), 2)
!if (resto ==0) then
!print *, "o segundo elem. é par"
!end if

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! Exemplo 4 - Estudando a formatação de saída
!Passando uma string e salta hor
!print 20, "Este", "é um", "exemplo com formatação"
!20 format (3x, a, 2x, a, 5x, a)
!print *, "Este ", "é um ", "exemplo SEM formatação"
!print 25, "IIIIIIIIIIIIIIIIIIIIIIII"
!25 format (a)

!Dupla precisão
!real :: const
!const = 3.d0
!print *, const
!print 30, const
!30 format (D10.4)
!print *, "2II5IIII10III15III20III25III30"

!Formato ponto fixo
!print 35, const
!35 format (F10.4)
!print *, "2II5IIII10III15III20III25III30"

!Número inteiro salto vertical
!print 40, 1, 2, 3, 4
!40 format (I1, I2, 1/, I3, I1)
!print *, "2II5IIII10III15III20III25III30"

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! EXEMPLO 5 - Formatação de saída (melhorando o caso anterior)
!teste = [1,2,3,4]
!print 5, "lista =>", teste
!5 format (1x, A, I3, I3, I3, I3)
!print 10, "i=1  =>", teste(1), "i=3  =>", !teste(3)
!10 format (1x, A, I3, 5X, A, I3)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!Exemplo 6 - Loop DO implícito
!write(*,*) (i, i = 1, max_size)

!teste = [1,0,3,4]

!write(*,*) (teste(i), i = 1, 2)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!Exemplo 7 - Loop DO implícito aninhado (caso simples)
!write(*,40) ((i,j, j=1,3), i=1, max_size)
!40 format (I2, I2)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!Exemplo 8 - Loop DO implícito aninhado (Ângulo de um vetor)
! Encontre os ângulos para os pontos 
!(1,1), (-1,1), (-1,-1), (1,-1)

!theta = atan(y/x)

!Solução
!Definimos
real, parameter :: degree = 180. / 3.1415
real, dimension(max_size) :: x, y
!real :: angle

x = [1, -1, -1, 1]
y = [1, 1, -1, -1]
write(*,*) (atan(y(i) / x(i))*degree, i=1, max_size)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!Exemplo 9 - Loop implícito vs explícito
!teste = [1, 2, 3, 4]
!print *, "Loop padrão"
!do i=1,3
!  write(*,*) teste(i), 2.*teste(i)
!end do

!print *, "Loop implícito"
!write(*,*) (teste(i), 2.*teste(i), i=1,3)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!Exemplo 10 - Seção de array
!teste = [1, 2, 3, 4]
!print *, teste(2::2)
!print *, teste(1::2)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!Exemplo 11 - Passo num array
!integer :: data1(10)
!data1 = 0
!data1(2:10:1) = 1000
!print *, data1
!write(*,10) (i, i=10, 1, -1)
!write(*,20) (i, i=10, 1, -1)
!10 format (12(I2))
!20 format (10(I5))

end program


