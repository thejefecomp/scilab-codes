//Este programa implementa uma calculadora de operações básicas [adição, subtração, multiplicação, e divisão], a utilizar dois números informados pelo utilizador e a operação desejada como entradas.

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
    Add -> adição
    Sub -> subtração
    Mult -> multiplicação
    Div -> divisão
    */
    operacao = input('digite a operação desejada [Add->adição,Sub->subtração, Mult->multiplicação, e Div->divisão]: ', 's')
    
    /*
    O mapemamento do status é representado da seguinte forma:
    1 -> operação realizada com sucesso
    0 -> operação inválida
    */
    status = 1
    
    /*
    O mapemamento da divisaoPorZeroFlag é representado da seguinte forma:
    1 -> existência de divisão por zero
    0 -> ausência de divisão por zero
    */
    divisaoPorZeroFlag = 0
    
    select operacao
        case 'Add' then resultado = numero1 + numero2
        case 'Sub' then resultado = numero1 - numero2
        case 'Mult' then resultado = numero1 * numero2
        case 'Div' then 
                
                //Não suporta divisão por zero
                if numero2 == 0 then
                    divisaoPorZeroFlag = 1
                    status = 0
                else
                    resultado = numero1 / numero2
                end   
        else status = 0
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
