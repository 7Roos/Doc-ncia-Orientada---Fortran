program baskara
implicit none
real :: a, b, c, delta
complex :: x1, x2

write (*,*) 'Resolvendo uma eq. do tipo ax**2 + bx + c = 0'

do
  write (*,*) 'Entre com os coef. a, b, c: '
  read (*,*) a,b, c 

  !critério de parada
  if (a == 0 .and. b ==0 ) stop

  !discriminante
  delta = (b**2) - 4*a*c

  !raízes: convertemos o discriminante para um número complexo
  x1 = (-b + sqrt( cmplx(delta, 0.) ) ) / (2*a)
  x2 = (-b - sqrt( cmplx(delta, 0.) ) ) / (2*a)

  root: if (delta > 0) then
    write (*,*) 'Há duas raízes distintas'
    write (*,*) 'que são x1 = ', real(x1), ' e x2 = ', real(x2)
  else if (delta == 0) then
    write (*,*) 'Há apenas uma raiz'
    write (*,*) 'que é: ', real(x1)
  else
    write(*,*) 'Há duas raízes complexas, que são:'

    signX1: if (aimag(x1) > 0) then
      write(*,23) 'x1 = ', real(x1), '+ i (', aimag(x1), ')'
    else
      write(*,23) 'x1 = ', real(x1), '- i (', abs(aimag(x1)), ')'
    end if signX1

    signX2: if (aimag(x2) > 0) then
      write(*,23) 'x2 = ', real(x2), '+ i (', aimag(x2), ')'
    else
      write(*,23) 'x2 = ', real(x2), '- i (', abs(aimag(x2)), ')'
    end if signX2
    23 format (2x, A, F12.8, 1X, A, F11.8, 1X, A)
  end if root
end do
end program

!1,5,6 => 
  !x1 = -2 e x2 = -3
!1,4,4 =>
  !x0=-2
!1,2,5 =>
  !x1 = -1+i2 e x2 = -1-i2