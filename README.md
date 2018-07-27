VERSAO 1.1
# 4. Obtenção/configuração/compilação e execução do pacote Sistema de Previsão por Conjunto Global do CPTEC - SPCON 

Nessa seção são apresentadas as informações para se fazer o download de todo o pacote na conta do usuário, bem como a configuração para criar a estrutura de diretórios, a instalação dos pacotes incluindo as bibliotecas e finalmente a execução usando dados de um testcase também disponível na distribuição.

## 4.1. Obtenção do SPCON

O pacote de instalação do SPCON está disponível a partir do repositório SVN do CPTEC, nos ramos trunk (para os desenvolvedores) ou tag (para os usuários não desenvolvedores). O código principal de todas as versões poderá ser visualizado dentro do gerenciador de projetos Redmine, inclusive a versão em desenvolvimento no ramo trunk com as modificações mais recentes.

Para acessar a versão do código do sistema SPCON, as seguintes etapas deverão ser realizadas:
	
###### 1.Login no supercomputador TUPA:
	
```sh
$ ssh ************************* -XC
```

###### 2.Acessar o diretório home do usuário no scratchin(/scratchin/grupos/ensemble/home/${USER}), o que pode ser feito via variável $SUBMIT_HOME:
	
	
```sh
$ cd $SUBMIT_HOME
```
	
###### 3.Extração do código do SPCON do ramo trunk para a raiz do usuário no scratchin usando o comando 'co'(commit no svn):
	
```sh
$ svn co https://svn.cptec.inpe.br/smg/trunk/spcon  <nome_dir>
```
recomenda-se colocar: oensMB09_`<nome>`
Em nome acrescentar uma terminação para diferenciar umas das outras. No caso de ter varias versões do original.
	
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
	
```sh
$ svn list https://svn.cptec.inpe.br/smg/trunk/spcon
```
	
No final dessa fase um diretório será criado no home do usuário no disco scratchin com todos o pacote de código e estrutura de diretórios SPCON, sendo esse diretório denominado com o nome dado na etapa numero 3 (**nome_dir**) para o ramo _trunk_.


## 4.2. Instalação e Configuração do SPCON

Nesta etapa a instalação e a configuração do SPCON compreendem na modificação de caminhos e a compilação de seu código fonte, que envolve o (**?????**) e o **BAM** (Brazilian Atmospheric Model). Para facilitar esta tarefa, foi criado o script config_smg.ksh que automatiza este processo. Sua utilização é apresentada a seguir.

Entre na pasta oensMB09_**nome** criada anteriormente, e execute o comando:

```sh
$ cd oensMB09_<nome>
$ ./config_spcon.ksh
```

O script config_spcon.ksh possui algumas opções para execução. As opções disponíveis são as seguintes:

**configurar** -  cria diretórios e links simbólicos da instalação para a resolução **TQ0126L028** (default)
**compilar** - compila os módulos de perturbação e o modelo **BAM**
**testcase** - aloca os dados necessários para testar a instalação
**ajuda** - mostra mensagem de ajuda para usuário, o qual também é feito na ausência de argumentos de entrada.

**ATENÇÃO:**
1. o script _config_spcon.ksh_ possui quatro variáveis principais que comandam todo o processo de configuração e instalação, as quais são listadas abaixo com respectivos valores recebidos por padrão:	
2. a variável **$spcon_name** deverá ser modificada para que fica de coerente.
**_!!!criar código para que copie nome automatico!!_**

	```sh
	$spcon_name = oensMB09_<nome>
	$HOME = ${SUBMIT_HOME}
	$SUBMIT_HOME = ${SUBMIT_HOME}
	$WORK_HOME = ${WORK_HOME}
	```

Porém podem ser alterados de acordo com as necessidades de cada usuário. Assim, o primeiro passo é verificar no script config_spcon.ksh se estas variáveis estão corretas ou devem ser alteradas. 

**_ OBS.2:_** Recomenda-se a instalação do pacote no scratchin, uma vez que o home tem espaço bastante restrito e não será possível a instalação de muitos outros sistemas nesse mesmo disco. O scratchin tem mais espaço, mas tem a desvantagem de não ter backup, o que pode ser desconsiderado uma vez que a versão está armazenada no SVN, e nele deposita-se a confiança de salvaguarda dos códigos do CPTEC

**_ OBS.2:_** Lembre-se que alterando alguma destas variáveis as instruções abaixo podem não funcionar corretamente copiando e colando o comando no terminal, deve-se colocar o devido valor definido dentro do script _config_smg.ksh_

###### 4.2.1 Exportar a ultima revisão do BAM (Brazilian Global Atmospheric Model) a partir do SVN do Sistema de Modelagem Global

```sh
$ ./config_spcon.ksh model
```

###### 4.2.2 realiza a exportação da ultima revisão do inctime a partir do SVN do Sistema de Modelagem Global

```sh
$ ./config_spcon.ksh inctime
```

###### 4.2.3 Para criar a estrutura (?????), basta digitar em sequencia:

```sh
$ ./config_spcon.ksh configurar
```

Por padrão, o sistema é configurado para submeter todos os jobs a partir do **$SUBMIT_HOME**, por isso, toda a estrutura com os dados de entrada e saída é montada por padrão em **$SUBMIT_HOME/SMG** (onde são realizadas as submissões e os processamentos) e em **$WORK_HOME/SMG** (onde são armazenados os resultados).Antes de executar o comando configurar, o usuário deverá revisar as variáveis da função _vars_export_ do script _config_spcon.ksh_ e fazer as modificações que achar necessárias. Após isso, deverá ser executado o comando acima.


###### 4.2.4 Realiza a copia dados de teste da instalação do SPCON

```sh
$ ./config_spcon.ksh testcase
```

 ###### 4.2.4 O passo seguinte é a compilação do pacote SPCON que contempla (??????) e demais utilitários (inctime para o cálculo das datas e outras bibliotecas). Para isto siga os passos abaixo:

Antes de utilizar o script config_spcon.ksh para compilar o SPCON, é necessário ajustar alguns parâmetros do ambiente em que se está logado no Tupã:

1.Certifique-se de que você está logado(a) na eslogin02:

```sh
$ uname -n
```

2 . Caso não esteja logado nela, logue-se da seguinte forma:

```sh
$ ssh -X eslogin02
```

3 . Executar o comando abaixo e escolher a opcao 6:

```sh
$ source /usr/bin/development_config
```
4 .  Alterar a versao do compilador:

```sh
$ module swap pgi pgi/11.10.0
```
5 . Executar o script de configuracao:

```sh
$ config_spcon.ksh
```
6 .  Compilar o pacote:

```sh
$ make comp=pgi
```

Para compilar o SPCON deve-se executar o script config_spcon.ksh com a opção compilar. Para isso siga os passos:

1. Entre no diretório onde fez o checkout ou o export do SMG:

```sh
cd ${SUBMIT_HOME}/
```

2 . Execute o script para configurar o ambiente:

```sh
$ ./config_smg.ksh configurar
```

######  4.2.1 Compilação do SPCON










VERSAO 1.0
# 4. Obtenção/configuração/compilação e execução do pacote Sistema de Previsão por Conjunto Global do CPTEC - SPCON 

Nessa seção são apresentadas as informações para se fazer o download de todo o pacote na conta do usuário, bem como a configuração para criar a estrutura de diretórios, a instalação dos pacotes incluindo as bibliotecas e finalmente a execução usando dados de um testcase também disponível na distribuição.

## 4.1. Obtenção do SPCON

O pacote de instalação do SPCON está disponível a partir do repositório SVN do CPTEC, nos ramos trunk (para os desenvolvedores) ou tag (para os usuários não desenvolvedores). O código principal de todas as versões poderá ser visualizado dentro do gerenciador de projetos Redmine, inclusive a versão em desenvolvimento no ramo trunk com as modificações mais recentes.

Para acessar a versão do código do sistema SPCON, as seguintes etapas deverão ser realizadas:
	
###### 1.Login no supercomputador TUPA:
	
```sh
$ ssh ************************* -XC
```

###### 2.Acessar o diretório home do usuário no scratchin(/scratchin/grupos/ensemble/home/${USER}), o que pode ser feito via variável $SUBMIT_HOME:
	
	
```sh
$ cd $SUBMIT_HOME
```
	
###### 3.Extração do código do SPCON do ramo trunk para a raiz do usuário no scratchin usando o comando 'co'(commit no svn):
	
```sh
$ svn co https://svn.cptec.inpe.br/smg/trunk/spcon **`nome_dir`**
```
recomenda-se colocar: oensMB09`nome`
Em nome acrescentar uma terminação para diferenciar umas das outras. No caso de ter varias versões do original.
	
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
	$ cd oensMB09_**<nome>**
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

**_ OBS.2:_** Recomenda-se a instalação do pacote no scratchin, uma vez que o home tem espaço bastante restrito e não será possível a instalação de muitos outros sistemas nesse mesmo disco. O scratchin tem mais espaço, mas tem a desvantagem de não ter backup, o que pode ser desconsiderado uma vez que a versão está armazenada no SVN, e nele deposita-se a confiança de salvaguarda dos códigos do CPTEC

**_ OBS.2:_** Lembre-se que alterando alguma destas variáveis as instruções abaixo podem não funcionar corretamente copiando e colando o comando no terminal, deve-se colocar o devido valor definido dentro do script _config_smg.ksh_

###### 4.2.1 Exportar a ultima revisão do BAM (Brazilian Global Atmospheric Model) a partir do SVN do Sistema de Modelagem Global

		```sh
		$ ./config_spcon.ksh model
		```

###### 4.2.2 realiza a exportação da ultima revisão do inctime a partir do SVN do Sistema de Modelagem Global

	```sh
	$ ./config_spcon.ksh inctime
	```

###### 4.2.3

	Para criar a estrutura (?????), basta digitar em sequencia:

	```
	$ ./config_spcon.ksh configurar
	```

Por padrão, o sistema é configurado para submeter todos os jobs a partir do **$SUBMIT_HOME**, por isso, toda a estrutura com os dados de entrada e saída é montada por padrão em **$SUBMIT_HOME/SMG** (onde são realizadas as submissões e os processamentos) e em **$WORK_HOME/SMG** (onde são armazenados os resultados).Antes de executar o comando configurar, o usuário deverá revisar as variáveis da função _vars_export_ do script _config_spcon.ksh_ e fazer as modificações que achar necessárias. Após isso, deverá ser executado o comando acima.


###### 4.2.4 Realiza a copia dados de teste da instalação do SPCON

	```sh
	$ ./config_spcon.ksh testcase
	```

 ###### 4.2.4 O passo seguinte é a compilação do pacote SPCON que contempla (??????) e demais utilitários (inctime para o cálculo das datas e outras bibliotecas). Para isto siga os passos abaixo:

Antes de utilizar o script config_spcon.ksh para compilar o SPCON, é necessário ajustar alguns parâmetros do ambiente em que se está logado no Tupã:

	1. Certifique-se de que você está logado(a) na eslogin02:

	```sh
	$ uname -n
	```

	2. Caso não esteja logado nela, logue-se da seguinte forma:

	```sh
	$ ssh -X eslogin02
	```

	3. Executar o comando abaixo e escolher a opcao 6:
		
		```sh
		$ source /usr/bin/development_config
		```

	4. Alterar a versao do compilador:

	```sh
	$ module swap pgi pgi/11.10.0
	```

	5. Executar o script de configuracao:

	```sh
	$ config_spcon.ksh
	```
	6. Compilar o pacote:

	```sh
	$ make comp=pgi
	```


Para compilar o SPCON deve-se executar o script config_spcon.ksh com a opção compilar. Para isso siga os passos:

	1. Entre no diretório onde fez o checkout ou o export do SMG:

	```sh
	cd ${SUBMIT_HOME}/
	```

	2. Execute o script para configurar o ambiente:

	```sh
	$ ./config_smg.ksh configurar
	```







 	```sh
 	$  ./config_spcon.ksh compilar
 	```



######  4.2.1 Compilação do SPCON

