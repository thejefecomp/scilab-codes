// Este programa exemplifica o uso de funções com argumentos de entrada variáveis.

/*
Esta função implementa uma função de soma aritmética, a receber
um número variável de argumentos de entrada, e retornar o
resultado da soma destes argumentos.
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

//Situação 1: invocar a função soma sem argumentos.
mprintf('\n\nSituação 1: resultado=soma()\n\n')
resultado = soma()
mprintf('\n\nresultado=%f', resultado)

//Situação 2: invocar a função soma com um único argumento.
mprintf('\n\nSituação 2: resultado=soma(2)\n\n')
resultado = soma(2)
mprintf('\n\nresultado=%f', resultado)

//Situação 3: invocar a função soma com dois argumentos.
mprintf('\n\nSituação 3: resultado=soma(2,3)\n\n')
resultado = soma(2,3)
mprintf('\n\nresultado=%f', resultado)

/*
PS: Podemos invocar a função soma com um número variável de
argumentos, tal como suportado pelo varargin. Podem fazer a
invocação diretamente no console para verificar situações
diferentes das exibidas acima.
*/

