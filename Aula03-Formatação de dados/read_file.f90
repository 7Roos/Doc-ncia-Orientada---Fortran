program readf
implicit none
integer :: status, nvals
character(len=30) :: filename
real :: t, y
nvals = 0
write(*,*) 'Entre com o nome do arquivo'
read(*,*) filename
open(unit=20, file=filename, status='old', action='read', iostat=status)
if (status == 0) then
  do
    read(20,*, iostat=status) t, y
    if (status /= 0) exit
    nvals = nvals + 1
  end do
  if (status > 0) then
    write(*,*) 'Houve um erro ao ler a linha', nvals + 1
  else
    write(*,*) 'Chegou ao final com', nvals, 'valores'
  end if
else
  write(*,*) 'Houve um erro ao tentar abrir, erro:', status
end if
close(20)
end program