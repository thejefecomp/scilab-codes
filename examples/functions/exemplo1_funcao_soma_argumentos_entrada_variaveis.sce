/*Este programa especifica um exemplo de declaração e invocação de uma função de soma com argumentos de entrada variáveis,
  a qual recebe argumentos de entrada, realiza a soma desses argumentos e devolve o valor do resultado.
*/

function resultado = soma(varargin)
    
	numeroEntradas = length(varargin)

    resultado = 0

	if numeroEntradas > 0 then
		
		for indice=1:numeroEntradas
			
			resultado = resultado + varargin(indice)
		end
	end
    
endfunction


mprintf("EXEMPLO 1 - FUNÇÂO SOMA COM ARGUMENTOS DE ENTRADA VARIÁVEIS\n")

mprintf("-------EXECUÇÃO 1-------\n")

resultado = soma()

mprintf("Resultado: %f\n",resultado)

mprintf("-------EXECUÇÃO 2-------\n")

resultado = soma(2)

mprintf("Resultado: %f\n",resultado)

mprintf("-------EXECUÇÃO 3-------\n")

resultado = soma(2,3)

mprintf("Resultado: %f\n",resultado)

mprintf("-------EXECUÇÃO 4-------\n")

resultado = soma(2,3,4)

mprintf("Resultado: %f\n",resultado)

mprintf("-------EXECUÇÃO 5-------\n")

resultado = soma(2,3,4,10)

mprintf("Resultado: %f\n",resultado)
