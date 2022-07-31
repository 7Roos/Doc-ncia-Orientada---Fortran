program aula
implicit none
integer :: n, io
real :: y1, y0, t, y, delta_x

n = 0
open(unit=20, file='fallingtennisball02.d copy.txt')
do
        read(20,*, iostat=io) t, x
          if (io /= 0) exit
            x1 = x
            t1 = t
          if (i > 0) then
            delta_x = x1 - x0
            !print *, "x1-x0=", x1, "=", x0, "=", delta_x
            !delta_t = t1 - t0
            !vm = delta_x / delta_t
            !write(21,*) t, vm
          end if
          !v1 = vm
          !if (i > 1) then
            !delta_v = v1 - v0 
            !a = delta_v / delta_t
            !write(22,*) t, a
            !print *, a
          !end if
          !x0 = x1
          !t0 = t1
          !v0 = v1
          !i = i + 1
      end do
close(20)
!call system('gnuplot -p template.gnu')
end program