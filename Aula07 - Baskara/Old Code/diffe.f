c234567
       x=1.
       exact = cos(x)
10     print *, 'Enter value of h (.LE. 0 to stop)'
       read *, h
       if (h .LE. 0) stop
       fprime = (sin(x + h) - sin(x - h)) / (2*h)
       diff = exact - fprime
       print 20, h, diff
20     format ('h=', E15.8, 5X, 'Error=', E15.8)
       go to 10
       end
