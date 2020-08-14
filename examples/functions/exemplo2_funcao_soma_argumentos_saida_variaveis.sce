/*Este programa especifica um exemplo de declaração e invocação de uma função de soma com sintaxe simples,
  a qual recebe dois argumentos de entrada [operando1,operando2], realiza a soma desses argumentos,
  e devolve o valor do resultado por meio de sua assinatura com argumentos de saída variáveis. Nota-se
  que os argumentos de saída variáveis são especificados por uma lista.
*/

function varargout = soma(operando1,operando2)
    
    resultado = operando1+operando2

	varargout = list(resultado)
    
endfunction


mprintf("EXEMPLO 2 - FUNÇÂO SOMA COM ARGUMENTOS DE SAÍDA VARIÁVEIS\n")

resultado = soma(2,3)

mprintf("Resultado: %f\n",resultado)
