program gerador
implicit none
real :: t, y, r, fun, teoria, theory, dy
integer :: i, n

open(unit=26, file='function_y.dat')
i = 1
t = 0
write(26,*) t, fun(t)

do while(fun(t) >= .01)
  t = t + .01
  y = fun(t)
  dy = 10.**(-5)
  call random_number(r)
  if (r < .9 .and. t >= .1) then 
    y = y - dy
  else
    y = y + dy/2.
  end if

  if(fun(t) >= 0.01) then
    write(26,*) t, y
  end if
  i = i + 1
enddo
close(26)

call system('gnuplot -p template.gnu')
end program

real function fun(time)
implicit none
real, intent(in) :: time
real :: g, v0, y0

y0 = 10.
v0 = 0
g = 9.81
fun = y0 + v0*time - .5*g*(time**2)
end function