/*Escreva um pequeno programa em Scilab que solicite o nome do utilizador e sua idade. Com base no uso do comando if o programa deve imprimir o nome do utilizador seguido de uma das seguintes mensagens:

 - "Você é do tempo do Guaraná com rolha!" para pessoas com idade acima dos 50 anos;

 - "Você é do tempo do Rollmops (famoso peixe em conserva consumido em Joinville :-D)!" para pessoas com idade entre 41 e 50 anos;

- "Você é do tempo do Pão com Molho,  da Laranjinha, e do Baré Cola!" para pessoas com idade entre 35 e 40 anos;

- "Você é do tempo do Distanciamento Social" para pessoas com idade abaixo dos 35 anos.*/

nome = input('Digite o seu nome: ', 's')

idade = input('Digite a sua idade: ')

mprintf('%s, ', nome)

/*
Todas as condicionais podem trocar de posição sem alterar o resultado do programa.

Detalhes: 

1 - Faz mais comparações;

2 - Mais intuitivo para leitura (a considerar a nossa língua escrita da esquerda para a direita) e entendimento do encadeamento das condicionais.

*/

if idade > 50 then

	mprintf("Você é do tempo do Guaraná com rolha!")

elseif (idade > 40) && (idade < 51)

	mprintf("Você é do tempo do Rollmops (famoso peixe em conserva consumido em Joinville :-D!)")

elseif (idade > 34) && (idade < 41)

	mprintf("Você é do tempo do Pão com Molho, da Laraninha, e do Baré Cola!")

elseif (idade < 35) && (idade > 0)

	mprintf("Você é do tempo do Distanciamento Social")

end
