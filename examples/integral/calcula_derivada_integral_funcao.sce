/*
Este programa permite o cálculo da derivada ou da área da curva de uma função informada pelo utilizador. O cálculo é realizado com base em um intervalo representado por dois valores, os limites inferior e superior. Como resultado o programa calcula a derivada e desenha um gráfico dentro do intervalo especificado, ou calcula a área e retorna o valor calculado.
*/

//Esta função calcula o valor da derivada para uma função informada pelo utilizador, a retornar um vetor com os valores do intervalo em x, e seus correspondentes valores da derivada em y
function [x,y]=calculaDerivada(corpoFuncao,limiteInferior,limiteSuperior)
    
    x = limiteInferior:.1:limiteSuperior
    
    assinaturaFuncao = 'y = f(x)'
    //carrega a função f(x) com o corpo informado pelo utilizador.
    deff(assinaturaFuncao, corpoFuncao)
    
    matrizDerivada = numderivative(f,x)
    
    numeroLinhas  = size(matrizDerivada, 'r')
    
    for i = 1:numeroLinhas
        y(1,i) = matrizDerivada(i,i)
    end
endfunction

opcao = 1

while opcao <> 3
    
    mprintf("\n\n=====================\n")
    mprintf("\n1 - Calcula derivada da funcao\n")
    mprintf("\n2 - Calcula area da funcao\n")
    mprintf("\n3 - Sair\n")
    mprintf("\n=====================\n\n")
    
    opcao = input("Digite a opção desejada: ")

    if opcao < 1 || opcao > 3 then
        mprintf("\n\n Opção inválida.")
    elseif opcao < 3
        corpoFuncao = input('Digite a função para computar a derivada [exemplo: y = x.^2 +5]. Note que a função é informada como um conjunto de caracteres (sem a necessidade de aspas): ', 's')

        erroLimite = %t

        while erroLimite
            
            limiteInferior = input('Digite o limite inferior do intervalo no eixo x: ')
            
            limiteSuperior = input('Digite o limite superior do intervalo no eixo x: ')
            
            if limiteSuperior >= limiteInferior then
                erroLimite = %f
            else
                mprintf('\n\nO valor do limite superior é menor que o valor do limite inferior. Por favor, informe novamente os valores.\n\n')
            end
        end
        
        select opcao 
            case 1 then
                
                [x,y] = calculaDerivada(corpoFuncao,limiteInferior,limiteSuperior)
                clf()
                plot(x,y)
            
        case 2 then
            
                mprintf('\n\nO valor da area da curva da funcao %s, para o intervalo de %f até %f é: %f\n\n',corpoFuncao,limiteInferior,limiteSuperior,integrate(corpoFuncao,'x',limiteInferior,limiteSuperior))
                
        end   
   end
end
