program teste
implicit none
real:: x, y, average_data, average
real :: root_mean_square, RMS, standart_deviation_mean, variancia, plot_data, plot
integer:: i, N

write(*,*) "Número N de dados"
read(*,*) N

open(unit=20, file='data.dat')
    do i=1, N
        write(*,*) "Entre com o valor correspondente x,y:"
        read(*,*) x, y
        write(20,*) x,y
    end do
close(20)

average_data = average(N)
print *, "O valor médio de y é:", average_data

root_mean_square = RMS(N, average_data)
print *, "O desvio padrão amostral de y é:", root_mean_square

standart_deviation_mean = root_mean_square / sqrt(float(N))
print *, "O desvio padrão da média de y é:", standart_deviation_mean

variancia = root_mean_square**2
print *, "A variância de y é:", variancia

plot = plot_data(N, standart_deviation_mean)

end program

real function average(N)
    implicit none
    real :: soma, x, y
    integer :: i, N
    soma = 0.0
    open(20, file='data.dat')

    do i=1, N
    read(20,*) x, y
    soma = soma + y
    end do

    close(20)
    average = soma /N
    return
end

real function RMS(N, average_data)
implicit none
real :: x, y, sigma, average_data, d
integer :: i, N
  sigma = 0.0
  open(20, file='data.dat')

  do i=1, N
    read(20,*) x, y
    d = y - average_data
    sigma = (sigma + d)**2
  end do

  close(20)
  RMS = sqrt(sigma /(N - 1))
return
end

!!!!!!! GRÁFICO !!!!!!!!!
real function plot_data(N, delta)
implicit none
    real :: x, y, delta
    integer :: i, N
    open(20, file='data.dat')
    open(unit=21, file='data_plot.dat')

    do i=1, N
    read(20,*) x, y
    write(21,*) x, y, delta
    end do

    close(21)
    close(20)
    call system('gnuplot -p template_data.gnu')
return
end