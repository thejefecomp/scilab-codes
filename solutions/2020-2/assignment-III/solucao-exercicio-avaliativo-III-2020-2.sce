/*

author: prof. Jeferson Souza (thejefecomp)
email: jeferson.souza@udesc.br

@2021 - All rights reserved.

Este programa fornece uma possível solução para o enunciado do Exercício Avaliativo III da disciplina de Programação para Engenharia II, a utilizar como base a solução do Exercício Avaliativo II. Além das funcionalidades fornecidas pela calculadora S-II, implementada como solução do Exercício Avaliativo II, a calculadora S-III fornece a possibilidade de realizar desenho de gráfico da derivada de uma função, e cálculo da área associada  à curva de uma função.

*/


/*Carregar funções da biblioteca de desenho de gráficos [desenha_grafico-lib.sce]com a função exec().
PS: existem outras formas de carregar funções de uma biblioteca escrita em Scilab.
O uso direto da função exec() é a forma mais intuitiva. Para conhecer as outras formas,
veja documentaçao do Scilab, a começar pela função genlib().
*/
caminhoLibDesenhaGraficos = input('Informe o caminho da biblioteca desenha_grafico-lib.sce (default: /tmp/desenha_grafico-lib.sce): ', 's')

caminhoLibDesenhaGraficos = '/tmp/desenha_grafico-lib.sce' 

if length(caminhoLibDesenhaGraficos) == 0 then
    caminhoLibDesenhaGraficos = '/tmp/desenha_grafico-lib.sce' 
end

exec(caminhoLibDesenhaGraficos, -1)



//Esta função implementa a função matemática y=(e.^x + e.^-x)/2
function y=f1(x)
    y= (%e.^x + %e.^-x)/2
end


//Esta função implementa a função matemática y=x.^2.
function y=f2(x)
    y = x.^2
end

//Esta função implementa a função matemática y=e.^x
function y=f3(x)
    y = %e.^x
end

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

/*Esta função verifica a validade da multiplicação matricial "matrizA * matrizB" e, caso a referida multiplicação possa ser realizada, o cálculo é efetuado e o resultado retornado por meio da variável de retorno "matrizR". Em caso de sucesso, a variável de retorno "erro" recebe o valor de zero (0). Em caso de impossibilidade na multiplicação, a variável de retorno "erro" recebe o valor de menos um (-1), e a variável de retorno "matrizR" recebe o valor da constante infinito (%inf).
*/
function [erro,matrizR]=verificaEMultiplicaMat(matrizA,matrizB)

    erro = 0
    matrizR = %inf

    if size(matrizA, 'c') == size(matrizB, 'r') then

        matrizR = matrizA * matrizB
    else
        erro = -1
    end

endfunction

/*Esta função implementa as operações de multiplicação matricial e vetorial, a receber o tipo de cálculo a ser realizado (0 -> multiplicação vetorial; 1 -> multiplicação matricial), e duas matrizes, as quais podem possuir somente uma dimensão (i.e. vetores). Com base na entrada fornecida o cálculo é realizado, e o resultado retornado ao final da execução. No caso da multiplicação matricial, caso seja possível multiplicar "matrizA * matrizB" e "matrizB * matrizA", o resultado retornado inclui ambos os valores das referidas multiplicações.
*/
function [sucesso,listaResultado]=multiplicacaoMatOrVet(tipo,matrizA,matrizB)

    sucesso = 1
    listaResultado = list()

    numeroLinhasA = size(matrizA, 'r')
    numeroLinhasB = size(matrizB, 'r')
    numeroColunasA = size(matrizA, 'c')
    numeroColunasB = size(matrizB, 'c')

    if tipo == 0 && numeroLinhasA == 1 && numeroLinhasB == 1 && (numeroColunasA == numeroColunasB) then

        listaResultado($+1) = matrizA .* matrizB

    elseif tipo == 1

        for i = 1:2

            if i == 1 then

                [erro,matrizR] = verificaEMultiplicaMat(matrizA,matrizB)

            elseif i == 2

                [erro,matrizR] = verificaEMultiplicaMat(matrizB,matrizA)

                if length(listaResultado) == 0 && erro == 0 then
                    sucesso = 3
                end
            end
        
            if erro == 0 then

                listaResultado($+1) = matrizR
            end
        end

        sucesso = size(listaResultado)

    else
        sucesso = -1

    end

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


function resultado=calculaDerivadaOuIntegral(tipo, limiteInferior, limiteSuperior,corpoFuncao,varargin)
    
    resultado = 1
    
    assinaturaFuncao = 'y=f(x)'
    
    deff(assinaturaFuncao,corpoFuncao)
    
    
    if tipo then
        
       if length(varargin) > 0 then
           
            incremento = varargin(1)
       else
            incremento = 0.1
       end
        
       x = limiteInferior:incremento:limiteSuperior
        
       matrizResultado = numderivative(f,x)
        
       for i = 1:length(x)
           resultado(1,i) = matrizResultado(i,i)
       end
       
    else
        
        resultado = intg(limiteInferior,limiteSuperior,f)
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





/*Esta função permite invocar a função de cálculo necessária para realização do cálculo solicitado pelo utilizador. A variável de entrada numeroOperandos fornece indicação do número de operandos a serem utilizados para o cálculo. A variável de entrada nome permite customizar as mensagens exibidas ao utilizador. A variável de saída resultado armazena o valor do cálculo realizado com sucesso, e a variável de saída erro indica a ocorrência de erro no cálculo, i.e., indica a presença de uma divisão por zero/erro na multiplicação matricial/vetorial, a poder assumir dois possíveis valores:

erro = falso (%f) -> cálculo realizado com sucesso;

erro = verdadeiro (%t) -> presença de, ao menos, uma divisão por zero, ou erro na realização da multiplicação matricial/vetorial.

*/
function [resultado,erro,mensagemErroCalculo,operandos,operacao]=realizaCalculo(opcao,numeroOperandos,nome)
    
    erro = %f
    mensagemErroCalculo = ''


    //Matrizes/Vetores
    if opcao == 0 || opcao == 1 then

        msgBase = 'digite os valores '

        if opcao == 0 then

            msgBase = msgBase+'do vetor'

            operacao = '.*'
        else
            msgBase = msgBase+'da matriz'

            operacao = '*'
        end

        operandos = list(1,1)

        [operandos(1),operandos(2)] = solicitaEntrada([%f,%f],list(msgBase+' A: ', msgBase+' B: '),nome)

        [sucesso,resultado] = multiplicacaoMatOrVet(opcao,operandos(1),operandos(2))

        erro = sucesso <= 0

        if sucesso == 0 then

            mensagemErroCalculo = "não foi possível realizar a multiplicação entre as matrizes!"

        elseif sucesso == -1

            mensagemErroCalculo = "não foi possível realizar a multiplicação entre os vetores!"

        elseif sucesso == 3

            operandoAuxiliar = operandos(1)
            operandos(1) = operandos(2)
            operandos(2) = operandoAuxiliar
        end
    
    //Derivada/Integral
    elseif opcao == 2 || opcao == 3
        
        if opcao == 2 then
            
            operacao = 'derivada'
            
        elseif opcao == 3
            
            operacao = 'integral'
            
        end
        
        [operandos(1),operandos(2)] = solicitaEntrada([%f,%f], list('digite o limite inferior do intervalo: ', 'digite o limite superior do intervalo: '), nome)
            
        if operandos(1) > operandos(2) then
             erro = %t
             mensagemErroCalculo = 'Limite inferior menor do que limiteSuperior.'
             resultado = -1
        else
            corpoFuncao = solicitaEntrada(%t, 'digite o corpo da função para o cálculo da '+operacao+' ex: y = x + 2: ', nome)
        
            resultado = calculaDerivadaOuIntegral(opcao == 2, operandos(1), operandos(2),corpoFuncao)  
        end
        
    //Função Aritmética    
    else
    
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
                        mensagemErroCalculo = "divisão por zero não suportada!"
                        break
                    end 
           end
        end
    end
endfunction


/*

Esta função permite desenhar gráficos de funções pré-definidas,onde:

f1 -> y=(e.^x + e.^-x)/2; 

f2-> y=x.^2; 

f3-> y=e.^x.

A função responsável pela desenho dos gráficos está definida na biblioteca de funções 'desenha_grafico-lib.sce', a qual deve ser carregada no início da execução do programa.

*/
function geraGraficosFuncoes(nome)

    mensagemFuncoes = '1 -> y=(e.^x + e.^-x)/2; 2-> y=x.^2; 3-> y=e.^x. Digite um vetor (ex: [1,2]), onde cada posição representa uma função a ser desenhanda: '

    mensagemJanela = 'deseja desenhar os graficos em: %t -> janela separada; %f -> janela dividida? '
    
    // Solicita a indicação do desenho em janela separada ou dividida, e o vetor das funções pré-definidas a serem desenhadas.
    [janelaSeparada, vetorFuncoes] = solicitaEntrada([%f,%f], list(mensagemJanela, mensagemFuncoes), nome)
    
    numeroFuncoes = length(vetorFuncoes)

    for i = 1:numeroFuncoes
        
        mensagemEntradaX = 'Digite o vetor de pontos no eixo x para a função '+string(vetorFuncoes(i))+': '
        //Solicita o conjunto de valores no eixo x
        x=solicitaEntrada(%f,mensagemEntradaX ,nome)
        
        
        //Calcula o conjunto de valores no eixo y para a função selecionada.
        select vetorFuncoes(i)
        
            case 1 then y=f1(x) //y=(e.^x + e.^-x)/2
        
            case 2 then y=f2(x) //y=x.^2
        
            case 3 then y=f3(x) //y=e.^x
        end
        
        if janelaSeparada then
            
            show_window(i)
            desenhaGrafico(i,x,y)
            
        else
            
            desenhaGrafico(i,x,y,1,numeroFuncoes,i)
        
        end
    end
    
endfunction


/*
Esta função realiza a impressão de um(a) vetor/matriz, no formato de entrada do Scilab. Por exemplo:

Para vetores: [a1,a2,a3]

Para matrizes: [a11,a12,a13;a21,a22,a23]

*/
function imprimeMatriz(matriz)
    
    numeroLinhas = size(matriz, 'r')
    numeroColunas = size(matriz, 'c')
    
    mprintf("\n[")
    
    for i = 1:numeroLinhas
        for j = 1:numeroColunas
            mprintf("%1.3f", matriz(i,j))
            if j == numeroColunas && numeroLinhas > 1 && i < numeroLinhas then
                mprintf(";")
            elseif j < numeroColunas
                mprintf(",")
            end
        end
    end
    mprintf("]\n ")
    
endfunction



/*
Esta função realiza a impressão de valores que podem ser unidades singulares, vetores, ou matrizes no formato de entrada do Scilab. Por exemplo:

Para vetores: [a1,a2,a3]

Para matrizes: [a11,a12,a13;a21,a22,a23]

Para unidades singulares: valor.

*/
function imprimeValores(matriz)
    
    numeroLinhas = size(matriz, 'r')
    numeroColunas = size(matriz, 'c')
    
    if numeroLinhas > 1 || numeroColunas > 1 then
        
        imprimeMatriz(matriz)
        
   elseif length(matriz(1)) > 1
       
       imprimeMatriz(matriz(1))
       
   else
       
       mprintf("%1.3f ", matriz)
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
    
    listaOperacoesConhecidas = list('+','-','*','/','.*')
    
    numeroEntradas = length(varargin)
    
    mprintf('\n\n%s, %s', nome,mensagem)
            
    if numeroEntradas == 5 then
          
        mensagemErroCalculo = varargin(1)
        
        erro = varargin(3)
        
        operacao = varargin(4)
        
        resultados = varargin(2)
        
        ehOperacaoConhecida = %f
        
        for i=1:length(listaOperacoesConhecidas)
       
            if listaOperacoesConhecidas(i) == operacao then
           
                ehOperacaoConhecida = %t
                break
            end
        end
            
        if ehOperacaoConhecida then
            
            numeroResultados = length(resultados)
            
            operandos = varargin(5)
            
            numeroOperandos = length(operandos)
            
            for iResultado=1:numeroResultados
                
                if iResultado == 1 then
                    inicio = 1
                    incremento = 1
                    fim = numeroOperandos
                    
                else
                    mprintf('\n\ne\n')
                    inicio = numeroOperandos
                    incremento = -1
                    fim = 1
                end
                
                for i = inicio:incremento:fim
                    
                    if i <> inicio then
                        mprintf("%s ", operacao)
                    end
                    
                    imprimeValores(operandos(i))
                    
                end
                
                mprintf('= ')
            
                if erro then
                    mprintf(mensagemErroCalculo)
                else
                    imprimeValores(resultados(iResultado))
                end
            end
        
            if numeroResultados == 0 && erro then
        
                mprintf(mensagemErroCalculo)
        
            end
       
       elseif erro
           
           mprintf(mensagemErroCalculo)
           
       else
           
           imprimeValores(resultados) 
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

3 -> O utilizador deseja realizar a multiplicação vetorial;

4 -> O utilizador deseja realizar a multiplicação matricial;

5 -> O utilizador deseja gerar gráfico de derivada de função;

6 -> O utilizador deseja calcular área de curva de função;

7 -> O utilizador deseja gerar gráficos de funções pré-definidas;

8 -> O utilizador deseja realizar exibir o último cálculo realizado;

9 -> O utilizador deseja limpar o console do scilab;

10 -> O utilizador deseja finalizar o programa.

Valor inicial -> opcao = 1

*/
opcao = 1  

menuInicial = list('1 - Realizar cálculo com dois operandos','2 - Realizar cálculo com três operandos', '3 - Multiplicar vetores', '4 - Multiplicar matrizes', '5 - Gerar gráfico de derivada de função', '6 - Calcular área de curva de função', '7 - Gerar gráficos de funções pré-definidas', '8 - Exibir o último cálculo realizado', '9 - Limpar console', '10 - Finalizar programa')

/*A variável ultimoCalculo indica se já foi realizado algum cálculo anteriormente. Pode assumir dois valores distintos:

ultimoCalculo = %f -> não foi realizado nenhum cálculo até o presente momento;

ultimoCalculo = %t -> já foi realizado pelo menos um cálculo até o presente momento.

*/
ultimoCalculo = %f

mensagemCalculo = 'o resultado do cálculo é: '

while opcao <> 10

    //Retorna o valor da mensagemCalculo para o valor inicial, em caso de escolha da opção 3.
    if opcao == 8 then
        mensagemCalculo = "o resultado do cálculo é: "
    end
    
    opcao = menu(%f,'======= Calculadora S =======','digite a opção desejada: ', menuInicial)

    
    select opcao
        
        case 1 then [resultado,erro,mensagemErroCalculo,operandos,operacao] = realizaCalculo(-1,2,nome)          
        
        case 2 then [resultado,erro,mensagemErroCalculo,operandos,operacao] = realizaCalculo(-1,3,nome)

        case 3 then [resultado,erro,mensagemErroCalculo,operandos,operacao] = realizaCalculo(0,2,nome)
        
        case 4 then [resultado,erro,mensagemErroCalculo,operandos,operacao] = realizaCalculo(1,2,nome)
        
        case 5 then [resultado,erro,mensagemErroCalculo,operandos,operacao] = realizaCalculo(2,2,nome)
        
                    if erro == %f then
                        desenhaGrafico(1,operandos(1):.1:operandos(2),resultado)
                    end
                    
        case 6 then [resultado,erro,mensagemErroCalculo,operandos,operacao] = realizaCalculo(3,2,nome)
            
        case 7 then geraGraficosFuncoes(nome)
            
        case 8 then 
            
            if ultimoCalculo then
                
                mensagemCalculo = 'o último cálculo realizado foi: '
                
            else
                
                mensagemCalculo = 'não foi realizado nenhum cálculo até o presente momento.'
                
            end
            
        case 9 clc()
            
        case 10 then mprintf('\n\nPrograma finalizado.')
    
        else mprintf('\n\nOpção inválida.')
    
    end

    //Imprime mensagem relacionada ao cálculo, caso as opções 1,2, ou 5 sejam selecionadas.
    if (opcao > 0 && opcao  < 7) || (opcao == 8 && ultimoCalculo) then
        imprimeCalculo(mensagemCalculo,nome,mensagemErroCalculo,resultado,erro,operacao,operandos)
    elseif opcao == 8
        imprimeCalculo(mensagemCalculo,nome) 
    end
    
    //Atribui o valor de verdadeiro (%t) quando o primeiro cálculo for efetuado.
    if ultimoCalculo == %f then
        ultimoCalculo = opcao > 0 && opcao < 7
    end
    
    mprintf("\n\n")
end

mprintf('%s, espero que tenhas um dia espetacular! :-D\n\n', nome)

// ======= Fim da execução do programa =======
