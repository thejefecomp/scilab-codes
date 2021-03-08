/*

author: prof. Jeferson Souza (thejefecomp)
email: jeferson.souza@udesc.br

@2021 - All rights reserved.

Este programa fornece uma possível solução para o enunciado do Exercício Avaliativo I da disciplina de Programação para Engenharia II. Uma calculadora de operações aritméticas simples [adição, subtração, multiplicação, divisão] é disponibilizada, a permitir a execução de cálculos com ambos dois (2) ou três (3) argumentos de entrada associados à uma operação. O utilizador deve informar os valores, a operação a ser executada, e o programa realiza o cálculo e fornece uma indicação acerca do resultado. Além disso, o programa também permite ao utilizador limpar o console de execução, e visualizar o último cálculo efetuado.

*/

//Esta função implementa a função aritmética de soma, a receber dois valores de entrada, realizar o cálculo, e devolver o resultado ao final da execução.
function resultado=soma(operando1,operando2)
	resultado = operando1 + operando2
endfunction

//Esta função implementa a função aritmética de subtração, a receber dois valores de entrada, realizar o cálculo, e devolver o resultado ao final da execução.
function resultado=subtracao(operando1,operando2)
	resultado = operando1 - operando2
endfunction

//Esta função implementa a função aritmética de multiplicação, a receber dois valores de entrada, realizar o cálculo, e devolver o resultado ao final da execução.
function resultado=multiplicacao(operando1,operando2)
	resultado = operando1 * operando2
endfunction

/*Esta função implementa a função aritmética de divisão, a receber dois valores de entrada, realizar o cálculo, e devolver o resultado ao final da execução. Caso a operação resulte em uma divisão por zero, a variável de saída divisaoPorZero recebe o valor de -1, a indicar a referida divisão; caso contrário, divisaoPorZero recebe o valor de 0, a indicar uma operação realizada com sucesso.
*/ 
function [resultado,divisaoPorZero]=divisao(operando1,operando2)

		resultado = 0
		divisaoPorZero=0

        if operando2 <> 0 then
            resultado = operando1 / operando2
        else
            resultado = -1
            divisaoPorZero = -1
        end
endfunction

/*Esta função permite solicitar ao utilizador entradas para serem utilizadas pelo programa. O utilizador pode informar se o tipo de entrada a ser solicitado é, ou não, um conjunto de caracteres, bem como fornecer a mensagem que será exibida ao utilizador ao solicitar o valor da entrada em questão. A variável tipo entrada é um vetor onde cada posição pode assumir um de dois valores distintos:

%t -> o tipo de entrada é um conjunto de caracteres, i.e., input(mensagem, 's');

%f -> o tipo de entrada não é um conjunto de caracteres, i.e., input(mensagem).

Em complemento, a variável de entrada mensagemEntrada é um vetor onde cada posição recebe um conjunto de caracteres, a especificar a mensagem a ser exibida ao utilizador no momento de solicitar o valor de entrada em questão. Por último, um nome de customização é informado por meio da variável nome.
*/
function varargout=solicitaEntrada(tipoEntrada,mensagemEntrada, nome)
    
    numeroEntradas = length(tipoEntrada)
    
    for i=1:numeroEntradas
        
        mensagem = nome+', '+mensagemEntrada(i)
        if tipoEntrada(i) then
            varargout(i) = input(mensagem, 's')
        else
            varargout(i) = input(mensagem)
        end
    end
endfunction

//Esta função exibe um menu de entrada, a permitir a customização de características tais como: mensagem inicial e final, pergunta de seleção da opção, número de opções de seleção, opções de seleção, mensagens associadas às opções de seleção, e indicação se a opção selecionada é ou não uma string. A função retorna a opção selecionada pelo utilizador ao final de sua execução.
function opcao=menu(opcaoString,mensagem,pergunta,opcoes,nome)
    
    numeroOpcoes = length(opcoes)
    
    mprintf(mensagem)
    mprintf("\n\n")
    
    for i=1:numeroOpcoes
        mprintf(opcoes(i))
        mprintf("\n")
    end
    mprintf("\n")
    mprintf(mensagem)
    mprintf("\n\n")
    opcao = solicitaEntrada(opcaoString,pergunta,nome)
endfunction


/*Esta função permite invocar a função de cálculo necessária para realização do cálculo solicitado pelo utilizador. A variável de entrada numeroOperandos fornece indicação do número de operandos a serem utilizados para o cálculo. A variável de entrada nome permite customizar as mensagens exibidas ao utilizador. A variável de saída resultado armazena o valor do cálculo realizado com sucesso, e a variável de saída erro indica a ocorrência de erro no cálculo, i.e., indica a presença de uma divisão por zero, a poder assumir dois possíveis valores:

erro = falso (%f) -> cálculo realizado com sucesso;

erro = verdadeiro (%t) -> presença de, ao menos, uma divisão por zero.

*/
function [resultado,erro,operandos,operacao]=realizaCalculo(numeroOperandos,nome)
    
    erro = %f
    
    if numeroOperandos <= 3  then
        
        [operandos(1),operandos(2)] = solicitaEntrada([%f,%f],list('digite o valor do operando 1: ', 'digite o valor do operando 2: '),nome)
    end
    
    if numeroOperandos == 3 then
        operandos(3) = solicitaEntrada(%f,'digite o valor do operando 3: ',nome)
    end
    
    operacao = solicitaEntrada(%t, list('digite o valor da operaçao [+ -> Adição, - -> Subtração, * -> Multiplicação, / -> Divisão]: '),nome)
    
    resultado = operandos(1)
    
    for i = 2:numeroOperandos
        
        select operacao
            
            case '+' then resultado = soma(resultado,operandos(i))
            case '-' then resultado = subtracao(resultado,operandos(i))
            case '*' then resultado = multiplicacao(resultado,operandos(i))
            case '/' then [resultado,divisaoPorZero] = divisao(resultado,operandos(i))
                
                if divisaoPorZero == -1 then
                    erro = %t
                    break
                end 
        end
    end
    
endfunction


/*Esta função imprime o cálculo realizado pelo utilizador, ou exibe somente mensagem a ser informada por meio da variável de entrada mensagem. A variável de entrada nome permite customizar as mensagens exibidas ao utilizador. A função assume que os parâmetros adicionais de entrada são informados em uma ordem pré-estabelecida, a qual é definida pela seguinte sequência:

[mensagemErroCalculo,resultado,erro,operacao,operandos]

onde:

mensagemErroCalculo -> especifica a mensagem associada a um erro de cálculo, e.g., divisão por zero;

resultado -> especifica o valor do resultado do cálculo efetuado;

erro -> indica a ocorrência de erro durante a tentativa de realização do cálculo;

operacao -> indica qual a operação utilizada no cálculo;

operandos -> vetor com os operandos utilizados no cálculo.

*/
function imprimeCalculo(mensagem,nome,varargin)
    
    numeroEntradas = length(varargin)
    
    mprintf('\n\n%s, %s', nome,mensagem)
    
    if numeroEntradas == 5 then
        
        operandos = varargin(numeroEntradas)
        numeroOperandos = length(operandos)
        
        mprintf("%f ", operandos(1))
        
        for i = 2:numeroOperandos
            mprintf("%s ", varargin(4))
            mprintf("%f ", operandos(i))
        end
        
        mprintf('= ')
        
        if varargin(3) then
            mprintf(varargin(1))
        else
            mprintf("%f", varargin(2))
        end
   end
    
endfunction

// ======= Início da execução do programa =======

nome = input('Informe o seu nome para personalizar as mensagens do programa: ', 's')

mprintf('Olá %s, tudo bem? \nEspero que esteja tudo bem consigo.\n\n', nome)

/*
A variável opcao é utilizada para controlar a execução do programa enquanto o utilizador desejar. A variável opcao pode assumir os seguintes valores:

1 -> O utilizador deseja realizar cálculo com dois operandos;

2 -> O utilizador deseja realizar cálculo com três operandos;

3 -> O utilizador deseja realizar exibir o último cálculo realizado;

4 -> O utilizador deseja limpar o console do scilab;

5 -> O utilizador deseja finalizar o programa.

Valor inicial -> opcao = 1

*/
opcao = 1  

menuInicial = list('1 - Realizar cálculo com dois operandos','2 - Realizar cálculo com três operandos','3 - Exibir o último cálculo realizado', '4 - Limpar console', '5 - Finalizar programa')

/*A variável últimoCalculo indica se já foi realizado algum cálculo anteriormente. Pode assumir dois valores distintos:

ultimoCalculo = %f -> não foi realizado nenhum cálculo até o presente momento;

ultimoCalculo = %t -> já foi realizado pelo menos um cálculo até o presente momento.

*/
ultimoCalculo = %f

mensagemCalculo = 'o resultado do cálculo é: '

mensagemErroCalculo = "divisão por zero não suportada!"

while opcao <> 5

    //Retorna o valor da mensagemCalculo para o valor inicial, em caso de escolha da opção 3.
    if opcao == 3 then
        mensagemCalculo = "o resultado do cálculo é: "
    end
    
	opcao = menu(%f,'======= Calculadora S =======','digite a opção desejada: ', menuInicial)

    
    select opcao
        
        case 1 then [resultado,erro,operandos,operacao] = realizaCalculo(2,nome)
            
        
        case 2 then [resultado,erro,operandos,operacao] = realizaCalculo(3,nome)
            
        
        case 3 then 
            
            if ultimoCalculo then
                
                mensagemCalculo = 'o último cálculo realizado foi: '
                
            else
                
                mensagemCalculo = 'não foi realizado nenhum cálculo até o presente momento.'
                
            end
            
        case 4 clc()
            
        case 5 then mprintf('\n\nPrograma finalizado.')
    
        else mprintf('\n\nOpção inválida.')
    
    end

    //Imprime mensagem relacionada ao cálculo, caso as opções 1,2, ou 3 sejam selecionadas.
    if opcao == 1 || opcao == 2 || (opcao == 3 && ultimoCalculo) then
        imprimeCalculo(mensagemCalculo,nome,mensagemErroCalculo,resultado,erro,operacao,operandos)
    elseif opcao == 3
        imprimeCalculo(mensagemCalculo,nome) 
    end
    
    //Atribui o valor de verdadeiro (%t) quando o primeiro cálculo for efetuado.
    if ultimoCalculo == %f then
        ultimoCalculo = opcao > 0 && opcao < 3
    end
    
    mprintf("\n\n")
end

mprintf('%s, espero que tenhas um dia espetacular! :-D\n\n', nome)

// ======= Fim da execução do programa =======
