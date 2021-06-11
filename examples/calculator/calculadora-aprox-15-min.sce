/*
Este programa especifica uma calculadora de operações aritméticas siples, onde cada operação é definida em uma função. O programa solicita dois números ao utilizador, a operação a ser executada, e retorna o resultado da execução.

TAREFA: Modifique o programa para retornar o erro da divisão por zero para
fora da função divisão.
*/

//Esta função implementa uma soma aritmética.
function resultado=soma(operando1, operando2)
	resultado = operando1 + operando2
endfunction

//Esta função implementa uma subtração aritmética.
function resultado=subtracao(operando1, operando2)
	resultado = operando1 - operando2
endfunction

//Esta função implementa uma multiplicação aritmética.
function resultado=multiplicacao(operando1, operando2)
	resultado = operando1 * operando2
endfunction

//Esta função implementa uma divisão aritmética.
function resultado=divisao(operando1, operando2)

	resultado = 0

	if operando2 <> 0 then

		resultado = operando1 / operando2
	end
endfunction

continuar = 1

while continuar == 1

	mprintf("Bem vindo a calculadora escrita em aprox. 15 minutos (com explicação :-D)\n\n")

	//ADENDO: Quando virmos vetores vamos modificar a impressão do menu :-D
	mprintf('Digite + para realizar a operação de soma\n')
	mprintf('Digite - para realizar a operação de subtração\n')
	mprintf('Digite * para realizar a operação de multiplicação\n')
	mprintf('Digite / para realizar a operação de divisão\n')
	operacao = input("operação = ", 's')

	operando1 = input('Digite o valor do operando1: ')

	operando2 = input('Digite o valor do operando2: ')

	resultado = 0

	select operacao
		
		case '+' then resultado = soma(operando1, operando2)

		case '-' then resultado = subtracao(operando1, operando2)

		case '*' then resultado = multiplicacao(operando1, operando2)

		case '/' then resultado = divisao(operando1, operando2)

	end

	mprintf("\n O resultado da operação %f %s %f é igual a %f", operando1, operacao, operando2, resultado)

	continuar = input("Deseja continuar [1 -> sim, qualquer outra coisa -> não]: ") 
		
end

