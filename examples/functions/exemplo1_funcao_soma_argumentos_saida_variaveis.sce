/*Este programa especifica um exemplo de declaração e invocação de uma função de soma com sintaxe simples,
  a qual recebe dois argumentos de entrada [operando1,operando2], realiza a soma desses argumentos,
  e devolve o valor do resultado por meio de sua assinatura com argumentos de saída variáveis.
*/

function varargout = soma(operando1,operando2)
    
    varargout(1) = operando1+operando2
    
endfunction


mprintf("EXEMPLO 1 - FUNÇÂO SOMA COM ARGUMENTOS DE SAÍDA VARIÁVEIS\n")

resultado = soma(2,3)

mprintf("Resultado: %f\n",resultado)
