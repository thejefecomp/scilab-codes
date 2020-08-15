//Exemplos de utilização do comando if.

//Exemplo 1
mprintf('Exemplo1  - IF\n')
nota= input('Informe a sua nota: ')

if nota >= 7 then
	mprintf('Aluno aprovado.\n')
end

mprintf('Fim da execução.\n')

//Exemplo 2
mprintf('Exemplo2  - IF\n')
nota= input('Informe a sua nota: ')

if nota >= 7 then
	mprintf('Aluno aprovado.\n')
else
	mprintf('Aluno reprovado.\n')
end

mprintf('Fim da execução.\n')

//Exemplo 3
mprintf('Exemplo3  - IF\n')
nota= input('Informe a sua nota: ')

if nota >= 7 then
	mprintf('Aluno aprovado.\n')
elseif nota >=2
	mprintf('Aluno em exame.\n')
else
	mprintf('Aluno reprovado.\n')
end

mprintf('Fim da execução.\n')
