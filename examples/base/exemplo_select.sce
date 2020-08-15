//Exemplos de utilização do comando select.

//Exemplo 1
mprintf('Exemplo1  - SELECT\n')
opcao= input('Informe a opcao desejada [1,2, ou 3]]: ')

select opcao

	case 1 then mprintf('Opcao %i selecionada.\n', opcao)
	case 2 then mprintf('Opcao %i selecionada.\n', opcao)
	case 3 then mprintf('Opcao %i selecionada.\n', opcao)
	else mprintf('Opcao invalida.\n')

end

mprintf('Fim da execucao.\n')

//Exemplo 2
mprintf('Exemplo2  - SELECT\n')
opcao= input('Deseja continuar? [sim/nao]: ','s')

select opcao

	case 'sim' then mprintf('Opcao %s selecionada.\n', opcao)
	case 'nao' then mprintf('Opcao %s selecionada.\n', opcao)
	else mprintf('Opcao invalida.\n')

end

mprintf('Fim da execucao.\n')
