#!/bin/bash

DEBUG=1		#Depuração: 0 desliga, 1 liga

# Função de depuração
Debug(){
	[ "$DEBUG" = 1 ] && echo -e "\033[31;1m --------------------{\033[m \033[33;1m$*\033[m"
}

TXT="gritaria"

TXT="     $TXT     "  # Add 5 espaços ao redor

Debug "TXT com espaços     :[$TXT]"
TXT=$(echo "$TXT" | tr ' ' '!!')  # Troca os espaços por exclamações
Debug "TXT com exclamações: [$TXT]"

TXT=$(echo $TXT | tr a-z A-Z) # Deixa o texto em maiúsculo
echo "$TXT"		      # Mostra a mensagem
