//Exemplos de utilização do comando for.

//Exemplo 1
mprintf('Exemplo1  - FOR\n')

for indice=1:100 //Neste caso o uso do i [ao invés de indice] também é aceitável.
	mprintf('Linha %i\n',indice)
end

mprintf('Fim da execucao.\n')

//Exemplo 2
mprintf('Exemplo2  - FOR\n')
inicio=1
fim=100

for indice=inicio:fim
	mprintf('Linha %i\n',indice)
end

mprintf('Fim da execucao.\n')

//Exemplo 3 - Laço decrescente
mprintf('Exemplo3  - FOR\n')
inicio=-99
fim=0

for indice=inicio:fim
	mprintf('Linha %i\n',indice)
end

mprintf('Fim da execucao.\n')

//Exemplo 4 - Laço decrescente avançado
mprintf('Exemplo4  - FOR\n')

for indice=99:-1:0
	mprintf('Linha %i\n',indice)
end

mprintf('Fim da execucao.\n')
