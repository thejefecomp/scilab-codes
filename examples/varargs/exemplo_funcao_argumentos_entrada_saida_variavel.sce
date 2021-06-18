// Este programa especifica exemplos de utilização de funções com ambos argumentos de entrada e saída variáveis.

//Esta função implementa uma função de soma aritmética com argumentos de entrada e saída variáveis.
function varargout=soma(varargin)

	numeroEntradas = length(varargin)

	//Alternativa: varargout(1) = 0
	resultado = 0

	//No caso do uso direto do varargout não é preciso atribuir o valor de uma execução sem erro.
	erro = 0

	if numeroEntradas > 0 then
		
		for indice=1:numeroEntradas
			
			//Alternativa: varargout(1) = varargout(1) + varargin(indice)
			resultado = resultado + varargin(indice)
		end
	else
		//Alternativa: varargout(2) = -1
		erro = -1
	end	

	/*
	Alternativa com erro 1:

	if erro == -1 then
		varargout = list(resultado,erro)
	else
		varargout = list(resultado)
	end

	*/

	//Alternativa: varargout = list(resultado)
	//PS: Caso a variável resultado não seja utilizada, essa linha não é necessária.
	varargout(1) = resultado

	/*
	Alternativa com erro 2
	PS: Caso a variável erro não seja utilizada, esse trecho não seria necessário.
	*/
	if erro == -1 then
		varargout(2) = erro
	end

endfunction


//Situação 1: invocar a função soma sem atribuição do resultado a uma variável.
mprintf('\n\nSituação 1: invocação sem atribuição - soma(2,3)\n\n')
soma(2,3)

//Situação 2: invocar a função soma com atribuição do resultado a uma variável.
mprintf('\n\nSituação 2: resultado=soma(2,3)\n\n')
resultado=soma(2,3)
mprintf('\n\nresultado=%f\n\n', resultado)

/*
Situação 3: invocar a função soma a receber o resultado e o código de erro em uma soma válida, implica a situação de não atribuição do código de erro. Portanto, erro no número de argumentos de saída.
mprintf('\n\nSituação 3: [resultado,erro]=soma(2,3)\n\n')
[resultado,erro]=soma(2,3)

Remover o comentário da situação 3 para ver o erro associado.
*/

//Situação 4: invocar a função divisão a receber o resultado e o código de erro de uma divisão inválida (divisão por zero).
mprintf('\n\nSituação 4: [resultado,erro]=soma()\n\n')
[resultado,erro]=soma()
mprintf('\n\nresultado=%f, erro=%f\n\n', resultado,erro)


