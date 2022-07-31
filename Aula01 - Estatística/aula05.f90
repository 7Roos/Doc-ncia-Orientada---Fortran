program media
!03/05/2022
implicit none
integer ns7, ni7, nt, i
real soma, nota, mt
soma = 0.0
ns7 = 0
ni7 = 0

write(*,*) 'digite o num total de alunos'
read(*,*) nt 
do i=1,nt
  write(*,*) 'digite a nota do alumo'
  read(*,*) nota 
  soma = soma + nota

  if(nota>=7.0) then
  ns7 = ns7+1
  else
  ni7 = ni7+1
  endif
  mt=soma/nt 
end do


write(*,*) '*** Resultados ***'
write(*,*) 'Média da turma', mt
write(*,*) 'Notas superiores ou iguais a 7.0 =', ns7
write(*,*) 'Notas inferiores a 7.0=', ni7

end program
