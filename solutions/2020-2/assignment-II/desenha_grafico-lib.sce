/*
Este arquivo especifica um conjunto de funções para auxiliar desenvolvedores no desenho de gráficos com o Scilab.
*/

//Esta função permite o desenho de gráficos 2D em uma janela gráfica única, ou em células de uma mesma janela.
function erro=desenhaGrafico(limpaJanela,x,y,varargin)
	
	erro = 0
	
	if limpaJanela == 1 then
		clf()
	end

	numeroEntradas = length(varargin)
	
	if numeroEntradas == 3 then
		subplot(varargin(1), varargin(2), varargin(3))	
	elseif numeroEntradas > 0
		erro = -1
	end

	plot(x,y)
			
endfunction

// Esta função permite o desenho de gráficos a receber múltiplas séries de dados, as quais podem ser representadas graficamente em janelas separadas, ou em uma única janela gráfica dividida em múltiplas celulas.
function erro = desenhaGraficos(ehColuna, valor,janelaSeparada, varargin)

	erro = 0

	numeroEntradas = length(varargin)

	/*
		pares = numeroEntradas / 2
		
		if (int(pares) - pares) == 0 then
		
		else
			erro = -1
		end
	*/

	if (numeroEntradas > 0) && (modulo(numeroEntradas,2)) == 0 then
		
		pares = numeroEntradas / 2

		if janelaSeparada == %f then

			if ehColuna == 1 then
			
				colunas = valor

				linhas = ceil(pares / colunas)

			else

				linhas = valor

				colunas = ceil(pares / linhas)
			end
		end

		contadorGraficos = 1

		for i=1:2:numeroEntradas

			//if janelaSeparada == %t then
			if janelaSeparada then
			
				//desenho de gráficos com janelas separadas.				
				show_window(contadorGraficos)
				desenhaGrafico(1,varargin(i), varargin(i+1))

			else

				//desenho de gráficos com o subplot().
				desenhaGrafico(i,varargin(i),varargin(i+1),linhas,colunas,contadorGraficos)
			end

			contadorGraficos = contadorGraficos + 1
				
		end
		
	else
		erro  = -1
	end

endfunction
