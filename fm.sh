#!/bin/bash


principal() 

{           #principal função desse programa , ele retornará pra cá em caso de alguma opção inválida.
    clear               # limpa toda a tela

    echo "1)Mostra a localização do usuário no sistema de arquivos"  
    echo "2)Mostra o tipo de um arquivo"  
    echo "3)Criar um diretório"
    echo "4)Apagar um diretório não vazio"
    echo "5)ler 2 números e indicar qual é o maior deles e qual é o menor"
    echo "6)Exibir as últimas linhas de um arquivo"
    echo "7)Exibir as primeiras linhas de um arquivo"
    echo "8)Mostrar a localização de um comando específico"
    echo "9)Mostra um diretório informado pelo usuário"
    echo "10)Copiar um arquivo para um outro diretório"
    echo "11)Mover um arquivo para outro diretório"
    echo "12)Sair"

    echo
    echo -n "Qual a opcao desejada ? "
	    read opcao   #A variável "opcao" será utilizada no comando case para indicar qual a opção a ser utilizada.
                        
    case $opcao in
        1)              #caso o resultado da variavel seja igual a "1", então ele fará as instruções abaixo
            clear	#limpa a tela
			localizacaoarquivos
		;;                                
        2)
            clear	#limpa a tela
			mostrartipoarquivo           
		;; 

        3)
            clear	#limpa a tela
           	criardiretorio
		;; 
        4)
            clear	#limpa a tela
			deletardiretorio		
		;; 
        5)
            clear	#limpa a tela
			mostramaior   
		;;
        6)
	    clear	#limpa a tela
			ultimaslinhas
        ;; 
        7)
            clear
			primeiraslinhas
        ;; 
		8)
            clear	#limpa a tela
			localizarcomando          
		;; 
        9)
            clear	#limpa a tela
			diretorioformarvore
        ;; 
        10)
            clear	#limpa a tela
			copiararquivo
        ;; 
        11)
            clear	#limpa a tela
           	moverarquivo
		;; 
		12)
            clear	#limpa a tela
            exit ;;

        *)              
            clear	#limpa a tela
            echo "Opcao desconhecida."
            read pause
            principal   
        ;;
    esac
}

localizacaoarquivos() {             # função da opção localização arquivos
    pwd 
    read pause          #pausa o script
    principal           #volta para a função principal
}

mostrartipoarquivo() {             # função informa o que é o arquivo se é um texto ou um shell script por exemplo 
    clear	#limpa a tela
    echo "digite arquivo"
	read ARQUIVO
	file $ARQUIVO	
    read pause
    principal
}

criardiretorio() {             # função cria um novo diretorio com o nome que o usuario indicar
    clear	#limpa a tela
    echo "digite o diretorio que voce quer criar"
	read DIRETORIO
	mkdir $DIRETORIO
    read pause
	principal	
}

deletardiretorio() {             # função deleta o diretorio informado pelo usuario
    clear	#limpa a tela
	echo "digite o diretorio que quer deletar"
	read DIRETORIO
	rm -r $DIRETORIO 	
    read pause
    principal
}

mostramaior() {             # função o usuario informa dois numeros e a função retorna o maior
    clear	#limpa a tela
	echo "digite o primeiro numero"
		read NUMERO1
		echo "digite o segundo numero"
		read NUMERO2
		if [ $NUMERO1 -gt $NUMERO2 ]; then
			
			echo "O numero maior é: " $NUMERO1
		else
			echo "O numero maior é: " $NUMERO2
		fi
	read pause
    principal		
    
}

ultimaslinhas() {             # essa função mostra as ultimas linhas de um texto
    clear
	echo "digite o nome do arquivo"
	read ARQUIVO
	echo "digite a quantidade de linha que quer exibir"
	read LINHAS
	tail -$LINHAS $ARQUIVO
    read pause 
	principal	
}

primeiraslinhas() {             # essa função mostra as primeiras linhas de um texto
    clear
	echo "digite o nome do arquivo"
	read ARQUIVO
	echo "digite a quantidade de linha que quer exibir"
	read LINHAS
	head -$LINHAS $ARQUIVO
    read pause
	principal	
}

localizarcomando() {             # função informa a localização de um comando
	clear
    echo "Digite o comando"
	read COMANDO
	which $COMANDO 
    read pause          
    principal           
}

diretorioformarvore() {             # função informa a localização de um arquivo em formato de árvore
    clear
	echo "Digite o Diretorio"
	read DIRETORIO
	tree $DIRETORIO
    read pause          
    principal           
}

copiararquivo() {             # função copia um arquivo para um diretorio informado pelo usuario
    clear
	echo "Digite o arquivo que deseja copiar"
	read ARQUIVO
	echo "Digite para onde deseja copiar o arquivo"
	read LOCAL
	cp $ARQUIVO $LOCAL  
    read pause          
    principal           
}

moverarquivo() {             # função move um arquivo para um diretorio informado pelo usuario
    clear
    echo "Qual o arquivo que você deseja mover ?"
	read ARQUIVO
	echo "Digite para onde você deseja mover e o nome do arquivo"
	read LOCAL
	mv $ARQUIVO $LOCAL  
    read pause          
    principal            
}

opcaoinvalida() {      # Função da opção inválida
    clear
    echo "Opcao desconhecida."
    read pause
    principal
}

principal               # Retorna a função principal desse programa
