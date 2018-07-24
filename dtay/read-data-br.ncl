load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

;;;  27012015
;;;  03022015
;;;  04022015
;;;  06022015
;;;  06032015
;; leitura dos dados e calculos rms  bias  e corr

begin

              ;colocar com letra maiuscula a primeira letra
              ;precisa alterar essa campo nos dois script:
              ;1)nesse para buscar as variaveis corretas
              ;2)no outro para imprimir a figura com o nome da estacao correta

;**********************************
;obs.: foi considerado esses valores pelo fato da leitura que éfeita em:

;;;;;;;;; new1_24 = mask(unmask_new1_24, msk(0:dy,:,:) .gt.  -0.8,1)

;verao=89
;outono=91
;inverno=91
;primavera=90

;m=1     ;varia: 0  1  2  3
;dy=91   ;       89 91 91 90


; para encontra qual estacao precisa em relacao ao est:

;est = (/"verao","outono","inverno","primavera"/)
;0=verao
;1=outono
;2=inverno
;3=primavera
;********************************************

estacao="verao"
est = (/"verao","outono","inverno","primavera"/)

m=0      
dy=89

;mascara
;filemask= addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/teste_recorte/out_teste.nc","r")
;filemask= addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/mascara/out_teste.nc","r")
filemask=addfile("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/mascara/out_teste_3_11.nc","r")

msk=filemask->lsmk(:,:,:)

;;ARA >>M1<<

new1 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M1_prec_024_"+est(m)+"16.nc", "r")
unmask_new1_24=new1->prec


new1_24 = mask(unmask_new1_24,msk(0:dy,:,:) .gt. -0.3,0)

;copy_VarCoords(new1_24,unmask_new1_24)
copy_VarCoords(unmask_new1_24,new1_24)


new1 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M1_prec_048_"+est(m)+"16.nc", "r")
unmask_new1_48=new1->prec

new1_48 = mask(unmask_new1_48,msk(0:dy,:,:) .gt. -0.3,0)

copy_VarCoords(unmask_new1_48,new1_48)

new1 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M1_prec_072_"+est(m)+"16.nc", "r")
unmask_new1_72=new1->prec

new1_72 = mask(unmask_new1_72,msk(0:dy,:,:) .gt. -0.3,0)


copy_VarCoords(unmask_new1_72,new1_72)

new1_24@_FillValue=-9.99e+08; -9999
new1_48@_FillValue=-9.99e+08; -9999
new1_72@_FillValue=-9.99e+08; -9999

;;GDN >>>>M2<<<<
  fall2 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M2_prec_024_"+est(m)+"16.nc", "r")
  unmask_new2_24 = fall2->prec    

new2_24 = mask(unmask_new2_24, msk(0:dy,:,:) .gt.  -0.3,0)
copy_VarCoords(unmask_new2_24,new2_24)

  fall2 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M2_prec_048_"+est(m)+"16.nc", "r")
  unmask_new2_48 = fall2->prec    

new2_48 = mask(unmask_new2_48, msk(0:dy,:,:) .gt.  -0.3,0)
copy_VarCoords(unmask_new2_48,new2_48)

  fall2 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M2_prec_072_"+est(m)+"16.nc", "r")
  unmask_new2_72 = fall2->prec    

new2_72 = mask(unmask_new2_72, msk(0:dy,:,:) .gt.  -0.3,0)
copy_VarCoords(unmask_new2_72,new2_72)

new2_24@_FillValue=-9.99e+08; -9999
new2_48@_FillValue=-9.99e+08; -9999
new2_72@_FillValue=-9.99e+08; -9999

;;TRMM
;fall3 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/serie_temporal/dados_para_serie/MERGE_GPM_prec.nc","r")
;tmpa = fall3->prec


;fall3 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/merge/merge/"+est(m)+"/out_"+est(m)+"_merge_prec.nc","r")
;unmask_tmpa = fall3->prec

;fall3 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/merge/merge/out_"+est(m)+"_merge_prec.nc","r")
;fall3 = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/merge/merge/out_"+est(m)+"_merge_prec.nc","r")
 fall3 = addfile ("/stornext/online19/mcga_fisica/dados_para_acrescentar_no_datain_dmd/roberto_dados_organizado/MERGE_new/estacao_outro/prec_"+est(m)+"16.nc","r")
unmask_tmpa = fall3->prec


tmpa = mask(unmask_tmpa,msk(0:dy,:,:) .gt. -0.3,0)
copy_VarCoords(unmask_tmpa,tmpa)



;;; >>>M3<<
  fallf = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M3_prec_024_"+est(m)+"16.nc", "r")
 unmask_sl_24 = fallf->prec 

sl_24 = mask(unmask_sl_24, msk(0:dy,:,:) .gt.  -0.3,0)
copy_VarCoords(unmask_sl_24,sl_24)

  fallf = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M3_prec_048_"+est(m)+"16.nc", "r")
 unmask_sl_48 = fallf->prec 

sl_48 = mask(unmask_sl_48, msk(0:dy,:,:) .gt.  -0.3,0)
copy_VarCoords(unmask_sl_48,sl_48)

  fallf = addfile ("/stornext/online19/mcga_fisica/w.santos/dados_roberto_2_oct/modif_taylor/"+est(m)+"/M3_prec_072_"+est(m)+"16.nc", "r")
 unmask_sl_72 = fallf->prec 

sl_72 = mask(unmask_sl_72, msk(0:dy,:,:) .gt.  -0.3,0)
copy_VarCoords(unmask_sl_72,sl_72)


sl_24@_FillValue=-9.99e+08; -9999
sl_48@_FillValue=-9.99e+08; -9999
sl_72@_FillValue=-9.99e+08; -9999


fallg = addfile ("/stornext/online19/mcga_fisica/dados_para_acrescentar_no_datain_dmd/roberto_dados_organizado/dados_GFS/estacao/recorte_GFS_prev."+est(m)+".24h.nc","r")
  unmask_gfs_24 = fallg->APCP_surface    ;new2

 gfs_24=mask(unmask_gfs_24,msk(0:dy,:,:) .le.  -0.8,1)
 copy_VarCoords(unmask_gfs_24,gfs_24)




  fallg = addfile ("/stornext/online19/mcga_fisica/dados_para_acrescentar_no_datain_dmd/roberto_dados_organizado/dados_GFS/estacao/recorte_GFS_prev."+est(m)+".48h.nc","r")
  unmask_gfs_48 = fallg->APCP_surface    ;new2

 gfs_48=mask(unmask_gfs_48,msk(0:dy,:,:) .le.  -0.8,1)
 copy_VarCoords(unmask_gfs_48,gfs_48)


  fallg = addfile ("/stornext/online19/mcga_fisica/dados_para_acrescentar_no_datain_dmd/roberto_dados_organizado/dados_GFS/estacao/recorte_GFS_prev."+est(m)+".72h.nc","r")
  unmask_gfs_72 = fallg->APCP_surface    ;new2

 gfs_72=mask(unmask_gfs_72,msk(0:dy,:,:) .le.  -0.8,1)
 copy_VarCoords(unmask_gfs_72,gfs_72)

;;BAM

fallb = addfile ("/stornext/online19/mcga_fisica/w.santos/ano_2018/diarios_BAM666/estacao/NG_verao2017_24Z_diaria.nc","r")
unmask_bam_24 = fallb->prec

 bam_24=mask(unmask_bam_24,msk(0:dy,:,:) .le.  -0.8,1)
 copy_VarCoords(unmask_bam_24,bam_24)
 

fallb = addfile ("/stornext/online19/mcga_fisica/w.santos/ano_2018/diarios_BAM666/estacao/NG_verao2017_48Z_diaria.nc","r")
unmask_bam_48 = fallb->prec

bam_48=mask(unmask_bam_48,msk(0:dy,:,:) .le.  -0.8,1)
 copy_VarCoords(unmask_bam_48,bam_48)
 

fallb = addfile ("/stornext/online19/mcga_fisica/w.santos/ano_2018/diarios_BAM666/estacao/NG_verao2017_72Z_diaria.nc","r")
unmask_bam_72 = fallb->prec

bam_72=mask(unmask_bam_72,msk(0:dy,:,:) .le.  -0.8,1)
 copy_VarCoords(unmask_bam_72,bam_72)
 


print("fim-abertura de arquivos")

;;******  medias na area  ******	
;Sudeste - Estacao
print("OK")
aa6o=wgt_areaave(tmpa(:,:,:),1.0,1.0,0)
print(aa6o)

;;; 24hrs
n6m24=wgt_areaave(new1_24(:,:,:),1.0,1.0,0)
print(n6m24)
 sl6m24=wgt_areaave(sl_24(:,:,:),1.0,1.0,0)	;modelo SL
 aa6m24=wgt_areaave(new2_24(:,:,:),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)
gfs6m24=wgt_areaave(gfs_24(:,:,:),1.0,1.0,0)
bam6m24=wgt_areaave(bam_24(:,:,:),1.0,1.0,0)


;;; 48hrs
 n6m48=wgt_areaave(new1_48(:,:,:),1.0,1.0,0)	;295 e 315 porque trabalha com o globo aberto
; gfs6m48=wgt_areaave(gfs_48(:,:,:),1.0,1.0,0)
 sl6m48=wgt_areaave(sl_48  (:,:,:),1.0,1.0,0)
 aa6m48=wgt_areaave(new2_48(:,:,:),1.0,1.0,0)
 gfs6m48=wgt_areaave(gfs_48(:,:,:),1.0,1.0,0)
 bam6m48=wgt_areaave(bam_48(:,:,:),1.0,1.0,0)

;;; 72hrs
 n6m72=wgt_areaave(new1_72(:,:,:),1.0,1.0,0)
; gfs6m72=wgt_areaave(gfs_72(:,:,:),1.0,1.0,0)
 sl6m72=wgt_areaave(sl_72  (:,:,:),1.0,1.0,0)
 aa6m72=wgt_areaave(new2_72(:,:,:),1.0,1.0,0)
 gfs6m72=wgt_areaave(gfs_72(:,:,:),1.0,1.0,0)
 bam6m72=wgt_areaave(bam_72(:,:,:),1.0,1.0,0)
 
print("Sudeste - Estacao")

;la plata basin
print("OK")
 aa5o=wgt_areaave(tmpa(:,{-36:-24},{295:315}),1.0,1.0,0)           ;nome do arquivo prec_TMPA.nc, dados observados

;;; 24hrs
 n5m24=wgt_areaave(new1_24(:,{-36:-24},{295:315}),1.0,1.0,0)        ;modelo BAM(1.0 ou 1.1)
 gfs5m24=wgt_areaave(gfs_24(:,{-36:-24},{295:315}),1.0,1.0,0)       ;modelo GFS
 sl5m24=wgt_areaave(sl_24(:,{-36:-24},{295:315}),1.0,1.0,0) ;modelo SL
 aa5m24=wgt_areaave(new2_24(:,{-36:-24},{295:315}),1.0,1.0,0)       ;modelo BAM(1.0 ou 1.1)
 bam5m24=wgt_areaave(bam_24(:,{-36:-24},{295:315}),1.0,1.0,0)       ;modelo BAM(1.0 ou 1.1)

;;; 48hrs
 n5m48=wgt_areaave(new1_48(:,{-36:-24},{295:315}),1.0,1.0,0)       ;295 e 315 porque trabalha com o globo aberto
 gfs5m48=wgt_areaave(gfs_48(:,{-36:-24},{295:315}),1.0,1.0,0)
 sl5m48=wgt_areaave(sl_48  (:,{-36:-24},{295:315}),1.0,1.0,0)
 aa5m48=wgt_areaave(new2_48(:,{-36:-24},{295:315}),1.0,1.0,0)
 bam5m48=wgt_areaave(bam_48(:,{-36:-24},{295:315}),1.0,1.0,0)

;;; 72hrs
 n5m72=wgt_areaave(new1_72(:,{-36:-24},{295:315}),1.0,1.0,0)
 gfs5m72=wgt_areaave(gfs_72(:,{-36:-24},{295:315}),1.0,1.0,0)
 sl5m72=wgt_areaave(sl_72  (:,{-36:-24},{295:315}),1.0,1.0,0)
 aa5m72=wgt_areaave(new2_72(:,{-36:-24},{295:315}),1.0,1.0,0)
 bam5m72=wgt_areaave(bam_72(:,{-36:-24},{295:315}),1.0,1.0,0)

print("recorte la plata OK")


;sudeste
 aa4o=wgt_areaave(tmpa(:,{-24:-12},{310:325}),1.0,1.0,0)		;nome do arquivo prec_TMPA.nc, dados observados

;;; 24hrs
 n4m24=wgt_areaave(new1_24(:,{-24:-12},{310:325}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)
 gfs4m24=wgt_areaave(gfs_24(:,{-24:-12},{310:325}),1.0,1.0,0)	;modelo GFS
 sl4m24=wgt_areaave(sl_24(:,{-24:-12},{310:325}),1.0,1.0,0)	;modelo SL
 aa4m24=wgt_areaave(new2_24(:,{-24:-12},{310:325}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)
 bam4m24=wgt_areaave(bam_24(:,{-24:-12},{310:325}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)

;;; 48hrs
 n4m48=wgt_areaave(new1_48(:,{-24:-12},{310:325}),1.0,1.0,0)
 gfs4m48=wgt_areaave(gfs_48  (:,{-24:-12},{310:325}),1.0,1.0,0)
 sl4m48=wgt_areaave(sl_48  (:,{-24:-12},{310:325}),1.0,1.0,0)
 aa4m48=wgt_areaave(new2_48(:,{-24:-12},{310:325}),1.0,1.0,0)
 bam4m48=wgt_areaave(bam_48(:,{-24:-12},{310:325}),1.0,1.0,0)

;;; 72hrs
 n4m72=wgt_areaave(new1_72(:,{-24:-12},{310:325}),1.0,1.0,0)
 gfs4m72=wgt_areaave(gfs_72  (:,{-24:-12},{310:325}),1.0,1.0,0)
 sl4m72=wgt_areaave(sl_72  (:,{-24:-12},{310:325}),1.0,1.0,0)
 aa4m72=wgt_areaave(new2_72(:,{-24:-12},{310:325}),1.0,1.0,0)
 bam4m72=wgt_areaave(bam_72(:,{-24:-12},{310:325}),1.0,1.0,0)

print("recorte sudeste OK")

; centro oeste
 aa3o=wgt_areaave(tmpa(:,{-24:-12},{295:310}),1.0,1.0,0)		;nome do arquivo prec_TMPA.nc, dados observados

;;; 24hrs
 n3m24=wgt_areaave(new1_24(:,{-24:-12},{295:310}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)
 gfs3m24=wgt_areaave(gfs_24(:,{-24:-12},{295:310}),1.0,1.0,0)	;modelo GFS
 sl3m24=wgt_areaave(sl_24(:,{-24:-12},{295:310}),1.0,1.0,0)	;modelo SL
 aa3m24=wgt_areaave(new2_24(:,{-24:-12},{295:310}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)
 bam3m24=wgt_areaave(bam_24(:,{-24:-12},{295:310}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)

;;; 48hrs
 n3m48=wgt_areaave(new1_48(:,{-24:-12},{295:310}),1.0,1.0,0)
 gfs3m48=wgt_areaave(gfs_48  (:,{-24:-12},{295:310}),1.0,1.0,0)
 sl3m48=wgt_areaave(sl_48  (:,{-24:-12},{295:310}),1.0,1.0,0)
 aa3m48=wgt_areaave(new2_48(:,{-24:-12},{295:310}),1.0,1.0,0)
 bam3m48=wgt_areaave(bam_48(:,{-24:-12},{295:310}),1.0,1.0,0)

;;; 72hrs
 n3m72=wgt_areaave(new1_72(:,{-24:-12},{295:310}),1.0,1.0,0)
 gfs3m72=wgt_areaave(gfs_72  (:,{-24:-12},{295:310}),1.0,1.0,0)
 sl3m72=wgt_areaave(sl_72  (:,{-24:-12},{295:310}),1.0,1.0,0)
 aa3m72=wgt_areaave(new2_72(:,{-24:-12},{295:310}),1.0,1.0,0)
 bam3m72=wgt_areaave(bam_72(:,{-24:-12},{295:310}),1.0,1.0,0)

print("recorte centro oeste OK")

;nordeste
 aa2o=wgt_areaave(tmpa(:,{-12:0},{310:325}),1.0,1.0,0)		;nome do arquivo prec_TMPA.nc, dados observados

;;; 24hrs
 n2m24=wgt_areaave(new1_24(:,{-12:0},{310:325}),1.0,1.0,0)		;modelo BAM(1.0 ou 1.1)
 gfs2m24=wgt_areaave(gfs_24(:,{-12:0},{310:325}),1.0,1.0,0)	;modelo GFS
 sl2m24=wgt_areaave(sl_24(:,{-12:0},{310:325}),1.0,1.0,0)		;modelo SL
 aa2m24=wgt_areaave(new2_24(:,{-12:0},{310:325}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)
 bam2m24=wgt_areaave(bam_24(:,{-12:0},{310:325}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)

;;; 48hrs
 n2m48=wgt_areaave(new1_48(:,{-12:0},{310:325}),1.0,1.0,0)
 gfs2m48=wgt_areaave(gfs_48  (:,{-12:0},{310:325}),1.0,1.0,0)
 sl2m48=wgt_areaave(sl_48  (:,{-12:0},{310:325}),1.0,1.0,0)
 aa2m48=wgt_areaave(new2_48(:,{-12:0},{310:325}),1.0,1.0,0)
 bam2m48=wgt_areaave(bam_48(:,{-12:0},{310:325}),1.0,1.0,0)

;;; 72hrs
 n2m72=wgt_areaave(new1_72(:,{-12:0},{310:325}),1.0,1.0,0)
 gfs2m72=wgt_areaave(gfs_72  (:,{-12:0},{310:325}),1.0,1.0,0)
 sl2m72=wgt_areaave(sl_72  (:,{-12:0},{310:325}),1.0,1.0,0)
 aa2m72=wgt_areaave(new2_72(:,{-12:0},{310:325}),1.0,1.0,0)
 bam2m72=wgt_areaave(bam_72(:,{-12:0},{310:325}),1.0,1.0,0)

print("recorte nordeste OK")

;amazonia
 aa1o=wgt_areaave(tmpa(:,{-12:0},{295:310}),1.0,1.0,0)		;nome do arquivo prec_TMPA.nc, dados observados

;;; 24hrs
 n1m24=wgt_areaave(new1_24(:,{-12:0},{295:310}),1.0,1.0,0)		;modelo BAM(1.0 ou 1.1)
 gfs1m24=wgt_areaave(gfs_24(:,{-12:0},{295:310}),1.0,1.0,0)	;modelo GFS
 sl1m24=wgt_areaave(sl_24(:,{-12:0},{295:310}),1.0,1.0,0)		;modelo SL
 aa1m24=wgt_areaave(new2_24(:,{-12:0},{295:310}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)
 bam1m24=wgt_areaave(bam_24(:,{-12:0},{295:310}),1.0,1.0,0)	;modelo BAM(1.0 ou 1.1)

;;; 48hrs
 n1m48=wgt_areaave(new1_48(:,{-12:0},{295:310}),1.0,1.0,0)
 gfs1m48=wgt_areaave(gfs_48(:,{-12:0},{295:310}),1.0,1.0,0)
 sl1m48=wgt_areaave(sl_48  (:,{-12:0},{295:310}),1.0,1.0,0)
 aa1m48=wgt_areaave(new2_48(:,{-12:0},{295:310}),1.0,1.0,0)
 bam1m48=wgt_areaave(bam_48(:,{-12:0},{295:310}),1.0,1.0,0)

;;; 72hrs
 n1m72=wgt_areaave(new1_72(:,{-12:0},{295:310}),1.0,1.0,0)
 gfs1m72=wgt_areaave(gfs_72(:,{-12:0},{295:310}),1.0,1.0,0)
 sl1m72=wgt_areaave(sl_72  (:,{-12:0},{295:310}),1.0,1.0,0)
 aa1m72=wgt_areaave(new2_72(:,{-12:0},{295:310}),1.0,1.0,0)
 bam1m72=wgt_areaave(bam_72(:,{-12:0},{295:310}),1.0,1.0,0)


print("recorte amazônia OK")

;;;;;  desvios south america    ;;;;;;;;;;;;;;;;
  tdev1sa= dim_stddev_n_Wrap(aa6o,0)     ;
                                        ;em relação a dados observados
  dev1sa = dim_stddev_n_Wrap(aa6m24,0)
  dev2sa = dim_stddev_n_Wrap(aa6m48,0)
  dev3sa = dim_stddev_n_Wrap(aa6m72,0)

  sdev1sa = dim_stddev_n_Wrap(sl6m24,0)
  sdev2sa = dim_stddev_n_Wrap(sl6m48,0)
  sdev3sa = dim_stddev_n_Wrap(sl6m72,0)

  gdev1sa = dim_stddev_n_Wrap(gfs6m24,0)
  gdev2sa = dim_stddev_n_Wrap(gfs6m48,0)
  gdev3sa = dim_stddev_n_Wrap(gfs6m72,0)

  ndev1sa = dim_stddev_n_Wrap(n6m24,0)
  ndev2sa= dim_stddev_n_Wrap(n6m48,0)
  ndev3sa = dim_stddev_n_Wrap(n6m72,0)

  bdev1sa=dim_stddev_n_Wrap(bam6m24,0)
  bdev2sa=dim_stddev_n_Wrap(bam6m48,0)
  bdev3sa=dim_stddev_n_Wrap(bam6m72,0)
  
;;;;;  normalizando     ;
dev1saN = dev1sa/tdev1sa
dev2saN = dev2sa/tdev1sa
dev3saN = dev3sa/tdev1sa

sdev1saN = sdev1sa/tdev1sa
sdev2saN = sdev2sa/tdev1sa
sdev3saN = sdev3sa/tdev1sa

gdev1saN = gdev1sa/tdev1sa
gdev2saN = gdev2sa/tdev1sa
gdev3saN = gdev3sa/tdev1sa

ndev1saN = ndev1sa/tdev1sa
ndev2saN = ndev2sa/tdev1sa
ndev3saN = ndev3sa/tdev1sa

bdev1saN = bdev1sa/tdev1sa
bdev2saN = bdev2sa/tdev1sa
bdev3saN = bdev3sa/tdev1sa

;;;;;  desvios la plata    ;;;;;;;;;;;;;;;;
  tdev1l= dim_stddev_n_Wrap(aa5o,0)	;
					;em relação a dados observados
  dev1l = dim_stddev_n_Wrap(aa5m24,0)
  dev2l = dim_stddev_n_Wrap(aa5m48,0)
  dev3l = dim_stddev_n_Wrap(aa5m72,0)

  sdev1l = dim_stddev_n_Wrap(sl5m24,0)
  sdev2l = dim_stddev_n_Wrap(sl5m48,0)
  sdev3l = dim_stddev_n_Wrap(sl5m72,0)

  gdev1l = dim_stddev_n_Wrap(gfs5m24,0)
  gdev2l = dim_stddev_n_Wrap(gfs5m48,0)
  gdev3l = dim_stddev_n_Wrap(gfs5m72,0)

  ndev1l = dim_stddev_n_Wrap(n5m24,0)
  ndev2l= dim_stddev_n_Wrap(n5m48,0)
  ndev3l = dim_stddev_n_Wrap(n5m72,0)

  bdev1l = dim_stddev_n_Wrap(bam5m24,0)
  bdev2l=  dim_stddev_n_Wrap(bam5m48,0)
  bdev3l = dim_stddev_n_Wrap(bam5m72,0)

;;;;;  normalizando	;
dev1lN = dev1l/tdev1l
dev2lN = dev2l/tdev1l
dev3lN = dev3l/tdev1l

sdev1lN = sdev1l/tdev1l
sdev2lN = sdev2l/tdev1l
sdev3lN = sdev3l/tdev1l

gdev1lN = gdev1l/tdev1l
gdev2lN = gdev2l/tdev1l
gdev3lN = gdev3l/tdev1l

ndev1lN = ndev1l/tdev1l
ndev2lN = ndev2l/tdev1l
ndev3lN = ndev3l/tdev1l

bdev1lN = bdev1l/tdev1l
bdev2lN = bdev2l/tdev1l
bdev3lN = bdev3l/tdev1l


;;;;

;;;;;  desvios sudeste   ;;;;;;;;;;;;;;;;
  tdev1s = dim_stddev_n_Wrap(aa4o,0)

  dev1s = dim_stddev_n_Wrap(aa4m24,0)
  dev2s = dim_stddev_n_Wrap(aa4m48,0)
  dev3s = dim_stddev_n_Wrap(aa4m72,0)

  sdev1s = dim_stddev_n_Wrap(sl4m24,0)
  sdev2s = dim_stddev_n_Wrap(sl4m48,0)
  sdev3s = dim_stddev_n_Wrap(sl4m72,0)

  gdev1s = dim_stddev_n_Wrap(gfs4m24,0)
  gdev2s = dim_stddev_n_Wrap(gfs4m48,0)
  gdev3s = dim_stddev_n_Wrap(gfs4m72,0)

  ndev1s = dim_stddev_n_Wrap(n4m24,0)
  ndev2s = dim_stddev_n_Wrap(n4m48,0)
  ndev3s = dim_stddev_n_Wrap(n4m72,0)


  bdev1s = dim_stddev_n_Wrap(bam4m24,0)
  bdev2s = dim_stddev_n_Wrap(bam4m24,0)
  bdev3s = dim_stddev_n_Wrap(bam4m72,0)

;;;;;  normalizando
dev1sN = dev1s/tdev1s
dev2sN = dev2s/tdev1s
dev3sN = dev3s/tdev1s

sdev1sN = sdev1s/tdev1s
sdev2sN = sdev2s/tdev1s
sdev3sN = sdev3s/tdev1s

gdev1sN = gdev1s/tdev1s
gdev2sN = gdev2s/tdev1s
gdev3sN = gdev3s/tdev1s

ndev1sN = ndev1s/tdev1s
ndev2sN = ndev2s/tdev1s
ndev3sN = ndev3s/tdev1s

bdev1sN = bdev1s/tdev1s
bdev2sN = bdev2s/tdev1s
bdev3sN = bdev3s/tdev1s


;;;;;  desvios centro oeste   ;;;;;;;;;;;;;;;;
  tdev1c = dim_stddev_n_Wrap(aa3o,0)

  dev1c = dim_stddev_n_Wrap(aa3m24,0)
  dev2c = dim_stddev_n_Wrap(aa3m48,0)
  dev3c = dim_stddev_n_Wrap(aa3m72,0)

  sdev1c = dim_stddev_n_Wrap(sl3m24,0)
  sdev2c = dim_stddev_n_Wrap(sl3m48,0)
  sdev3c = dim_stddev_n_Wrap(sl3m72,0)

  gdev1c = dim_stddev_n_Wrap(gfs3m24,0)
  gdev2c = dim_stddev_n_Wrap(gfs3m48,0)
  gdev3c = dim_stddev_n_Wrap(gfs3m72,0)

  ndev1c = dim_stddev_n_Wrap(n3m24,0)
  ndev2c = dim_stddev_n_Wrap(n3m48,0)
  ndev3c = dim_stddev_n_Wrap(n3m72,0)

  bdev1c = dim_stddev_n_Wrap(bam3m24,0)
  bdev2c = dim_stddev_n_Wrap(bam3m48,0)
  bdev3c = dim_stddev_n_Wrap(bam3m72,0)

;;;;;  normalizando
dev1cN = dev1c/tdev1c
dev2cN = dev2c/tdev1c
dev3cN = dev3c/tdev1c

sdev1cN = sdev1c/tdev1c
sdev2cN = sdev2c/tdev1c
sdev3cN = sdev3c/tdev1c

gdev1cN = gdev1c/tdev1c
gdev2cN = gdev2c/tdev1c
gdev3cN = gdev3c/tdev1c

ndev1cN = ndev1c/tdev1c
ndev2cN = ndev2c/tdev1c
ndev3cN = ndev3c/tdev1c

bdev1cN = bdev1c/tdev1c
bdev2cN = bdev2c/tdev1c
bdev3cN = bdev3c/tdev1c



;;;;;  desvios nordeste   ;;;;;;;;;;
  tdev1n = dim_stddev_n_Wrap(aa2o,0)

  dev1n = dim_stddev_n_Wrap(aa2m24,0)
  dev2n = dim_stddev_n_Wrap(aa2m48,0)
  dev3n = dim_stddev_n_Wrap(aa2m72,0)

  sdev1n = dim_stddev_n_Wrap(sl2m24,0)
  sdev2n = dim_stddev_n_Wrap(sl2m48,0)
  sdev3n = dim_stddev_n_Wrap(sl2m72,0)

  gdev1n = dim_stddev_n_Wrap(gfs2m24,0)
  gdev2n = dim_stddev_n_Wrap(gfs2m48,0)
  gdev3n = dim_stddev_n_Wrap(gfs2m72,0)

  ndev1n = dim_stddev_n_Wrap(n2m24,0)
  ndev2n = dim_stddev_n_Wrap(n2m48,0)
  ndev3n = dim_stddev_n_Wrap(n2m72,0)

  bdev1n = dim_stddev_n_Wrap(bam2m24,0)
  bdev2n = dim_stddev_n_Wrap(bam2m48,0)
  bdev3n = dim_stddev_n_Wrap(bam2m72,0)


;;;;;  normalizando
dev1nN = dev1n/tdev1n
dev2nN = dev2n/tdev1n
dev3nN = dev3n/tdev1n

sdev1nN = sdev1n/tdev1n
sdev2nN = sdev2n/tdev1n
sdev3nN = sdev3n/tdev1n

gdev1nN = gdev1n/tdev1n
gdev2nN = gdev2n/tdev1n
gdev3nN = gdev3n/tdev1n

ndev1nN = ndev1n/tdev1n
ndev2nN = ndev2n/tdev1n
ndev3nN = ndev3n/tdev1n

bdev1nN = bdev1n/tdev1n
bdev2nN = bdev2n/tdev1n
bdev3nN = bdev3n/tdev1n

;;;;;  desvios amazonia   ;;;;;;;;;;
  tdev1a = dim_stddev_n_Wrap(aa1o,0)
  tdev2a = dim_stddev_n_Wrap(aa1o,0)
  tdev3a = dim_stddev_n_Wrap(aa1o,0)

  dev1a = dim_stddev_n_Wrap(aa1m24,0)
  dev2a = dim_stddev_n_Wrap(aa1m48,0)
  dev3a = dim_stddev_n_Wrap(aa1m72,0)

  sdev1a = dim_stddev_n_Wrap(sl1m24,0)
  sdev2a = dim_stddev_n_Wrap(sl1m48,0)
  sdev3a = dim_stddev_n_Wrap(sl1m72,0)

  gdev1a = dim_stddev_n_Wrap(gfs1m24,0)
  gdev2a = dim_stddev_n_Wrap(gfs1m48,0)
  gdev3a = dim_stddev_n_Wrap(gfs1m72,0)

  ndev1a = dim_stddev_n_Wrap(n1m24,0)
  ndev2a = dim_stddev_n_Wrap(n1m48,0)
  ndev3a = dim_stddev_n_Wrap(n1m72,0)

  bdev1a = dim_stddev_n_Wrap(bam1m24,0)
  bdev2a = dim_stddev_n_Wrap(bam1m48,0)
  bdev3a = dim_stddev_n_Wrap(bam1m72,0)

;;;;;  normalizando
dev1aN = dev1a/tdev1a
dev2aN = dev2a/tdev2a
dev3aN = dev3a/tdev3a

sdev1aN = sdev1a/tdev1a
sdev2aN = sdev2a/tdev2a
sdev3aN = sdev3a/tdev3a

gdev1aN = gdev1a/tdev1a
gdev2aN = gdev2a/tdev2a
gdev3aN = gdev3a/tdev3a

ndev1aN = ndev1a/tdev1a
ndev2aN = ndev2a/tdev2a
ndev3aN = ndev3a/tdev3a


bdev1aN = bdev1a/tdev1a
bdev2aN = bdev2a/tdev2a
bdev3aN = bdev3a/tdev3a


;;******  reordened array  ******

  voa1=ndtooned(aa1o)    ;ndtooned --> transforma um array mult em unidimensional
  voa2=ndtooned(aa2o)	 ;em relação aos dados observados
  voa3=ndtooned(aa3o)
  voa4=ndtooned(aa4o)
  voa5=ndtooned(aa5o)
  voa6=ndtooned(aa6o)

;;; 24hr		

  vm24a1=ndtooned(aa1m24)	;em relação aos dados do new2 de 24 horas de cada zona recortada
  vm24a2=ndtooned(aa2m24)
  vm24a3=ndtooned(aa3m24)
  vm24a4=ndtooned(aa4m24)
  vm24a5=ndtooned(aa5m24)
  vm24a6=ndtooned(aa6m24)

  vg24a1=ndtooned(gfs1m24)	;em relação aos dados do gfs de 24 horas de cada zona recortada
  vg24a2=ndtooned(gfs2m24)
  vg24a3=ndtooned(gfs3m24)
  vg24a4=ndtooned(gfs4m24)
  vg24a5=ndtooned(gfs5m24)
  vg24a6=ndtooned(gfs6m24)

  vmo24a1=ndtooned(n1m24)	;em relação aos dados do new1 de 24 horas de cada zona recortada
  vmo24a2=ndtooned(n2m24)
  vmo24a3=ndtooned(n3m24)
  vmo24a4=ndtooned(n4m24)
  vmo24a5=ndtooned(n5m24)
  vmo24a6=ndtooned(n6m24)

  vsl24a1=ndtooned(sl1m24)	;em relação aos dados do sl de 24 horas de cada zona recortada
  vsl24a2=ndtooned(sl2m24)
  vsl24a3=ndtooned(sl3m24)
  vsl24a4=ndtooned(sl4m24)
  vsl24a5=ndtooned(sl5m24)
  vsl24a6=ndtooned(sl6m24)

  bam24a1=ndtooned(bam1m24)      ;em relação aos dados do sl de 24 horas de cada zona recortada
  bam24a2=ndtooned(bam2m24)
  bam24a3=ndtooned(bam3m24)
  bam24a4=ndtooned(bam4m24)
  bam24a5=ndtooned(bam5m24)
  bam24a6=ndtooned(bam6m24)

				;cadê o de 48hrs?????
;;; 48hrs
  vm48a1=ndtooned(aa1m48)    	;ndtooned --> transforma um array mult em unidimensional
  vm48a2=ndtooned(aa2m48)
  vm48a3=ndtooned(aa3m48)
  vm48a4=ndtooned(aa4m48)
  vm48a5=ndtooned(aa5m48)
  vm48a6=ndtooned(aa6m48)

  vg48a1=ndtooned(gfs1m48)
  vg48a2=ndtooned(gfs2m48)
  vg48a3=ndtooned(gfs3m48)
  vg48a4=ndtooned(gfs4m48)
  vg48a5=ndtooned(gfs5m48)
  vg48a6=ndtooned(gfs6m48)

  vmo48a1=ndtooned(n1m48)
  vmo48a2=ndtooned(n2m48)
  vmo48a3=ndtooned(n3m48)
  vmo48a4=ndtooned(n4m48)
  vmo48a5=ndtooned(n5m48)
  vmo48a6=ndtooned(n6m48)

  vsl48a1=ndtooned(sl1m48)
  vsl48a2=ndtooned(sl2m48)
  vsl48a3=ndtooned(sl3m48)
  vsl48a4=ndtooned(sl4m48)
  vsl48a5=ndtooned(sl5m48)
  vsl48a6=ndtooned(sl6m48)

  bam48a1=ndtooned(bam1m48)      ;em relação aos dados do sl de 24 horas de cada zona recortada
  bam48a2=ndtooned(bam2m48)
  bam48a3=ndtooned(bam3m48)
  bam48a4=ndtooned(bam4m48)
  bam48a5=ndtooned(bam5m48)
  bam48a6=ndtooned(bam6m48)

;;; 72hrs
  vm72a1=ndtooned(aa1m72)       ;ndtooned --> transforma um array mult em unidimensional
  vm72a2=ndtooned(aa2m72)
  vm72a3=ndtooned(aa3m72)
  vm72a4=ndtooned(aa4m72)
  vm72a5=ndtooned(aa5m72)
  vm72a6=ndtooned(aa6m72)

  vg72a1=ndtooned(gfs1m72)
  vg72a2=ndtooned(gfs2m72)
  vg72a3=ndtooned(gfs3m72)
  vg72a4=ndtooned(gfs4m72)
  vg72a5=ndtooned(gfs5m72)
  vg72a6=ndtooned(gfs6m72)

  vmo72a1=ndtooned(n1m72)
  vmo72a2=ndtooned(n2m72)
  vmo72a3=ndtooned(n3m72)
  vmo72a4=ndtooned(n4m72)
  vmo72a5=ndtooned(n5m72)
  vmo72a6=ndtooned(n6m72)

  vsl72a1=ndtooned(sl1m72)
  vsl72a2=ndtooned(sl2m72)
  vsl72a3=ndtooned(sl3m72)
  vsl72a4=ndtooned(sl4m72)
  vsl72a5=ndtooned(sl5m72)
  vsl72a6=ndtooned(sl6m72)

  bam72a1=ndtooned(bam1m72)      ;em relação aos dados do sl de 24 horas de cada zona recortada
  bam72a2=ndtooned(bam2m72)
  bam72a3=ndtooned(bam3m72)
  bam72a4=ndtooned(bam4m72)
  bam72a5=ndtooned(bam5m72)
  bam72a6=ndtooned(bam6m72)

;;******  compute correlation  ******
;;; 24hrs

printVarSummary(voa1)
printVarSummary(vm24a1)

;;   obs x model
  Cor24M1 = esccr (voa1,vm24a1,0)       ;(obs,mod,maxlag)
  Cor24M2 = esccr (voa2,vm24a2,0)       ;(obs,mod,maxlag)
  Cor24M3 = esccr (voa3,vm24a3,0)       ;(obs,mod,maxlag)
  Cor24M4 = esccr (voa4,vm24a4,0)       ;(obs,mod,maxlag)
  Cor24M5 = esccr (voa5,vm24a5,0)       ;(obs,mod,maxlag)
  Cor24M6 = esccr (voa6,vm24a6,0)       ;(obs,mod,maxlag)

;;   obs x gfs
  Cor24G1 = esccr (voa1,vg24a1,0)       ;(obs,mod,maxlag)
  Cor24G2 = esccr (voa2,vg24a2,0)       ;(obs,mod,maxlag)
  Cor24G3 = esccr (voa3,vg24a3,0)       ;(obs,mod,maxlag)
  Cor24G4 = esccr (voa4,vg24a4,0)       ;(obs,mod,maxlag)
  Cor24G5 = esccr (voa5,vg24a5,0)       ;(obs,mod,maxlag)
  Cor24G6 = esccr (voa6,vg24a6,0)       ;(obs,mod,maxlag)

;;   obs x model ori
  Cor24Mo1 = esccr (voa1,vmo24a1,0)     ;(obs,mod,maxlag)
  Cor24Mo2 = esccr (voa2,vmo24a2,0)     ;(obs,mod,maxlag)
  Cor24Mo3 = esccr (voa3,vmo24a3,0)     ;(obs,mod,maxlag)
  Cor24Mo4 = esccr (voa4,vmo24a4,0)     ;(obs,mod,maxlag)
  Cor24Mo5 = esccr (voa5,vmo24a5,0)     ;(obs,mod,maxlag)
  Cor24Mo6 = esccr (voa6,vmo24a6,0)     ;(obs,mod,maxlag)

;;   obs x sl
  Cor24S1 = esccr (voa1,vsl24a1,0)      ;(obs,mod,maxlag)
  Cor24S2 = esccr (voa2,vsl24a2,0)      ;(obs,mod,maxlag)
  Cor24S3 = esccr (voa3,vsl24a3,0)      ;(obs,mod,maxlag)
  Cor24S4 = esccr (voa4,vsl24a4,0)      ;(obs,mod,maxlag)
  Cor24S5 = esccr (voa5,vsl24a5,0)      ;(obs,mod,maxlag)
  Cor24S6 = esccr (voa6,vsl24a6,0)      ;(obs,mod,maxlag)

;; obs x bam
  Cor24bam1 = esccr (voa1,bam24a1,0)      ;(obs,mod,maxlag)
  Cor24bam2 = esccr (voa2,bam24a2,0)      ;(obs,mod,maxlag)
  Cor24bam3 = esccr (voa3,bam24a3,0)      ;(obs,mod,maxlag)
  Cor24bam4 = esccr (voa4,bam24a4,0)      ;(obs,mod,maxlag)
  Cor24bam5 = esccr (voa5,bam24a5,0)      ;(obs,mod,maxlag)
  Cor24bam6 = esccr (voa6,bam24a6,0)      ;(obs,mod,maxlag)

						         	;	cade o de 48 hrs???????
;;; 48hrs
;;   obs x model
  Cor48M1 = esccr (voa1,vm48a1,0)       ;(obs,mod,maxlag)
  Cor48M2 = esccr (voa2,vm48a2,0)       ;(obs,mod,maxlag)
  Cor48M3 = esccr (voa3,vm48a3,0)       ;(obs,mod,maxlag)
  Cor48M4 = esccr (voa4,vm48a4,0)       ;(obs,mod,maxlag)
  Cor48M5 = esccr (voa5,vm48a5,0)       ;(obs,mod,maxlag)
  Cor48M6 = esccr (voa6,vm48a6,0)       ;(obs,mod,maxlag)

;;   obs x gfs
  Cor48G1 = esccr (voa1,vg48a1,0)       ;(obs,mod,maxlag)
  Cor48G2 = esccr (voa2,vg48a2,0)       ;(obs,mod,maxlag)
  Cor48G3 = esccr (voa3,vg48a3,0)       ;(obs,mod,maxlag)
  Cor48G4 = esccr (voa4,vg48a4,0)       ;(obs,mod,maxlag)
  Cor48G5 = esccr (voa5,vg48a5,0)       ;(obs,mod,maxlag)
  Cor48G6 = esccr (voa6,vg48a6,0)       ;(obs,mod,maxlag)

;;   obs x model ori
  Cor48Mo1 = esccr (voa1,vmo48a1,0)     ;(obs,mod,maxlag)
  Cor48Mo2 = esccr (voa2,vmo48a2,0)     ;(obs,mod,maxlag)
  Cor48Mo3 = esccr (voa3,vmo48a3,0)     ;(obs,mod,maxlag)
  Cor48Mo4 = esccr (voa4,vmo48a4,0)     ;(obs,mod,maxlag)
  Cor48Mo5 = esccr (voa5,vmo48a5,0)     ;(obs,mod,maxlag)
  Cor48Mo6 = esccr (voa6,vmo48a6,0)     ;(obs,mod,maxlag)

;;   obs x model sl
  Cor48S1 = esccr (voa1,vsl48a1,0)      ;(obs,mod,maxlag)
  Cor48S2 = esccr (voa2,vsl48a2,0)      ;(obs,mod,maxlag)
  Cor48S3 = esccr (voa3,vsl48a3,0)      ;(obs,mod,maxlag)
  Cor48S4 = esccr (voa4,vsl48a4,0)      ;(obs,mod,maxlag)
  Cor48S5 = esccr (voa5,vsl48a5,0)      ;(obs,mod,maxlag)
  Cor48S6 = esccr (voa6,vsl48a6,0)      ;(obs,mod,maxlag)

;; obs x bam
  Cor48bam1 = esccr (voa1,bam48a1,0)      ;(obs,mod,maxlag)
  Cor48bam2 = esccr (voa2,bam48a2,0)      ;(obs,mod,maxlag)
  Cor48bam3 = esccr (voa3,bam48a3,0)      ;(obs,mod,maxlag)
  Cor48bam4 = esccr (voa4,bam48a4,0)      ;(obs,mod,maxlag)
  Cor48bam5 = esccr (voa5,bam48a5,0)      ;(obs,mod,maxlag)
  Cor48bam6 = esccr (voa6,bam48a6,0)      ;(obs,mod,maxlag)

;;;

;;; 72hrs

;;; 72hrs
;;   obs x model
  Cor72M1 = esccr (voa1,vm72a1,0)       ;(obs,mod,maxlag)
  Cor72M2 = esccr (voa2,vm72a2,0)       ;(obs,mod,maxlag)
  Cor72M3 = esccr (voa3,vm72a3,0)       ;(obs,mod,maxlag)
  Cor72M4 = esccr (voa4,vm72a4,0)       ;(obs,mod,maxlag)
  Cor72M5 = esccr (voa5,vm72a5,0)       ;(obs,mod,maxlag)
  Cor72M6 = esccr (voa6,vm72a6,0)       ;(obs,mod,maxlag)


;;   obs x gfs
  Cor72G1 = esccr (voa1,vg72a1,0)       ;(obs,mod,maxlag)
  Cor72G2 = esccr (voa2,vg72a2,0)       ;(obs,mod,maxlag)
  Cor72G3 = esccr (voa3,vg72a3,0)       ;(obs,mod,maxlag)
  Cor72G4 = esccr (voa4,vg72a4,0)       ;(obs,mod,maxlag)
  Cor72G5 = esccr (voa5,vg72a5,0)       ;(obs,mod,maxlag)
  Cor72G6 = esccr (voa6,vg72a6,0)       ;(obs,mod,maxlag)

;;   obs x model ori
  Cor72Mo1 = esccr (voa1,vmo72a1,0)     ;(obs,mod,maxlag)
  Cor72Mo2 = esccr (voa2,vmo72a2,0)     ;(obs,mod,maxlag)
  Cor72Mo3 = esccr (voa3,vmo72a3,0)     ;(obs,mod,maxlag)
  Cor72Mo4 = esccr (voa4,vmo72a4,0)     ;(obs,mod,maxlag)
  Cor72Mo5 = esccr (voa5,vmo72a5,0)     ;(obs,mod,maxlag)
  Cor72Mo6 = esccr (voa6,vmo72a6,0)     ;(obs,mod,maxlag)

;;   obs x model sl
  Cor72S1 = esccr (voa1,vsl72a1,0)      ;(obs,mod,maxlag)
  Cor72S2 = esccr (voa2,vsl72a2,0)      ;(obs,mod,maxlag)
  Cor72S3 = esccr (voa3,vsl72a3,0)      ;(obs,mod,maxlag)
  Cor72S4 = esccr (voa4,vsl72a4,0)      ;(obs,mod,maxlag)
  Cor72S5 = esccr (voa5,vsl72a5,0)      ;(obs,mod,maxlag)
  Cor72S6 = esccr (voa6,vsl72a6,0)      ;(obs,mod,maxlag)

;; obs x bam
  Cor72bam1 = esccr (voa1,bam72a1,0)      ;(obs,mod,maxlag)
  Cor72bam2 = esccr (voa2,bam72a2,0)      ;(obs,mod,maxlag)
  Cor72bam3 = esccr (voa3,bam72a3,0)      ;(obs,mod,maxlag)
  Cor72bam4 = esccr (voa4,bam72a4,0)      ;(obs,mod,maxlag)
  Cor72bam5 = esccr (voa5,bam72a5,0)      ;(obs,mod,maxlag)
  Cor72bam6 = esccr (voa6,vsl72a6,0)      ;(obs,mod,maxlag)

;;;

;monta um array com os valores de cada correlação para jogar no diagrama

; new1  --								    amazônia	
  an_rat    = (/ndev1aN,ndev2aN,ndev3aN/)
  an_cc     = (/Cor24Mo1,Cor48Mo1,Cor72Mo1/)  ;corn3/)

;print(an_rat)
;print(an_cc)

;  new2
  am_rat    = (/dev1aN,dev2aN,dev3aN/)
  am_cc     = (/Cor24M1,Cor48M1,Cor72M1/)  ;corm3/)

;print(am_rat)
;print(am_cc)


; -sl
  as_rat    = (/sdev1aN,sdev2aN,sdev3aN/)
  as_cc     = (/Cor24S1,Cor48S1,Cor72S1/) ;cors3/)

;print(as_rat)
;print(as_cc)

; - gfs
  ag_rat    = (/ gdev1aN,gdev2aN,gdev3aN/)
  ag_cc     = (/Cor24G1,Cor48G1,Cor72G1/)

;print(ag_rat)
;print(ag_cc)

;;- bam

 abam_rat = (/bdev1aN,bdev2aN,bdev3aN/) 
 abam_cc  = (/Cor24bam1,Cor48bam1,Cor72bam1/)

;  new1  --								     nordeste
  nn_rat    = (/ndev1nN,ndev2nN,ndev3nN/)
  nn_cc     = (/Cor24Mo2,Cor48Mo2,Cor72Mo2/)  ;corn3/)

;print(nn_rat)
;print(nn_cc)

; - new2
  nm_rat    = (/dev1nN,dev2nN,dev3nN/)
  nm_cc     = (/Cor24M2,Cor48M2,Cor72M2/)  ;corm3/)

;print(nm_rat)
;print(nm_cc)

;  -sl
  ns_rat    = (/sdev1nN,sdev2nN,sdev3nN/)
  ns_cc     = (/Cor24S2,Cor48S2,Cor72S2/) ;cors3/)

;print(ns_rat)
;print(ns_cc)

;  gfs
  ng_rat    = (/gdev1nN,gdev2nN,gdev3nN/)
  ng_cc     = (/Cor24G2,Cor48G2,Cor72G2/)

;print(ng_rat)
;print(ng_cc)

nabam_rat = (/bdev1nN,bdev2nN,bdev3nN/)
nabam_cc  = (/Cor24bam2,Cor48bam2,Cor72bam2/)
 

;  new1  --								 centro oeste
  cn_rat    = (/ndev1cN,ndev2cN,ndev3cN/)
  cn_cc     = (/Cor24Mo3,Cor48Mo3,Cor72Mo3/)  ;corn3/)

;print(cn_rat)
;print(cn_cc)

; - new2
  cm_rat    = (/dev1cN,dev2cN,dev3cN/)
  cm_cc     = (/Cor24M3,Cor48M3,Cor72M3/)  ;corm3/)

;print(cm_rat)
;print(cm_cc)

;  -sl
  cs_rat    = (/sdev1cN,sdev2cN,sdev3cN/)
  cs_cc     = (/Cor24S3,Cor48S3,Cor72S3/) ;cors3/)

;print(cs_rat)
;print(cs_cc)

;  gfs
  cg_rat    = (/gdev1cN,gdev2cN,gdev3cN/)
  cg_cc     = (/Cor24G3,Cor48G3,Cor72G3/)

;print(cg_rat)
;print(cg_cc)

cabam_rat = (/bdev1cN,bdev2cN,bdev3cN/)
cabam_cc  = (/Cor24bam3,Cor48bam3,Cor72bam3/)
 


;  new1  --								     sudeste
  sn_rat    = (/ndev1sN,ndev2sN,ndev3sN/)
  sn_cc     = (/Cor24Mo4,Cor48Mo4,Cor72Mo4/)  ;corn3/)

;print(sn_rat)
;print(sn_cc)

; - new2
  sm_rat    = (/dev1sN,dev2sN,dev3sN/)
  sm_cc     = (/Cor24M4,Cor48M4,Cor72M4/)  ;corm3/)

;print(sm_rat)
;print(sm_cc)

;  -sl
  ss_rat    = (/sdev1sN,sdev2sN,sdev3sN/)
  ss_cc     = (/Cor24S4,Cor48S4,Cor72S4/) ;cors3/)

;print(ss_rat)
;print(ss_cc)

;  gfs
  sg_rat    = (/gdev1sN,gdev2sN,gdev3sN/)
  sg_cc     = (/Cor24G4,Cor48G4,Cor72G4/)

;print(sg_rat)
;print(sg_cc)

sabam_rat = (/bdev1sN,bdev2sN,bdev3sN/)
sabam_cc  = (/Cor24bam4,Cor48bam4,Cor72bam4/)
 

;  new1  --								     la plata
  ln_rat    = (/ndev1lN,ndev2lN,ndev3lN/)
  ln_cc     = (/Cor24Mo5,Cor48Mo5,Cor72Mo5/)  ;corn3/)

;print(ln_rat)
;print(ln_cc)

; - new2
  lm_rat    = (/dev1lN,dev2lN,dev3lN/)
  lm_cc     = (/Cor24M5,Cor48M5,Cor72M5/)  ;corm3/)

;print(lm_rat)
;print(lm_cc)

;  -sl
  ls_rat    = (/sdev1lN,sdev2lN,sdev3lN/)
  ls_cc     = (/Cor24S5,Cor48S5,Cor72S5/) ;cors3/)

;print(ls_rat)
print(ls_cc)

;  gfs
  lg_rat    = (/gdev1lN,gdev2lN,gdev3lN/)
  lg_cc     = (/Cor24G5,Cor48G5,Cor72G5/)

;print(lg_rat)
;print(lg_cc)

labam_rat = (/bdev1lN,bdev2lN,bdev3lN/)
labam_cc  = (/Cor24bam5,Cor48bam5,Cor72bam5/)
 

;  new1  --								    South america
  san_rat    = (/ndev1saN,ndev2saN,ndev3saN/)
  san_cc     = (/Cor24Mo6,Cor48Mo6,Cor72Mo6/)  ;corn3/)

print("M1")
;print(san_rat)
print(san_cc)

; - new2
  sam_rat    = (/dev1saN,dev2saN,dev3saN/)
  sam_cc     = (/Cor24M6,Cor48M6,Cor72M6/)  ;corm3/)
print("M2")
;print(sam_rat)
print(sam_cc)

;  -sl
  sas_rat    = (/sdev1saN,sdev2saN,sdev3saN/)
  sas_cc     = (/Cor24S6,Cor48S6,Cor72S6/) ;cors3/)
print("M3")
;print(sas_rat)
print(sas_cc)

;  gfs
  sag_rat    = (/gdev1saN,gdev2saN,gdev3saN/)
  sag_cc     = (/Cor24G6,Cor48G6,Cor72G6/)

print(sag_rat)
print(sag_cc)

;Print (dimsizes(sas_cc)) 

saabam_rat = (/bdev1saN,bdev2saN,bdev3saN/)
saabam_cc  = (/Cor24bam6,Cor48bam6,Cor72bam6/)
 
print(saabam_rat)
print(saabam_cc)


end 
