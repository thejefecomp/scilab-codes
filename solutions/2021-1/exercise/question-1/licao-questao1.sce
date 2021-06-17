/*
Escreva um pequeno programa que solicite dois números ao utilizador, realize a soma desses dois números, e imprima o resultado no console.
*/

numero1 = input('Digite o valor do primeiro número: ')

numero2 = input('Digite o valor do segundo número: ')


// Opção 1: usar o disp() para imprimir o resultado diretamente.
mprintf('Opção 1\n')
disp(resultado)

// Opção 2: usar o disp() para imprimir o resultado com uma mensagem associada.
mprintf('Opção 2\n')
disp(resultado, 'O resultado da soma é: ')

// Opção 3: usar o mprintf() para imprimir o resultado diretamente.
mprintf('Opção 3\n')
mprintf('%f', resultado)

// Opção 4: usar o mprintf() para imprimir o resultado com uma mensagem associada.
mprintf('\nOpção 4\n')
mprintf('O resultado da soma é: %f', resultado)
