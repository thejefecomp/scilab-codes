// Este programa exemplifica o uso de argumentos de saída variável.

//Esta função implementa uma função de soma aritmética com argumentos de saída variáveis.
function varargout=soma(operando1,operando2)

	varargout(1) = operando1 + operando2

	/*
		resultado = operando1 + operando2
		varargout = list(resultado)
	*/
endfunction

//Esta função implementa uma função de divisão aritmética com argumentos de saída variáveis.
function varargout=divisao(operando1,operando2)
	
	//Poer convenção, o resultado é retornado na primeira posição.
	varargout(1) = 0

	if operando2 <> 0 then

		varargout(1) = operando1 / operando2
	else
		//Por convenção, o código de erro (quando existe) é retornado na segunda posição.
		varargout(2) = -1
	end
endfunction

//Situação 1: invocar a função soma sem atribuição do resultado a uma variável.
mprintf('\n\nSituação 1: invocação sem atribuição - soma(2,3)\n\n')
soma(2,3)

//Situação 2: invocar a função soma com atribuição do resultado a uma variável.
mprintf('\n\nSituação 2: resultado=soma(2,3)\n\n')
resultado=soma(2,3)
mprintf('\n\nresultado=%f\n\n', resultado)

//Situação 3: invocar a função divisão somente a receber o resultado de uma divisão válida.
mprintf('\n\nSituação 3: resultado=divisao(2,3)\n\n')
resultado=divisao(2,3)
mprintf('\n\nresultado=%f\n\n', resultado)

/*
Situação 4: invocar a função divisão a receber o resultado e o código de erro em uma divisão válida, implica a situação de não atribuição do código de erro. Portanto, erro no número de argumentos de saída.
mprintf('\n\nSituação 4: [resultado,erro]=divisao(2,3)\n\n')
[resultado,erro]=divisao(2,3)

Remover o comentário da situação 4 para ver o erro associado.
*/

//Situação 5: invocar a função divisão a receber o resultado e o código de erro de uma divisão inválida (divisão por zero).
mprintf('\n\nSituação 5: [resultado,erro]=divisao(2,0)\n\n')
[resultado,erro]=divisao(2,0)
mprintf('\n\nresultado=%f, erro=%f\n\n', resultado,erro)

