/*Este programa especifica um exemplo de declaração e invocação de uma função de soma com sintaxe simples,
  a qual recebe dois argumentos de entrada [operando1,operando2], realiza a soma desses argumentos,
  e imprime o valor na saída do console, sem fornecer nenhum retorno.
  
*/

function somaSemRetorno(operando1,operando2)
    
    resultado = operando1+operando2

	mprintf("Resultado: %f\n",resultado)
    
endfunction


mprintf("EXEMPLO 2 - FUNÇÂO SOMA [SEM RETORNO]\n")

somaSemRetorno(2,3)
