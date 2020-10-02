//Este programa calcula as operações aritméticas de adição, subtração, multiplicação, e divisão entre dois polinômios informados pelo utilizador. Todas as operações são realizadas a considerar o polinômio1 como operando à esquerda da operação, e o polinômio2 como operando à direita da operação. Ao final, o programa exibe os polinômios resultantes no console, e desenha os gráficos com base nos intervalos informados pelo utilizador para cada polinômio resultante.


//Esta função calcula a soma de dois polinômios.
function pResultado=pSoma(polinomio1, polinomio2)
    pResultado = polinomio1 + polinomio2
endfunction

//Esta função calcula a subtração de dois polinômios.
function pResultado=pSubtracao(polinomio1, polinomio2)
    pResultado = polinomio1 - polinomio2
endfunction

//Esta função calcula a multiplicação de dois polinômios.
function pResultado=pMultiplicacao(polinomio1, polinomio2)
    pResultado = polinomio1 * polinomio2
endfunction

//Esta função calcula a divisão de dois polinômios.
function [pQuociente,pResto]=pDivisao(polinomio1, polinomio2)
    [pQuociente,pResto] = pdiv(polinomio1,polinomio2)
endfunction


/*Esta função permite invocar funções com 2 argumentos de entrada, tais como as funções definidas anteriormente.
  Os dois argumentos de entrada, e a variável que representa o nome da função a ser invocada, são informados.
*/
function listaResultado=invocaFuncao2Argumentos(argumentoEntrada1, argumentoEntrada2, funcao)
    
    variaveis = macrovar(funcao)
    
    if size(variaveis(2), 'r') == 1 then
        listaResultado = list(funcao(argumentoEntrada1,argumentoEntrada2))
        
    elseif size(variaveis(2), 'r') == 2 then
        
            [argumentoSaida1, argumentoSaida2] = funcao(polinomio1,polinomio2)    
            listaResultado = list(argumentoSaida1,argumentoSaida2)
    end
    
endfunction


/*Esta função permite invocar um número variável de funções com 2 argumentos de entrada.
  Os dois argumentos de entrada, e o conjunto de variáveis a representar os nomes das funções a serem invocadas, são informados.
*/
function listaResultado=invocaFuncoes2Argumentos(argumentoEntrada1, argumentoEntrada2, varargin)
    
    for i = 1: size(varargin)
        funcao = varargin(i)
        
        if i == 1 then
            
            listaResultado = invocaFuncao2Argumentos(argumentoEntrada1, argumentoEntrada2, funcao)
            
       else
           listaResultado = lstcat(listaResultado, invocaFuncao2Argumentos(argumentoEntrada1, argumentoEntrada2, funcao))
        end        
    end
endfunction

//Esta função permite desenhar gráficos a considerar a divisão da janela gráfica com auxílio da função subplot().
function desenhaGrafico(linhas,colunas,indice,x,y,titulo,limpaJanela)
    
    if limpaJanela == %t then
        clf()
    end
    
    subplot(linhas,colunas,indice)
    plot(x,y)
    title(titulo)
    
endfunction

//Esta função permite desenhar um conjunto de gráficos com base nas matrizes x e y, bem com os títulos informados.
function desenhaGraficosPolinomios(linhas,titulos,matrizX, matrizY)
    
    numeroPolinomios = size(matrizY,'r')
    numeroValoresIntervalo = size(matrizY, 'c')
    
    colunas = ceil(numeroPolinomios/linhas)
    
    for i = 1 : numeroPolinomios
        desenhaGrafico(linhas,colunas,i,matrizX(i,1:numeroValoresIntervalo), matrizY(i,1:numeroValoresIntervalo), titulos(i), i == 1)
    end
    
endfunction


//Esta função realiza o cálculo das operações aritméticas de dois polinômios informados pelo utilizador. 
function [titulos, matrizY]=calculaOperacoesAritmeticas(polinomio1, polinomio2, matrizX, titulos, imprimePolinomios)
    
    listaResultado = invocaFuncoes2Argumentos(polinomio1, polinomio2, pSoma, pSubtracao, pMultiplicacao, pDivisao)
    
    numeroIntervalos = size(matrizX,'r')
    numeroValoresNoIntervalo = size(matrizX, 'c')
    
    for i = 1 : numeroIntervalos
        matrizY(i,1:numeroValoresNoIntervalo) = horner(listaResultado(i),matrizX(i,1:numeroValoresNoIntervalo))
        
        if imprimePolinomios then
            disp(listaResultado(i), titulos(i))
        end
    end
    
endfunction


coeficientesP1 = input('Digite o vetor de coeficientes do polinômio 1: ')

coeficientesP2 = input('Digite o vetor de coeficientes do polinômio 2: ')

matrizX = input('Digite a matriz de intervalos para o desenho dos gráficos dos 5 polinômios [adição;subtração; multiplicação;divisão(quociente), divisao(resto)]: ')

p1 = poly(coeficientesP1, 'x', 'coeff')

p2 = poly(coeficientesP2, 'x', 'coeff')

titulos = ['Adição:', 'Subtração:', 'Multiplicação:', 'Divisão (quociente):', 'Divisão (resto):']

[titulos,matrizY] = calculaOperacoesAritmeticas(p1, p2, matrizX,titulos, %t)

desenhaGraficosPolinomios(2,titulos,matrizX, matrizY)
