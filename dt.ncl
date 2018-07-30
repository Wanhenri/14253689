
;;#                  
;;#
;;#script:
;;#teste_looping.ncl
;;#    as versao são salvas no diretório script_modificado_ncl
;;#    v1.0.0
;;#    v1.0.1
;;#    
;print("OBJETIVO")
;print("     Criar um arquivo binario")
;;#
;;#
;;#DESCRICAO
;;#
;;#<><><><><><><><><><><EXEMPLO
;;#
;;#<><><><><><><><><><><><><><><<<>><><><
;;#
;;#LINGUAGEM
;;#         NCL
;;#
;print( "CRIADO_POR         Wanderson H. dos Santos     (19/07/2018") 
;#CRIADO_POR         Wanderson H. dos Santos     (19/07/2018) 
;#                    
;# MODIFICADO_POR     Wanderson H. dos Santos     (20/07/2018) 
;#                     [nome]     (DD/MM/YYYY) -  Descricao
;#                     [nome]     (DD/MM/YYYY) -  Descricao
;#
;#
;#Historico
;#  
;#  v1.0.0 2018-07-19, Wanderson H Santos
;#    Criacao de um script que abre todos os arquivos e salva em uma variavel
;#  v1.0.1 2018-07-20, Wanderson H Santos
;#    Salva as informações em CSV
;#  v1.0.2 2018-07-20, Wanderson H Santos
;#    Acrescentando comentarios
;#  v1.0.3 2018-07-20, Wanderson H Santos
;#    Ultima versao que tem os blocos de v1.0.0
;#  v1.0.3a 2018-07-20, Wanderson H Santos
;#    Apenas uma copia realizada de comentarios feitos
;#  v1.0.5 2018-07-30, Wanderson H Santos
;#    Looping da media para 6 arquivos finalizados
;#    looping para 2 areas finalizadas
;#    versao alocada no github finalizados
;#    

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl" 
load "taylor_diagram_mod-3.25.ncl"

;# WS -> v1.0.5
;# WS -> v1.0.3 e v1.0.3a
;# WS -> v1.0.2
;# WS -> v1.0.1
;#obs.:a versao do topo que é a utilizada 
files = systemfunc("ls *.nc")  
  
  ;# add todos os arquivos em uma só variavel
  f = addfiles(files,"r")
  
  ;# separa a variavel file path do arquivo f[n]
  ;# https://www.ncl.ucar.edu/Document/Functions/Built-in/getfilepath.shtml
  path = getfilepath (f[4])
  
  ;# separa o conjunto de dados do file path do arquivo f[n]
;  dsizes = getfiledimsizes(f[4])

;# WS v1.0.3a  -> Objetivo de criar uma variavel temporaria que irá alocar
;# teste 1.2.0   2018-07-26           todos os dados do calculo de media
k=0
w=0
do while(k.le.1) .and. (w.le.1)
  q=0
  p=6
  
  do while(q.le.6) .and. (p.le.12)
  
    if(k.eq.w) then ; print("OK"+w)
         n = 1 
         i = q ;#0 +6
         j = p ;#6 +6
    end if
  
    do while(n.le.6) .and. (i.le.j)
  
      path = getfilepath (f[n])
      print(path)
      T_agg = f[n]->prec(:,:,:)
      T_agg@_FillValue=-9.99e+08
      nni=25
  
      do nn=0, nni-1
        ;TT=dim_avg_Wrap(dim_avg_Wrap(T_agg(:,{-36:0},{280:325})))
        TT=dim_avg_Wrap(dim_avg_Wrap(T_agg(:,{lai(k):laf(k)},{loi(k):lof(k)})))
        ;print(TT)
        x(i,nn)=TT(nn)
      end do
  
    i=i+1
    n=n+1
    end do
  
  q=q+6
  p=p+6
  end do

k=k+1
w=w+1
end do
print (x)  


;# WS
;;;# 1,GPM_REC_ACUM_24h_grib2.nc
;;;# 2,MAY2015_24Z_12Z_NCEP.nc
;;;# 3,MAY2015_24Z_12Z_SMG.nc
;;;# 4,MAY2015_48Z_12Z_NCEP.nc
;;;# 5,MAY2015_48Z_12Z_SMG.nc
;;;# 6,MAY2015_72Z_12Z_NCEP.nc
;;;# 7,MAY2015_72Z_12Z_SMG.nc
;;;# 8,prev.2015.mar.24h_seldate.nc
;;;# 9,prev.2015.mar.48h_seldate.nc
;;;#10,prev.2015.mar.72h_seldate.nc
;WS   

;;;;# WS -> v1.0.2
;;;;# WS -> v1.0.1
;;;;#obs.:a versao do topo que é a utilizada
;;;;-----------------------------------------------------------------------------------------
;;;;---{MOSTRAR A ORDEM DOS ARQUIVOS QUE ESTAO SENDO ABERTOS}
  
;;;; #Bloco independente do bloco anterior. Os dados São lidos diretamente do 'f', assim acrescentando 
;;;;# o 'n' independente

;;;;# Nome da saida da lista de dados
  csv_filename = "lista_de_dados.csv"    ;# name of CSV file to create
  dq = str_get_dq()                      ;# double quote character
  
;;;;---Create dummy mixed data to write to CSV file
;;;;# cabecalho do arquivos CSV 
  fields = (/"id","file"/)
  
;;;;# numero de dados
;;;;# obs.: caso apareça uma mensagem de erro quer dizer que existe menos dados do que o indicado
  nfil=10

;;;; #criado a matriz
  ids    = ispan(1,nfil,1)

  fields = dq + fields + dq                      
  
  header = [/str_join(fields,",")/]       
  
  format = "%3d,%s"           ;# Format to use for each variable.
  
  write_table(csv_filename, "w", header, "%s")   ;# Write header to CSV file.       

  do n=0, nfil-1
    
;;;# varia a variavel de files e extrai os nomes do file path
    path = getfilepath (f[n])
    alist  = [/ids(n),path/]
;;;
;;;;# escreve a tabela
    write_table(csv_filename, "a", alist, format)

  end do
;;;
;;;;---{FIM do comando: MOSTRAR A ORDEM DOS ARQUIVOS QUE ESTAO SENDO ABERTOS}
;;;
;;;;# WS -> v1.0.2
;;;;# WS -> v1.0.1
;;;;#obs.:a versao do topo que é a utilizada
;;;;-----------------------------------------------------------------------------------------
;;;;---{CRIAR ARQUIVO CSV}

;;;; #Bloco independente do bloco anterior. Os dados São lidos diretamente do 'f', assim acrescentando 
;;;;# o 'n' independente

;;;;#>>>>>>>>>>DESCRICAO
;;;;# Pega os dados numericos de precipitacao para cada dia. Os modelos e observados são selecionados
;;;;# no T_agg = f[n], sendo o 'n' a posicao de cada arquivo na variavel 'f'
  csv_filename = getfilepath (f[4])+".csv"    ;# name of CSV file to create

  dq = str_get_dq()                ;# double quote character

;;;;#---Create dummy mixed data to write to CSV file

  fields = (/"TIME","NAME","LAT","LON","ELEV","PREC"/)
;;;;# numero de tempos do arquivo
  nvals  = 25
  
  delete(ids) ;# deletando o ids criado anteriomente 
  
  ; #criado a matriz
  ids    = ispan(1,nvals,1)
  
  fields = dq + fields + dq                      ; Pre/append quotes to field names
  header = [/str_join(fields,",")/]              ; Header is field names separated
                                                 ; by commas.
  format = "%d,%g,%g,%g,%s"

;;;;;# Note: if you want spaces in CSV file, use the following format string.

  format = "%3d,%7.2f,%8.2f,%s, %6.5f"           ;# Format to use for each variable.

  write_table(csv_filename, "w", header, "%s")   ;# Write header to CSV file.
  
;;;;# Loop through "nvals" and create dummy values to append
;;;;# a single single line of data to the the CSV file.

  do n=0,nvals-1
 
    print(n)
 
    lat    = 0
    lon    = 0
    elev   = path
    source = dim_avg_Wrap(dim_avg_Wrap(T_agg(n,{-36:0},{280:325})))

;;;;#---Put the values in a list, and append the mixed data to the CSV file

    alist  = [/ids(n),lat,lon,elev,source/]
    write_table(csv_filename, "a", alist, format)

  end do
;;;;---{FIM DA CRIACAO ARQUIVO CSV}-------------------------------------------------------------------


