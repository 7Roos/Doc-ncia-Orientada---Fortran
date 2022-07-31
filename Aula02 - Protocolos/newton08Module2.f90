program NewtonModule
   use rootNewton
   implicit none
   real :: guess, root, plot, fun_plot, range
   real, external :: fun
   guess = 3

   call newton(fun, guess, root)
   write(*,*) 'A raiz é', root

   !!!!!!! GRÁFICO !!!!!!!!!
    range = 10.0
    plot = fun_plot(fun, range)
end program

real function fun(x)
   implicit none
   real, intent(in) :: x
   fun = x*x-4
end function

!!!!!!! GRÁFICO !!!!!!!!!
real function fun_plot(fun, range)
implicit none
real, external :: fun
real, intent(in) :: range
real :: min, max, delx, x
integer :: ix, nx
open(unit=26, file='function1.dat')
max = range
min = -range
nx = 500 !num de pontos
delx = (max-min)/dfloat(nx-1)

do ix= 1,nx 
    x = min + dfloat(ix-1)*delx
write(26,*) x, fun(x)
enddo

close(26)
call system('gnuplot -p template_root.gnu')

return
end
