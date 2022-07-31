program intent_teste
   implicit none
   integer :: step, funIntent, fun
   step = 0
   !print *, 'Com Intent(IN)', funIntent(step)
   print *, 'step original =', step
   print *, 'step dentro da função =', fun(step)
   print *, 'step após a função =', step
end program

!integer function funIntent(step)
!   implicit none
!   integer, intent(in) :: step
!   step = 1
!   funIntent = step
!end function

integer function fun(step)
   implicit none
   integer :: step
   step = 1
   fun = step
end function
