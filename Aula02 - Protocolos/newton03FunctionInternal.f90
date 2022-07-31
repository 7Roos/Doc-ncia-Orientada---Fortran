program NewtonFunctionInternal
   !Seção declaração
   implicit none
   real :: tol, x0, x1
   integer :: step

   tol = 1.E-06
   x0 = 3
   step = 0

   !Seção execução
   do while(abs(fun(x0)) >= tol)
      x1 = x0 - fun(x0) / Fprime(x0)
      write(*,*) 'Iteração=>', step, 'x0=', x0, 'Fun(x0)=', fun(x1)
      x0 = x1
      step = step + 1
   end do

!Procedimento interno:
contains
   real function fun(x)
      implicit none
      real, intent(in) :: x
      fun = x*x-4
   end function

   real function Fprime(x)
      implicit none
      real, intent(in) :: x
      real :: h
      h = 0.001
      Fprime = (fun(x+h) - fun(x-h)) / (2*h)
   end function
end program


