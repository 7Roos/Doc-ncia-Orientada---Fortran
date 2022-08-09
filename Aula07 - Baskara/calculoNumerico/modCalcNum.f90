module calcNum
implicit none

contains

subroutine plot(f, output, io)
implicit none
real, external :: f 
character(len=40), intent(out) :: output
integer, intent(out) :: io
integer :: nPontos, i
real :: min, max, dx, x

write(*,*) 'Valor inicial, final, num_pontos:'
read(*,*) min, max, nPontos

dx = (max - min) / float(nPontos - 1)

open(unit=10, file='plot.dat', iostat=io)
do i=1, nPontos
  x = min + dfloat(i - 1) * dx
  write(10,*) x, f(x)
end do
close(10)

call system('gnuplot -p template.gnu')
output = 'Plot -> graph.png  |  Dados -> plot.dat'
end subroutine

subroutine derivative(f, result, erro)
implicit none
real, external :: f 
real, intent(out) :: result 
integer, intent(out) :: erro
real :: x, h 
erro = 1
h = 10E-2

write(*,*) 'Derivar em qual ponto?'
read(*,*) x

result = ( f(x + h) - f(x - h) ) / (2*h)
erro = 0
end subroutine

end module