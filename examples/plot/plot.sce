function y=f(x)
    
    y = x^2 + 1
    
endfunction

x=-1:0.05:1

//Limpa Janela gráfica
clf()

plot(x,f(x))
