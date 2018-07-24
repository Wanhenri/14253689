#/bin/bash
#
# versao 0.1
#
# NOME
#   rodar_scripts.sh
#
# OBJETIVO
#	Aprendizado com a ferramenta inctime
# DESCRICAO
#	
# LINGUAGEM
#   Foi utilizado: sed   //   grads  //  cdo
#                 
# NOTA
#   Um log em /var/log/$SCRIPT.log e gerado a cada execucao deste script.
#
#  CRIADO_POR      Wanderson Henrique dos Santos    05/18/2018
#  MODIFICADO_POR  (DD/MM/YYYY)
#  Wanderson     (//2018) -  

#  Wanderson     (//2018) - 
#  [nome]     (DD/MM/YYYY) -  Descrição
#****************************************************
datainicial=2015050100
config_data=%y4%m2%d2%h2
#variavel finaliza a contagem infinita gerada
final=2015053118

#dia
DAY=`echo ${datainicial} |cut -c8-8`
###echo ${DAY}

incr=00
##"processo de numeros infinitos"
while : ;do
    datafi=$($inctime ${datainicial} +${incr}h ${config_data})
    let incr=$incr+06
    echo ${datafi}
    #contador do arquivo que será aberto
    echo "arq="${DAY}
    #********* "/stornext/home/w.santos/scratchout/agcm_cptec/pos/dataout/TQ0299L064/${datafi}/GPOSCPT${datafi}P.fct.TQ0299L064.ctl"
    echo "${datafi}/GPOSCPT${datafi}P.fct.TQ0299L064.ctl"
    echo "         "
    #Assim que alcancar a data final desejada, ele realiza um break nesse looping infinito
    if [ ${datafi} -eq ${final} ]
       then
          break
    fi
    let DAY=$DAY+1
done

