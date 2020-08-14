/*Este programa especifica um exemplo de declaração e invocação de uma função de soma com sintaxe simples,
  a qual recebe dois argumentos de entrada [operando1,operando2], realiza a soma desses argumentos,
  e devolve o valor do resultado.
*/

function resultado = soma(operando1,operando2)
    
    resultado = operando1+operando2
    
endfunction


mprintf("EXEMPLO 1 - FUNÇÂO SOMA\n")

resultado = soma(2,3)

mprintf("Resultado: %f\n",resultado)
