//Este programa implementa uma calculadora de operações básicas [adição, subtração, multiplicação, e divisão], a utilizar dois números informados pelo utilizador e a operação desejada como entradas.

//Esta função implementa uma soma simples de dois números
function resultado=soma(numero1,numero2)
    resultado = numero1 + numero2
endfunction

//Esta função implementa uma subtração simples de dois números
function resultado=subtracao(numero1,numero2)
    resultado = numero1 - numero2
endfunction

//Esta função implementa uma multiplicação simples de dois números
function resultado=multiplicacao(numero1,numero2)
    resultado = numero1 * numero2
endfunction

//Esta função implementa uma divisão simples de dois números
function [resultado,divisaoPorZeroFlag]=divisao(numero1,numero2)
    
    /*
    O mapemamento da divisaoPorZeroFlag é representado da seguinte forma:
    1 -> existência de divisão por zero
    0 -> ausência de divisão por zero
    */
    divisaoPorZeroFlag = 0
    
    //Não suporta divisão por zero
    if numero2 == 0 then
       divisaoPorZeroFlag = 1
       resultado = -1
    else
       resultado = numero1 / numero2
    end   
endfunction


/*
    O mapemamento do continuar é representado da seguinte forma:
    sim -> o utilizador deseja continuar a fazer cálculos
    nao -> o utilizador não deseja continuar a fazer cálculos
    */
continuar = 'sim'

while  continuar == 'sim'

    numero1 = input('Informe o valor do primeiro número: ')
    
    numero2 = input('Informe o valor do segundo número: ')
    
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
        case 'A' then resultado = soma(numero1,numero2)
        case 'S' then resultado = subtracao(numero1,numero2)
        case 'M' then resultado = multiplicacao(numero1,numero2)
        case 'D' then 
                
                [resultado,divisaoPorZeroFlag] = divisao(numero1,numero2)
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
