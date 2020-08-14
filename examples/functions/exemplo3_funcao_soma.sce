/*Este programa especifica um exemplo de declaração e invocação de uma função de soma com sintaxe simples,
  a qual recebe dois argumentos de entrada [operando1,operando2], realiza a soma desses argumentos,
  e devolve o valor do resultado, juntamente com os valores dos argumentos de entrada, por meio de três 
  variáveis de saída [resultado,operando1,operando2].
  
  PS: Quando os nomes dos argumentos de entrada são idênticos aos das variáveis de saída, a atribuição inicial é automática,
  ou seja, se dentro da função não for realizada nenhuma atribuição às variáveis de saída, as mesmas já estarão definidas
  e terão os mesmos valores iniciais dos argumentos de entrada de mesmo nome.
  
*/

function [resultado,operando1,operando2] = soma(operando1,operando2)
    
    resultado = operando1+operando2
    
endfunction


mprintf("EXEMPLO 3 - FUNÇÂO SOMA\n")

[resultado,operando1,operando2] = soma(2,3)

mprintf("Resultado: %f\n",resultado)
mprintf("Operando1: %f\n",operando1)
mprintf("Operando2: %f",operando2)
