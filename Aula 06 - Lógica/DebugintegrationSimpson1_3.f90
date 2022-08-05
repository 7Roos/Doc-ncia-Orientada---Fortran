program integrationSimpson
!func(x) = 2. - 2.*(x**2)      !Função a ser integrada
!func(x) = 2*cos(0.5 + 0.1*x)
!func(x) = cos(2.*x)
func(x) = 3.*x**2
! Intervalo de 0 a 1.
a = 1.5               
b = 3.
!exact = (2.*(b) - 2.*(b**3)/3.) - (2.*(a) - 2.*(a**3)/3.)  !Resultado analítico
!exact = (2./0.1)*(sin(0.5 + 0.1*b) - sin(0.5 + 0.1*a))
!exact = .5*(sin(2.*b) - sin(2.*a))
exact = b**3 - a**3
do
  print *, 'Entre com o valor do números de passos (N<2 stop)'
  read *, N
  if ( N < 2 ) stop 
  ! Mod resto da divisão por 2, pois teremos que ir de 2 em 2, como nas outras regras.
  if (mod(N,2) /= 0) N = N + 1  
  
  h = (b-a) / N
  
  
  sum = func(a)          !contribuição de X=0 (limite inferior da integral)
  ifac = 2               !fator i*h par para a regra de Simpson 1/3
  do i=1, N-1            !loop sobre pontos de rede
    if (ifac == 2) then  !Alternância dos fatores 2 e 4
      ifac = 4           !fator i*h ímpar para a regra de Simpson 1/3
    else
      ifac = 2
    end if
    
    x = a + i * h
    print *, x
    sum = sum + ifac * func(x)
    !print *, "i=", i, "sum=", sum*h/3. 
  end do
  !contribuição de X=1 (limite superior da integral)
  sum = sum + func(b)   
  !integral numérica 
  xint = sum * h / 3.     
  diff = exact - xint
  print 20, xint, diff
  20 format(5x, 'Resultado = ', E15.8, 5X, 'ERRO = ', E15.8) 
end do
end program integrationSimpson
