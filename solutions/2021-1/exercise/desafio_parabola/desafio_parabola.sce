/*

Author: Jeferson Souza (thejefecomp) - jeferson.souza@udesc.br

O desafio da parábola

Uma parábola pode ser definida pela equação y = ax^2 + bx + c. Suponha
a necessidade de calcular os valores de y para diferentes parábolas, as quais
só serão conhecidas durante a execução do seu programa. O seu desafio é
escrever uma função que permita realizar o cálculo de qualquer parábola
desejada pelo utilizador. A sua função deve permitir que os valores de a,b,c e
x sejam definidos como parâmetros. Com base na função criada, escreva um
programa que solicite ao utilizador os valores [a, b, c] que definem a parábola
e as extremidades do intervalo aberto ]l1 − l2[. O programa deve calcular
o valor de y para cada valor de l1 ≤ x ≤ l2 , a imprimir os valores de y no
console.

*/

//Esta função implementa a representação genérica de uma parábola y = ax^2 + bx + c.
function y=parabola(a,b,c,x)
	
	y = (a .*x.^2) + (b.*x) + c

endfunction


/*
Com o uso de vetores (conteúdo que veremos a seguir na disciplina) é possível reduzir a redundância, como
mostrado a seguir.

coeficientes = input('Digite os valores dos coeficientes a,b,c como um vetor [a,b,c]: ')

intervalo = input('Digite os valores do intervalo e do incremento para o cálculo como um vetor [l1,l2,incremento]: ')

mprintf('\n\nParábola: %dx^2 + %dx + %d\n\n', a,b,c)

for i=intervalo(1):intervalo(3):intervalo(2)

	mprintf('\n\nx=%f, y=%f\n\n', i,parabola(coeficientes(1),coeficientes(2),coeficientes(3),i))

end

ou ainda

x = intervalo(1):intervalo(3):intervalo(2)

y = parabola(coeficientes(1),coeficientes(2),coeficientes(3),x)

disp(x,'x=')
disp(y,'y=')

E uma alternativa para o disp();

for i=1:length(x)

	mprintf('\n\nx=%f, y=%f\n\n', x(i),y(i))

end


*/

a = input('Digite o valor do coeficiente a: ')

b = input('Digite o valor do coeficiente b: ')

c = input('Digite o valor do coeficiente c: ')

l1 = input('Digite o valor do limite inferior do intervalo l1: ')

l2 = input('Digite o valor do limite superior do intervalo l2: ')

incremento = input('Digite o valor do incremento para o calculo: ')


mprintf('\n\nParábola: %dx^2 + %dx + %d\n\n', a,b,c)

for i=l1:incremento:l2

	mprintf('\n\nx=%f, y=%f\n\n', i,parabola(a,b,c,i))

end
