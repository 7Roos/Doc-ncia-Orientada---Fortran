program teste_module
    use constantes
    implicit none
    real :: v, resultado

    v = c*10.0**(-8)

    print *, v
    call sum(1.,1., resultado)
    print *, 'testando', pi*resultado
    
end program teste_module