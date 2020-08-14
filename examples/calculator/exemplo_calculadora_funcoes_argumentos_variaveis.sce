//Este programa implementa uma calculadora de operações básicas [adição, subtração, multiplicação, e divisão], a utilizar números informados pelo utilizador e a operação desejada como entradas. Sem a utilizaçção de vetores [próximo tópico na disciplina], a operação automatizada pelo menu suporta, no máximo, 5 números para o cálculo. O limite de 5 números pode ser modificado, desde que as invocações para todas as quantidades variáveis de números sejam adicionadas/removidas na implementação. Para utilizar as operações básicas com qualquer número de argumentos, utilize diretamente o console.

//Esta função implementa uma soma simples de números informados pelo utilizador, a retornar o valor da soma como resultado.
function resultado=soma(varargin)
    resultado = 0
    numeroEntradas = length(varargin)
    
    if numeroEntradas > 0 then
        for indice = 1 : numeroEntradas
            resultado = resultado + varargin(indice)
        end
    end
endfunction

//Esta função implementa uma subtração simples de números informados pelo utilizador, a retormar o valor da subtração como resultado.
function resultado=subtracao(varargin)
    resultado = 0
    numeroEntradas = length(varargin)
    
    if numeroEntradas > 0 then
        resultado = varargin(1)
        for indice = 2 : numeroEntradas
            resultado = resultado - varargin(indice)
        end
    end
endfunction

//Esta função implementa uma multiplicação simples de números informados pelo utilizador, a retormar o valor da multiplicação como resultado.
function resultado=multiplicacao(varargin)
    resultado = 0
    numeroEntradas = length(varargin)
    
    if numeroEntradas > 0 then
        resultado = varargin(1)
        for indice = 2 : numeroEntradas
            resultado = resultado * varargin(indice)
        end
    end
endfunction

//Esta função implementa uma divisão simples de números informados pelo utilizador, a retormar o valor da divisão como resultado.
function [resultado,divisaoPorZeroFlag]=divisao(varargin)
    
    /*
    O mapemamento da divisaoPorZeroFlag é representado da seguinte forma:
    1 -> existência de divisão por zero
    0 -> ausência de divisão por zero
    */
    divisaoPorZeroFlag = 0
    
    resultado = 0
    
    numeroEntradas = length(varargin)
    
    if numeroEntradas > 0 then
        //Não suporta divisão por zero
        if varargin(numeroEntradas) == 0 then
            divisaoPorZeroFlag = 1
            resultado = -1
        else
            resultado = varargin(1)
            for indice = 2 : numeroEntradas
				if varargin(indice) == 0 then
					divisaoPorZeroFlag = 1
		            resultado = -1
					break
				else
                	resultado = resultado / varargin(indice)
				end
            end
        end   
    end
endfunction

//Esta função realiza a leitura de um conjunto de números informados pelo utilizador. A função recebe como argumento o número máximo de entradas que poderão ser informadas. Caso o utilizador informe um número maior de entradas, somente o número máximo de entradas será lido.
function [numeroEntradas,varargout]=leituraNumeros(maximoEntradas)
    numeroEntradas = input ('Digite o número de valores a serem utilizados para o cálculo: ')
    
    for indice = 1 : maximoEntradas
        if indice > numeroEntradas then
            varargout(indice) = 0
        else
            mprintf("Número %i\n", indice)
            varargout(indice) = input('Digite o valor: ')
        end
    end
endfunction


/*
    O mapemamento do continuar é representado da seguinte forma:
    sim -> o utilizador deseja continuar a fazer cálculos com o menu automatizado
    nao -> o utilizador não deseja continuar a fazer cálculos com o menu automatizado
    */
continuar = input('Caso deseje executar as operações básicas de soma, subtração, multiplicação, e divisão com qualquer número de valores, digite nao e execute as operações diretamente no console. Caso contrário, digite sim. [sim/nao]: ', 's')

while  continuar == 'sim'

    mprintf('Máximo de 5 números suportados para o cálculo')
    maximoEntradas = 5
    [numeroEntradas, numero1, numero2, numero3, numero4, numero5] = leituraNumeros(maximoEntradas)
    
    if numeroEntradas > maximoEntradas then
       numeroEntradas = maximoEntradas
    end
    
    /*
    O mapemamento do operação é representado da seguinte forma:
    A -> adição
    S -> subtração
    M -> multiplicação
    D -> divisão
    */
    operacao = input('digite a operação desejada [A->adição,S->subtração, M->multiplicação, e D->divisão]: ', 's')
    
    /*
    O mapemamento do status é representado da seguinte forma:
    1 -> operação realizada com sucesso
    0 -> operação inválida
    */
    status = 1
    
    select operacao
    case 'A' then 
        
        select numeroEntradas
            case 0 then resultado = soma() 
            case 1 then resultado = soma(numero1)
            case 2 then resultado = soma(numero1, numero2)
            case 3 then resultado = soma(numero1, numero2, numero3)
            case 4 then resultado = soma(numero1, numero2, numero3, numero4)
            case 5 then resultado = soma(numero1, numero2, numero3, numero4, numero5)
            else resultado = -1
        end
    case 'S' then 
        
        select numeroEntradas
            case 0 then resultado = subtracao() 
            case 1 then resultado = subtracao(numero1)
            case 2 then resultado = subtracao(numero1, numero2)
            case 3 then resultado = subtracao(numero1, numero2, numero3)
            case 4 then resultado = subtracao(numero1, numero2, numero3, numero4)
            case 5 then resultado = subtracao(numero1, numero2, numero3, numero4, numero5)
            else resultado = -1
        end
    case 'M' then 
        
        select numeroEntradas
            case 0 then resultado = multiplicacao() 
            case 1 then resultado = multiplicacao(numero1)
            case 2 then resultado = multiplicacao(numero1, numero2)
            case 3 then resultado = multiplicacao(numero1, numero2, numero3)
            case 4 then resultado = multiplicacao(numero1, numero2, numero3, numero4)
            case 5 then resultado = multiplicacao(numero1, numero2, numero3, numero4, numero5)
            else resultado = -1
        end
    case 'D' then 
                
        select numeroEntradas
            case 0 then [resultado,divisaoPorZeroFlag] = divisao() 
            case 1 then [resultado,divisaoPorZeroFlag] = divisao(numero1)
            case 2 then [resultado,divisaoPorZeroFlag] = divisao(numero1, numero2)
            case 3 then [resultado,divisaoPorZeroFlag] = divisao(numero1, numero2, numero3)
            case 4 then [resultado,divisaoPorZeroFlag] = divisao(numero1, numero2, numero3, numero4)
            case 5 then [resultado,divisaoPorZeroFlag] = divisao(numero1, numero2, numero3, numero4, numero5)
            else resultado = -1 ; divisaoPorZeroFlag = 0
        end    
   
       //Não suporta divisão por zero
       if divisaoPorZeroFlag == 1 then
          status = 0
       end
   end
        
   if status == 1 then
     mprintf('O resultado da operação é: %f\n', resultado)
       
   elseif status == 0 then 
     mprintf('Operação inválida\n')
        
     if divisaoPorZeroFlag == 1 then
        mprintf('Divisão por zero não suportada.\n')
     end
   end
    
   continuar = input('Deseja continuar a fazer cálculos? [sim/nao]: ', 's')
end

mprintf('Tenha um bom dia :-D')
