/*


Author: Jeferson Souza (thejefecomp) - jeferson.souza@udesc.br

Source: Project Euler - https://projecteuler.net/problem=122

Description

The most naive way of computing n15 requires fourteen multiplications:

n × n × ... × n = n^15

But using a "binary" method you can compute it in six multiplications:

n × n = n^2
n^2 × n^2 = n^4
n^4 × n^4 = n^8
n^8 × n^4 = n^12
n^12 × n^2 = n^14
n^14 × n = n^15

However it is yet possible to compute it in only five multiplications:

n × n = n^2
n^2 × n = n^3
n^3 × n^3 = n^6
n^6 × n^6 = n^12
n^12 × n^3 = n^15

We shall define m(k) to be the minimum number of multiplications to compute nk; for example m(15) = 5.

For 1 ≤ k ≤ 200, find ∑ m(k).

*/

function minimoMultiplicacoes=m(k,depurar)


	if k < 0 then 

		k = k * -1
	end

	
	if k <= 1 then
		
		numeroMultiplicacoes = 0
	else

		expoenteCorrente = 2
		numeroMultiplicacoes = 1

		if depurar then

			mprintf('\n\n1. n x n = n^2\n\n')
		end

		if modulo(k,2) == 1 then

			expoenteCorrente = 3
			numeroMultiplicacoes = 2

			if depurar then

				mprintf('2. n^2 x n = n^3\n\n')
			end
		end

		expoenteComplementar = 0


		/*
			Executado enquanto expoente corrente não for igual ao expoente alvo, i.e. k.
		*/
		while expoenteCorrente < k

			expoenteResultante = expoenteCorrente * 2

			/*
				Somente entra na rotina de busca de expoente calculado anteriormente
				se o valor da duplicação do expoenteCorrente for maior que o expoente
				alvo (i.e. k),
			*/
			if expoenteResultante > k then

				if expoenteComplementar == 0 then
					expoenteComplementar = expoenteCorrente
				end

				continuar = %t
				

				/*
					Procura o maior exponente calculado anteriormente para compor a nova multiplicação
					Caso essa operação já tenha sido feita (expoenteComplementar > 0), a rotina continua
					do último expoente utilizado para compor a última multiplicação.
				*/
				while continuar

					if expoenteComplementar > 1 then					

						expoenteComplementar = ceil(expoenteComplementar / 2)
					end

					expoenteResultante = expoenteCorrente + expoenteComplementar

					if expoenteResultante <= k then
						
						continuar = %f
					end
				end
			else
				expoenteComplementar = expoenteCorrente
			end

			numeroMultiplicacoes = numeroMultiplicacoes + 1

			if depurar then
				
				mprintf('%d. n^%d x n^%d = n^%d\n\n',numeroMultiplicacoes,expoenteCorrente,expoenteComplementar,expoenteResultante)
			end		

			expoenteCorrente = expoenteResultante
		end
	end

	minimoMultiplicacoes = numeroMultiplicacoes

endfunction



for i=1:200
	
	somatorio = m(i,%t)
end

mprintf('somatorio = %d', somatorio)
