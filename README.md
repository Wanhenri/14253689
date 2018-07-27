# 4. Obtenção/configuração/compilação e execução do pacote Sistema de Previsão por Conjunto Global do CPTEC - SPCON 

Nessa seção são apresentadas as informações para se fazer o download de todo o pacote na conta do usuário, bem como a configuração para criar a estrutura de diretórios, a instalação dos pacotes incluindo as bibliotecas e finalmente a execução usando dados de um testcase também disponível na distribuição.

## 4.1. Obtenção do SPCON

O pacote de instalação do SPCON está disponível a partir do repositório SVN do CPTEC, nos ramos trunk (para os desenvolvedores) ou tag (para os usuários não desenvolvedores). O código principal de todas as versões poderá ser visualizado dentro do gerenciador de projetos Redmine, inclusive a versão em desenvolvimento no ramo trunk com as modificações mais recentes.

Para acessar a versão do código do sistema SPCON, as seguintes etapas deverão ser realizadas:
	
###### 1.Login no supercomputador TUPA:
	
		```
		$ ssh ************************* -XC
		```
###### 2.Acessar o diretório home do usuário no _scratchin_ **(/scratchin/grupos/ensemble/home/${USER})**, o que pode ser feito via variável **$SUBMIT_HOME**:
	
	
		```sh
		$ cd $SUBMIT_HOME
		```
	
###### 3.Extração do código do **SPCON** do ramo _trunk_ para a raiz do usuário no scratchin usando o comando 'co'(commit no svn):
	
		```sh
		$ svn co https://svn.cptec.inpe.br/smg/trunk/spcon **<nome_dir>**
		```
		recomenda-se colocar: oensMB09_<nome>
		Em <nome> acrescentar uma terminação para diferenciar umas das outras. No caso de ter varias versões do original.
	
###### 3.1. Os seguintes pacotes de códigos e estruturas
	- [x] Makefile
	- [x] README
	- [x] change_res.ksh
	- [x] config
	- [x] config_spcon.ksh
	- [x] decanl
	- [x] deceof
	- [x] eof
	- [x] eofhumi
	- [x] eofpres
	- [x] eoftemp
	- [x] eofwind
	- [x] fftpln
	- [x] include
	- [x] rdpert
	- [x] recanl
	- [x] recfct
	- [x] run	


###### 4.caso um erro ocorra por indicar que a versão não exista, ou para certificar que esta baixando a versão mais recente, use o comando list para avaliar 	o numero da última versão/revisão e escolhe-la com o comando anterior. Para listar as versões, digite:
	
		```
		$ svn list https://svn.cptec.inpe.br/smg/trunk/spcon
		```
	
No final dessa fase um diretório será criado no home do usuário no disco scratchin com todos o pacote de código e estrutura de diretórios SPCON, sendo esse diretório denominado com o nome dado na etapa numero 3 (**<nome_dir>**) para o ramo _trunk_.


## 4.2. Instalação e Configuração do SPCON

Nesta etapa a instalação e a configuração do SPCON compreendem na modificação de caminhos e a compilação de seu código fonte, que envolve o (?????) e o BAM (Brazilian Atmospheric Model). Para facilitar esta tarefa, foi criado o script config_smg.ksh que automatiza este processo. Sua utilização é apresentada a seguir.

Entre na pasta oensMB09_**<nome>** criada anteriormente, e execute o comando:

	```sh
	$ cd SMG
	$ ./config_spcon.ksh
	```


O script config_spcon.ksh possui algumas opções para execução. As opções disponíveis são as seguintes:

configurar -  cria diretórios e links simbólicos da instalação para a resolução **TQ0126L028** (default)
compilar - compila os módulos de perturbação e o modelo **BAM**
testcase - aloca os dados necessários para testar a instalação
ajuda - mostra mensagem de ajuda para usuário, o qual também é feito na ausência de argumentos de entrada.

**ATENÇÃO:**
1. o script config_spcon.ksh possui quatro variáveis principais que comandam todo o processo de configuração e instalação, as quais são listadas abaixo com respectivos valores recebidos por padrão:	
2. a variável $spcon_name deverá ser modificada para que fica de coerente. _!!!criar código para que copie nome automatico!!_

	```sh
	$spcon_name = oensMB09_<nome>
	$HOME = ${SUBMIT_HOME}
	$SUBMIT_HOME = ${SUBMIT_HOME}
	$WORK_HOME = ${WORK_HOME}
	```

Porém podem ser alterados de acordo com as necessidades de cada usuário. Assim, o primeiro passo é verificar no script config_spcon.ksh se estas variáveis estão corretas ou devem ser alteradas. 

Some Markdown text with <span style="color:blue">some *blue* text</span>.
<span style="color:blue">teste</span>.
<p>Some Markdown text with <span style="color:blue">some <em>blue</em> text</span>.</p>


![#f03c15] OBS.2 `#f03c15` Recomenda-se a instalação do pacote no scratchin, uma vez que o home tem espaço bastante restrito e não será possível a instalação de muitos outros sistemas nesse mesmo disco. O scratchin tem mais espaço, mas tem a desvantagem de não ter backup, o que pode ser desconsiderado uma vez que a versão está armazenada no SVN, e nele deposita-se a confiança de salvaguarda dos códigos do CPTEC

![#f03c15] OBS.2: `#f03c15` Lembre-se que alterando alguma destas variáveis as instruções abaixo podem não funcionar corretamente copiando e colando o comando no terminal, deve-se colocar o devido valor definido dentro do script _config_smg.ksh_

	Para criar a estrutura (?????), basta digitar em sequencia:
	```sh
	$ ./config_spcon.ksh configurar
	```

Por padrão, o sistema é configurado para submeter todos os jobs a partir do **$SUBMIT_HOME**, por isso, toda a estrutura com os dados de entrada e saída é montada por padrão em **$SUBMIT_HOME/SMG** (onde são realizadas as submissões e os processamentos) e em **$WORK_HOME/SMG** (onde são armazenados os resultados).Antes de executar o comando configurar, o usuário deverá revisar as variáveis da função _vars_export_ do script _config_spcon.ksh_ e fazer as modificações que achar necessárias. Após isso, deverá ser executado o comando acima.



