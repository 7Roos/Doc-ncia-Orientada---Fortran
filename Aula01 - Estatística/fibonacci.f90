program fibonacci
    implicit none
    real, dimension(100) :: x
    integer :: i  
    
    ! data  
    do i=1,100  
       x(i) = i * 0.1 
    end do  
    
    ! output data into a file 
    open(1, file = 'data1.dat', status = 'new')  
    do i=1,100  
       write(1,*) x(i)  
    end do  
    
    close(1) 
    
end program fibonacci