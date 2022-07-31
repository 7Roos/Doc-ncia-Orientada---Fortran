program formatacao
implicit none
real :: t, x, x1, x0, delta_x, vm, t1, t0, delta_t, v1, v0, a, delta_v
integer :: n, io, i, ifalling, ivel, iacel
i=0
!Velocidade média
open(unit=20, file='fallingtennisball02.d.txt', status='old', action='read', iostat=ifalling)
open(unit=21, file='velocity.txt', iostat=ifalling)
open(unit=22, file='acceleration.txt', iostat=ifalling)
if (ifalling /= 0) then
  write(*,*) 'Erro ao abrir arquivo fallingtennisball02.d.txt, ele deve existir para ser aberto'
else
  do
    read(20,*, iostat=io) t, x
    if (io /= 0) exit
    x1 = x
    t1 = t
    if (i > 0) then
      delta_x = x1 - x0
      delta_t = t1 - t0
      vm = delta_x / delta_t
      write(21,*) t, vm
    end if
    v1 = vm
    if (i > 1) then
      delta_v = v1 - v0 
      a = delta_v / delta_t
      write(22,*) t, a
    end if
    x0 = x1
    t0 = t1
    v0 = v1
    i = i + 1
  end do
end if

close(20)
close(21)
close(22)
call system('gnuplot -p template.gnu')
end program