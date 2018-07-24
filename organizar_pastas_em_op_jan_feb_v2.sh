#/bin/bash
#                  
#
#script:
#
echo "OBJETIVO"
#
#
#DESCRICAO
#
#
#
#
#
#
#<><><><><><><><><><><EXEMPLO
#
#
#
#
#<><><><><><><><><><><><><><><<<>><><><
#
#
# 
#
#LINGUAGEM
#               cdo -r -select,name=var > extrair variavel
#           cdo -r remapbil        > muda a grade do arquivo
#           grads -lc               > roda o script .gs
#           ncrename                > renomea as variaveis
#
#
#
echo "CRIADO_POR         W H. S     (desc)" 
#CRIADO_POR         W H. S     (desc) 
#                                                              
# MODIFICADO_POR     W H. S     (desc) 
#                     [nome]     (DD/MM/YYYY) -  Descricao
#                     [nome]     (DD/MM/YYYY) -  Descricao
#
#
#Historico
#  
#  v1.0 (desc), W H S
#  v2.0 (desc)    , W H S
#	OBS.: Ainda nao consegui fazer com que ele varie os dias de acordo com os dias de cada mes
#   	logo, serÃ¡ necessario mudar mes(l13) e dia(l22) manualmente. SORRY!


echo "ano inicial"
read ano
echo "mes inicial - sem o zero se for menor que 10"
read mesi
echo "dia final"
read dia_final

ano_in=$ano
mes=$mesi
dia=1
while [ $mes -le $mesi ] 
    do
	if [ $mes -le 9 ]
	then
	mesin=0${mes}
	elif [ $mes -ge 10 ]
	then
	mesin=${mes}
	fi
	while [ $dia -le $dia_final ] 
	    do
	    echo $mes
	    echo $dia
    		if [ $dia -le 9 ] 
		then
		    diain=0${dia}
		elif [ $dia -ge 10 ] 
		then
		    diain=${dia}
		fi
	    mkdir  ./${ano}${mesin}${diain}12
	    cp /stornext/oper/tempo/BAM/TQ0666L064/${ano}${mesin}/${diain}12/BAM_TQ0666_GPOS_${ano}${mesin}${diain}12.tgz . 
	    cp BAM_TQ0666_GPOS_${ano}${mesin}${diain}12.tgz ./${ano}${mesin}${diain}12
	    mes=$((mes + 1))
	    dia=$((dia + 1))
	    done
    done
