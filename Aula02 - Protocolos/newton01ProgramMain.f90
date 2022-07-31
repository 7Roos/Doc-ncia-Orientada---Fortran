program NewtonProgramMain
   !Seção declaração
   implicit none
   real :: fun, x, h, tol, x0, x1
   integer :: step
   fun(x) = (x*x)-4.0      !definimos a função
   h = 0.001           !h da derivada de fun
   tol = 1.E-06        !tolerância para a busca
   x0 = 3          !chute inicial
   step = 0            !contagem inicial das iterações

   !Seção execução
   do while(abs(fun(x0)) >= tol)
      x1 = x0 - fun(x0) / ( (fun(x0+h) - fun(x0-h)) / (2*h) )      !no denominador está a drivada central
      write(*,*) 'Iteração=>', step, 'x0=', x0, 'Fun(x0)=', fun(x1)
      x0 = x1         !Novo chute baseado na reta tangente
      step = step + 1 !incremento a cada iteração
   end do
end program
