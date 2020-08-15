//Exemplos de utilização do comando while

//Exemplo 1
mprintf('Exemplo1  - WHILE\n')
indice=1 //Neste caso o uso do i [ao invés de indice] também é aceitável.
while indice <= 100 
	mprintf('Linha %i\n',indice)
	indice= indice + 1
end

mprintf('Fim da execucao.\n')

//Exemplo 2
mprintf('Exemplo2  - WHILE\n')
inicio=1
fim=100
indice = inicio

while indice <= fim
	mprintf('Linha %i\n',indice)
	indice= indice + 1
end

mprintf('Fim da execucao.\n')

//Exemplo 3 - Laço decrescente
mprintf('Exemplo3  - WHILE\n')
inicio=100
fim=0
indice = inicio
while indice > 0
	mprintf('Linha %i\n',indice)
	indice= indice - 1
end

mprintf('Fim da execucao.\n')
