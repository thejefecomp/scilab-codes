function y=f(x)
    
    y = x^2 + 1
    
endfunction

x=-1:0.05:1

//Limpa Janela gráfica
clf()


//Divide a Janela gráfica na forma de uma matriz, com 1 linha e 2 colunas, a colocar o gráfico na primeira coluna
subplot(1,2,1)
plot(x,f(x))

//Divide a Janela gráfica na forma de uma matriz, com 1 linha e 2 colunas, a colocar o gráfico na segunda coluna
subplot(1,2,2)
plot(x,sin(x))
