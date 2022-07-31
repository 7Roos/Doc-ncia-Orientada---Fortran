module constantes
   implicit none
   save
   real, parameter :: pi = 3.14159265
   real, parameter :: k0 = 8.85418782*10.0**(-12)
   integer, parameter :: c = 299792458
   contains
   subroutine sum(x,y, result)
   implicit none
   real, intent(in) :: x, y 
   real, intent(out) :: result

   result = x + y
   end subroutine
end module
