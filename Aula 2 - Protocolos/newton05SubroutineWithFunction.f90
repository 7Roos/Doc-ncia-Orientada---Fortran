program NewtonSubroutineWithFunction
   !Seção declaração
   implicit none
   real :: x0, root
   real, external :: fun   !Agora entramos com duas funções como argumento da subrotina
   x0 = 3                  !chute inicial.
   !Seção execução
   call newton(fun, x0, root)
   write(*,*) 'A raiz é', root
end program
!Função a ser definida pelo usuário.
real function fun(x)
   implicit none
   real, intent(in) :: x
   fun = x*x-4
end function
subroutine newton(fun, guess, result)
   !Seção declaração
   implicit none
   real, external :: fun
   real, intent(in) :: guess
   real, intent(out) :: result
   real :: tol, x1, x0
   integer :: step
   tol = 1.E-06
   step = 0
   x0 = guess
   !Seção execução
   do while(abs(fun(x0)) >= tol)
      x1 = x0 - fun(x0) / Fprime(x0)
      write(*,*) 'Iteração=>', step, 'x0=', x0, 'Fun(x0)=', fun(x1)
      x0 = x1
      step = step + 1
   end do
   result = x0
!Procedimento interno
contains
   real function Fprime(x)
      implicit none
      real, intent(in) :: x
      real :: h
      h = 0.001
      Fprime = (fun(x+h) - fun(x-h)) / (2*h)
   end function
end subroutine
