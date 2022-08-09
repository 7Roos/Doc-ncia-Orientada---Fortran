program aula7
!Importamos o módulo que contém todos os procedimentos para realizar os cálculos numéricos
use calcNum
implicit none
real, external :: f
character(len=40) :: option, output
real :: x, result
integer :: io, erro

do
write(*,*) 'Digite a operação desejada (0 stop)'
read(*,*) option

select case (option)
case('plot')
  call plot(f, output, io)
  write(*,*) '------------------------------------------------'
  write(*,11) 'Procedimento com ', io, 'erros'
  print *, output
  write(*,*) '------------------------------------------------'

case('derivada')
  call derivative(f,result, erro)
  write(*,*) '------------------------------------------------'
  write(*,11) 'Procedimento com ', erro, 'erro'
  write(*,12) 'Resultado = ', result
  write(*,*) '------------------------------------------------'

case('0')
  stop

case default
  print *, 'Opção selecionada inválida! As opções válidas são:'
  write(*,13) '1.','plot', '=> cria um gráfico'
  write(*,13) '2.', 'derivada', '=> calcula a deriva p/um ponto a ser informado'
end select
!Formatação de saída dos resultados
11 format (13x, A, I1, 1X, A)
12 format(1X, A, F11.8)
13 format(1X, A, 3x, A6, 6X, A)

end do
end program

real function f(x)
implicit none
real, intent(in) :: x
f = x**2
end function

