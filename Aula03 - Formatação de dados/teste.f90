program teste
implicit none
integer :: io, i
real :: x, y

open(unit=20, file='fallingtennisball02.d copy.txt', status='new', iostat=io)
print *, io
do i=1, 5
  !write(20,*, iostat=io) i, 2*i
  !if (io /= 0) exit
  print *, io
end do
close(20)
end program 
