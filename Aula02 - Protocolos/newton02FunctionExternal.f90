program NewtonFunctionExternal
   !Seção declaração
   implicit none
   real :: tol, x0, x1, Fprime
   real, external :: fun   !Devemos declarar aqui como EXTERNAL.
   integer :: step

   tol = 1.E-06     
   x0 = 3             
   step = 0            

   !Seção execução
   do while(abs(fun(x0)) >= tol)
      x1 = x0 - fun(x0) / Fprime(fun, x0)  
      write(*,*) 'Iteração=>', step, 'x0=', x0, 'Fun(x0)=', fun(x1)
      x0 = x1      
      step = step + 1 
   end do
end program

!Procedimento externo:
!Função a ser definida pelo usuário.
real function fun(x)
   !Seção declaração
   implicit none
   real, intent(in) :: x   !A inteção é de utilizar apenas como entrada.

   !Seção de execução/saída
   fun = x*x-4
end function

!Fprime usa fun como uma função externa a ser definida pelo usuário,
!e que está na lista de argumentos (fun, x)
real function Fprime(fun, x)
   !Seção declaração
   implicit none
   real, external :: fun      !E aqui também declaramos como external
   real, intent(in) :: x    !Estes são os inputs!
   real :: h

   !Seção execução
   h = 0.001
   Fprime = (fun(x+h) - fun(x-h)) / (2*h)
end function
