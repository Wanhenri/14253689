#!/bin/bash

echo "Digite o periodo inicial: yyyymmddhh"
read datainicial

#variavel finaliza a contagem infinita gerada
echo "Digite o periodo final: yyyymmddhh"
read final

echo "     "

#incremento
incr=`echo ${datainicial} |cut -c9-10` 

while : ;do

    datafi=$($inctime ${datainicial} +${incr}h %y4%m2%d2%h2)
    let incr=$incr+06
    echo ${datafi}
    
    #./get_icn.bash 299 64 ${datafi} 6
    echo "299 64 ${datafi} 6"
		
    #  while [ `qstat | grep w.santos | wc -l` -ge 8 ];do
    #        sleep 10
    #  done
						       
    #Assim que alcancar a data final desejada, ele realiza um break nesse looping infinito
    if [ ${datafi} -eq ${final} ]
    then
       break
    fi
done
											    
