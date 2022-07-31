program NewtonSubRoutine2files
   !Seção declaração
   implicit none
   real :: guess, root
   real, external :: fun
   guess = 3

   !Seção execução
   call newton(fun, guess, root)
   write(*,*) 'A raiz é', root
end program

real function fun(x)
   implicit none
   real, intent(in) :: x
   fun = x*x-4
end function
