/*Este programa especifica um exemplo de declaração e invocação de uma função de soma com argumentos de entrada variáveis,
  a qual recebe argumentos de entrada, realiza a soma desses argumentos,
  e devolve o valor do resultado juntamente com um status de erro, o qual indica se a função foi ou não invocada com
  argumentos de entrada.
*/

function [resultado,erro] = soma(varargin)
    
	numeroEntradas = length(varargin)

    resultado = 0

	erro = 0

	if numeroEntradas > 0 then
		
		for indice=1:numeroEntradas
			
			resultado = resultado + varargin(indice)
		end
	else

		erro = 1

		resultado = -1

	end
    
endfunction


mprintf("EXEMPLO 2 - FUNÇÂO SOMA COM ARGUMENTOS DE ENTRADA VARIÁVEIS\n")

mprintf("-------EXECUÇÃO 1-------\n")

[resultado,erro] = soma()

if erro == 1 then
	mprintf('A função deve ser invocada com no mínimo um argumento de entrada.\n')
end

mprintf("Resultado: %f\n",resultado)

mprintf("-------EXECUÇÃO 2-------\n")

[resultado,erro] = soma(2)

mprintf("Resultado: %f\n",resultado)

mprintf("-------EXECUÇÃO 3-------\n")

[resultado,erro] = soma(2,3)

mprintf("Resultado: %f\n",resultado)

mprintf("-------EXECUÇÃO 4-------\n")

[resultado,erro] = soma(2,3,4)

mprintf("Resultado: %f\n",resultado)

mprintf("-------EXECUÇÃO 5-------\n")

[resultado,erro] = soma(2,3,4,10)

mprintf("Resultado: %f\n",resultado)
