program example_loop
character(len=10) :: file, name
character(len=4) :: extension
character(len=40) :: word
character(len=1) :: A, num

do
  write(*,*) 'Escolha o exemplo'
  read(*,*) Icase

  SELECT CASE(Icase)
  case(1)
    !Exemplo 1 - Loop gerando números pares
    print '(16X,A)', 'Exemplo 1 - Loop gerando números pares'
    print *, '---------------------------------------------------------------------------'

    N=20
    !Loop do
    print *, 'Loop DO'
    do i=2, N, 2
      print *, i
    end do

    !Loop DO vazio - while fortran 90/95
    i = 2
    print *, 'Loop DO vazio - while fortran 90/95'
    do
      if (i >= N) EXIT
      print *, i
      i = i + 2
    end do
    i = 2
    !Loop DO WHILE
    print *, 'Loop DO WHILE antigo'
    do while (i <= N)
      print *, i 
      i = i + 2
    end do

  case(2)
    !Exemplo 2 - Interrompendo um loop
    print '(16X,A)', 'Exemplo 2 - Interrompendo um loop'
    print *, '---------------------------------------------------------------------------'

    do i=1, 5
      if(i==3) exit
    end do
    print *, i

  case(3)
    !Exemplo 3 - Saindo de um loop
    print '(16X,A)', 'Exemplo 3 - Saindo de um loop'
    print *, '---------------------------------------------------------------------------'

    do i=1, 6, 1
      print *, i
    end do
    print *, 'saiu do loop', i
    print *, 'saiu do loop', i

  case(4)
    !Exemplo 4 - Filtrando valores num loop
    print '(16X,A)', 'Exemplo 4 - Filtrando valores num loop'
    print *, '---------------------------------------------------------------------------'

    do i = 1, 20
      if ( mod(i,3) == 0 ) cycle
      print *, i
    end do

  case(5)
  !Exemplo 5 - Nomeando um loop
    print '(16X,A)', 'Exemplo 5 - Nomeando um loop'
    print *, '---------------------------------------------------------------------------'
    ext: do i=1,6
      if (i == 4) exit
      int: do j=1,2
        print *, i, j
      end do int
    end do ext

  case(6)
  !!!!! IF ARITMÉTICO !!!!!!!!!!
  !    IF (x-y) 10, 20, 30
  !10  (executa se der negativo)
  !    GO TO 100
  !20  (executa se der zero)
  !    GO TO 100
  !30  (executa se der positivo)
  !    GO TO 100
  !100 CONTINUE

  case (7)
  !Exemplo 7 - Fatiando uma string
    print '(16X,A)', 'Exemplo 7 - Fatiando uma string'
    print *, '---------------------------------------------------------------------------'

    file = 'teste.dat'
    print *, 'Palavra completa: ', file 
    print *, 'Palavra cortada: ', file(:5)
    print *, 'Palavra cortada: ', file(1:5)

  case (8)
  !Exemplo 8 - Concatenando uma string
    print '(16X,A)', 'Exemplo 8 - Concatenando uma string'
    print *, '---------------------------------------------------------------------------'

    name = 'teste'
    extension = '.dat'
    !Concatenamos
    word = name // extension
    print *, word
  
  case (9)
    !Exemplo 9 - Funções intrísecas para strings
    print '(16X,A)', 'Exemplo 9 - Funções intrísecas para strings'
    print *, '---------------------------------------------------------------------------'

    print '(60X, A)', 'Tabela ASCII'
    print *, " ==================================================================================================&
    ================================================"
    write(*,11) (i, ACHAR(i), i=32, 121, 2)
    11 format (3(1x, 5(I3, 1x, A, 5x)), /)
 

  case (10)
    !Exemplo 9 - Funções intrísecas para strings - uma letra
    print '(16X,A)', 'Exemplo 10 - Funções intrísecas para strings - uma letra'
    print *, '---------------------------------------------------------------------------'

    A = 'icaro'
    print '(15x, A, /)', 'A=icaro'
    print 21, 'IACHAR(A)=', IACHAR(A), 'IACHAR(i)=', IACHAR('i')
    print 21, 'len(A)=', len(A), 'len(icaro)=', len('icaro')
    print 21, 'len_trim(A)=', len_trim(A), 'len_trim(icaro)=', len_trim('icaro')
    print 22, 'trim(A)=', trim(A)

    21 format (1x, A20, 1X, I3, 5X, A20, I3)
    22 format (1X, A16, 1X, A3)

  case(11)
    !Exemplo 11 - Funções intrísecas para strings - uma palavra
    print '(16X,A)', 'Exemplo 11 - Funções intrísecas para strings - uma palavra'
    print *, '---------------------------------------------------------------------------'

    word = 'naruto'
    print '(15x, A)', 'word=naruto'
    !print *, 'IACHAR(word)=', IACHAR(word), 'IACHAR(naruto)', IACHAR('naruto')
    print 21, 'len(word)=', len(word), 'len(naruto)=', len('naruto')
    print 21, 'len_trim(word)=', len_trim(word), 'len_trim(naruto)=', len_trim('naruto')
    print 23, 'trim(word)=', trim(word), 'trim(naruto)=', trim('naruto')
    23 format (1X, A16, 1X, A7, 5X, A16, 1X, A7)

  case (12)
    !Exemplo 12 - Automatizando a criação de um arquivo de dados
    print '(16X,A)', 'Exemplo 12 - Automatizando a criação de um arquivo de dados'
    print *, '---------------------------------------------------------------------------'

    name = 'teste'
    extension = '.dat'
    word = trim(name) // extension
    print *, trim(word)
    open(unit=20, file=trim(word))
    do i=1, 3
      write(20,*) i
    end do
    close(20)

  case (13)
    !Exemplo 13 - Convertendo um número inteiro numa string
    print '(16X,A)', 'Exemplo 13 - Convertendo um número inteiro numa string'
    print *, '---------------------------------------------------------------------------'

    i = 3
    print *, str(i) // '.dat'

  case (14)
    !Exemplo 14 - Automatizando a criação de vários arquivos de dados
    print '(16X,A)', 'Exemplo 14 - Automatizando a criação de vários arquivos de dados'
    print *, '---------------------------------------------------------------------------'

    name = 'teste'
    extension = '.dat'

    do j=1,3
      word = trim(name) // str(j) // extension
      open(unit=21, file=word)
      close(21)
    end do
  
  case(0)
    stop
  END SELECT

end do

contains
character function str(num)
str = ACHAR(48+num)
end function

end program