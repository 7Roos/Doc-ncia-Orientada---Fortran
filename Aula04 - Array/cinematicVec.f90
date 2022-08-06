program vetorizando
implicit none
integer :: ifalling, io, i
real :: space, time
real, dimension(1428) :: x, t, delta_x, delta_t, vm, delta_v, am

open(unit=20, file='function_y.dat', status='old', action='read', iostat=ifalling)
open(unit=21, file='velocity.dat', iostat=ifalling)
open(unit=22, file='acceleration.dat', iostat=ifalling)

if (ifalling /= 0) then
  write(*,*) 'Erro ao abrir arquivo function_y.txt. Ele deve existir para ser aberto!'
else
  do i=1, 1428
    read(20,*, iostat=io) time, space
    if (io /= 0) exit
    x(i) = space 
    t(i) = time
    if (i > 1) then
      delta_t(i) = t(i) - t(i-1)
      delta_x(i) = x(i) - x(i-1)
      vm(i) = delta_x(i) / delta_t(i)
      write(21,*) t(i), vm(i)
    end if
    if (i > 2) then
      delta_v(i) = vm(i) - vm(i-1)
      am(i) = delta_v(i) / delta_t(i)
      write(22,*) t(i), am(i)
    end if
  end do
end if

close(20)
close(21)
close(22)
call system('gnuplot -p template.gnu')
end program