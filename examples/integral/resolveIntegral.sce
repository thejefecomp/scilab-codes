//Este programa permite ao utilizador calcular a integral da função informada por meio do uso das funções integrate() e intg(). O utilizador informa o nome da função, um vetor/matriz com o seu corpo, e o nome da variável utilizada na integração. Além disso, o programa permite ao utilizador informar os limites superior e inferior de integração, e escolher entre as funções integrate() e intg() para realizar os cálculos.


/*Esta função permite concatenar um conjunto variável de argumentos separados por um dado separador. A função retorna uma string concatenada com o seguinte formato:

 literal = 'varargin(1)<separador>...<separador>varargin(n)'
 
 separador -> representa o caractere, ou conjunto de caracteres, utilizado como separador;
 
 varargin -> conjunto variável de strings a serem concatenadas.

*/
function literal = concatenaArgumentos(separador, varargin)
    
    literal = ''
    tamanho = length(varargin)
    for i=1:tamanho
        
        literal = strcat([literal,string(varargin(i))])
        
        if i < tamanho then
                  
            literal = strcat([literal,separador])
        end
    end
endfunction


/*Esta função cria a chamada a ser utilizada para invocar uma das funções [integrate() ou intg()] por meio da função execstr().  
  A criação é dada pela concatenação dos argumentos, conforme a ordem exigida por uma das funções [integrate() ou intg()].
  
  nomeFuncao -> especifica o nome da função de integração;
  
  nomeVariavel -> especifica o nome da variável de integração;
  
  limiteInferior -> especifica o limite inferior de integração;
  
  limiteSuperior -> especifica o limite superior de integração;
  
  escolhaFuncaoIntegral -> especifica qual a função a ser utilizada para integração [integrate() ou intg()];
  
  imprimirNoConsole -> especifica a escolha de impressão do resultado dos cálculos no console. Em caso positivo, o valor é sim; caso contrário, o valor é não.
*/
function chamada = criaChamada(nomeFuncao,nomeVariavel,limiteInferior, limiteSuperior, escolhaFuncaoIntegral,imprimirNoConsole)
    
    chamada = ''
    
    select escolhaFuncaoIntegral
        
        case 1 then chamada = concatenaArgumentos(',',concatenaArgumentos('','integrate(','""',nomeFuncao,'""'),concatenaArgumentos('','""',nomeVariavel,'""'),limiteInferior,concatenaArgumentos('',limiteSuperior,')')) 
        
        case 2 then chamada = concatenaArgumentos(',', concatenaArgumentos('','intg(',string(limiteInferior)),limiteSuperior,concatenaArgumentos('',nomeFuncao,')'))
        
    end
    
    if imprimirNoConsole == 'sim' then
        chamada = concatenaArgumentos('','disp(',chamada,')')
    end
    
    
endfunction

continuar = 'sim'

while continuar == 'sim'

    nomeFuncao = input('Informe o nome da função a ser integrada: ', 's')
    
    nomeVariavelRetorno = input('Informe o nome da variável de retorno da função a ser integrada: ', 's')

    corpoFuncao = input('Informe o corpo da função a ser integrada [vetor/matriz de string(s)]: ')

    nomeVariavel = input('Informe o nome da variável a ser integrada: ', 's')

    escolhaFuncaoIntegral = input('Digite 1-> integrate() ou 2->intg(): ')

    limiteInferior = input('Informe o limite inferior: ')

    limiteSuperior = input('Informe o limite superior: ')

    imprimirNoConsole = input('Deseja imprimir o resultado dos cálculos no console: sim ou não: ', 's')
    
    assinaturaFuncao = concatenaArgumentos('',nomeVariavelRetorno,'=',nomeFuncao,'(',nomeVariavel,')')
    
    deff(assinaturaFuncao,corpoFuncao)
    
    chamada = criaChamada(nomeFuncao,nomeVariavel,limiteInferior,limiteSuperior,escolhaFuncaoIntegral,imprimirNoConsole)
    
    execstr(chamada)
    
    continuar = input('Deseja continuar a realizar cálculos? sim ou não: ', 's')
end

mprintf('Tenha um bom dia :-D')
