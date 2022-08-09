program derivada
x=1.
exact = cos(x)
do 
  print *, 'Enter value of h (<= 0 to stop)'
  read *, h
  if (h <= 0) stop
  fprime = (sin(x + h) - sin(x - h)) / (2*h)
  diff = exact - fprime
  print 20, h, diff
  20 format ('h=', E15.8, 5X, 'Error=', E15.8)
end do

end program