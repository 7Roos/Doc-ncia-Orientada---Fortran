program root
    !Método de Newton-Raphson
    implicit real (a-h,o-z)
    integer step, nx, ix
    external fun, fun_prime, fun_plot

    !!!!!!! GRÁFICO !!!!!!!!!
    range = 10.d0
    plot = fun_plot(range)

    !!!!!!! Médoto !!!!!!!!!
    x0 = 2.d0           !CHUTE INICIAL
    tol = 1.0E-06
    step = 0
    do while(ABS(fun(x0)) >= tol)
    x = x0 - (fun(x0))/(fun_prime(x0))
    func = fun(x)
    step = step + 1
    write(*,*) 'Passo=>', step, 'x=', x, 'fun(x)=', func
    x0=x
    if (step>10) stop "não deu!"
    end do
    return
end program 

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

real function fun(x)
fun = exp(x) - x - 2
return
end

!!!!!!! GRÁFICO !!!!!!!!!
real function fun_plot(range)
real min, max, delx, range
open(unit=26, file='function1.dat')
open(unit=27, file='retax.dat')   !reta x
max = range
min = -range
print *, max
nx = 500 !num de pontos
delx = (max-min)/dfloat(nx-1)

do ix= 1,nx 
    x = min + dfloat(ix-1)*delx
write(26,*) x, fun(x)
write(27,*) x, 0.d0
enddo

close(26)
close(27)
call system('gnuplot -p template_root.gnu')

return
end

real function fun_prime(x)
real h
h=1.0E-06
print *, h
fun_prime = (fun(x+h) - fun(x-h))/(2*h)
return
end

!!!!!!!!!!!!!!!!!1
!module subs
!  implicit none
!contains
!  integer function test(n)
!    !implicit none no longer necessary here
!  end function test
!end module

!program main
!  use subs
!  implicit none