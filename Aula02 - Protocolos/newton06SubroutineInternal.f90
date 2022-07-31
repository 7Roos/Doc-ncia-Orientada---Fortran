program NewtonSubroutineInternal
   !Seção declaração
   implicit none
   real :: guess, root
   guess = 3

   !Seção execução
   call newton(guess, root)
   write(*,*) 'A raiz é', root
!Procedimento interno
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

   subroutine newton(x, result)
      implicit none
      real, intent(in) :: x
      real, intent(out) :: result
      real :: tol, x1, x0
      integer :: step
      tol = 1.E-06
      step = 0
      x0 = x

      do while(abs(fun(x0)) >= tol)
         x1 = x0 - fun(x0) / Fprime(x0)
         write(*,*) 'Iteração=>', step, 'x0=', x0, 'Fun(x0)=', fun(x1)
         x0 = x1
         step = step + 1
      end do
      result = x0
   end subroutine
end program
