/*
Este programa especifica uma função de soma aritmética, a permitir visualizar
a diferença entre variáveis declaradas no escopo da função das variáveis
declaradas no escopo do programa principal. As diferentes situações apresentadas
pelo programa usam comentários que devem ser removidos/inseridos para executar
o trecho de código desejado.
*/

/*
Esta função implementa uma soma aritmética de dois números.
*/
function resultado=soma(operando1, operando2)
	resultado = operando1 + operando2
endfunction

/*
Esta função implementa uma soma aritmética de dois números sem retorno do resultado.
*/
function somaSemRetorno(operando1, operando2)
	resultado = operando1 + operando2
	mprintf('%f', resultado)
endfunction

/*
Esta função implementa uma soma aritmética de dois números com retorno múltiplo.
*/
function [resultado,operando1,operando2]=somaRetornoMultiplo(operando1,operando2)
	
	resultado = operando1 + operando2

endfunction

/*
Situação 1: chamada da função soma sem atribuição de seu valor para nenhuma
variável no programa principal.

soma(2,3)
*/

/*
Situação 2: variável resultado declarada somente como retorno da função -> erro.
PS: é preciso remover qualquer variável com nome resultado do navegador de variáveis para visualizar a situação de erro.

soma(2,3)
disp(resultado)
*/

/*
Situação 3: variável resultado está declarada como retorno da função e também no programa principal. Entretanto, o valor apresentado é da variável resultado
declarada no programa principal, já que a variável de retorno fica fora de escopo no referido programa.

resultado = soma(2,3)
disp(resultado)

*/

/*
Situação 4: variável resultado está declarada dentro do escopo da função. O seu valor deve ser impresso dentro da função para ser visualizado.

somaSemRetorno(2,3)

*/

/*
Situação 5: variáveis resultado, operando1, e operando2 declaradas como retorno da função, e dentro do programa principal.

[resultado,operando1,operando2] = somaRetornoMultiplo(2,3)

mprintf('O resultado da soma %f + %f é igual a %f', operando1, operando2, resultado)
*/

/*
Situação 6: variáveis resultado, operando1, e operando2 declaradas como
retorno da função, e somente a variável resultado também é declarada dentro
do escopo do programa principal, já que a primeira variável de retorno 
(i.e. resultado[variável] declarada na função) será atribuída à variável
declarada no programa principal (i.e. resultado[variável] declarada no programa principal).

resultado = somaRetornoMultiplo(2,3)

mprintf('O resultado da soma %f + %f é igual a %f', operando1, operando2, resultado)
*/ 
