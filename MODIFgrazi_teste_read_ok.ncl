load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl" 
load "taylor_diagram_mod-3.25.ncl"

;20018-04-02: Inclusão looping para selecionar diversas áreas; Junção scripts calcula + plota

begin

;Caracteristica
;#>Arquivo
;#caminho
;#file
;#addfile
;#var

;#>LAND-SEA-MASK
     dir_land_sea_mask = "/stornext/online8/mcga/graziela.luzia/DADOS_DIVERSOS/IMERG_GPM/V04/temp/"
    file_land_sea_mask = "landsea.nc"
         land_sea_mask = addfile (dir_land_sea_mask + file_land_sea_mask,"r")
                 pmask = land_sea_mask->LSMASK(:,:)
	    
	    printVarSummary(pmask)

;#>TRMM PR VERAO
           dir_trmm_pr = "/stornext/online8/mcga/graziela.luzia/CICLO_DIURNO/dados/TRMM_PR_2a25/"
          file_trmm_pr = "MEAN_15anos_24h_2a25_djf_1999_2013.nc"
               trmm_pr = addfile (dir_trmm_pr + file_trmm_pr,"r")
	    trmm_pr_24 = trmm_pr->prec


	    printVarSummary(trmm_pr_24)

;#aplicacao mascara
                   lnd = landsea_mask(pmask,trmm_pr_24&lat,trmm_pr_24&lon)
            trmm_pr_24 = mask(trmm_pr_24,lnd.eq.0,False)
	printVarSummary(trmm_pr_24)

;#>TRMM TMI
          dir_trmm_tmi = "/stornext/online8/mcga/graziela.luzia/CICLO_DIURNO/dados/TRMM_TMI_2a12/"
         file_trmm_tmi = "MEAN_15anos_24h_2a12_djf_1999_2013.nc"
              trmm_tmi = addfile (dir_trmm_tmi + file_trmm_tmi,"r")
           trmm_tmi_24 = trmm_tmi->prec
	
	printVarSummary(trmm_tmi_24)

;#aplicacao mascara
 
                   lnd = landsea_mask(pmask,trmm_tmi_24&lat,trmm_tmi_24&lon)
           trmm_tmi_24 = mask(trmm_tmi_24,lnd.eq.0,False)
	printVarSummary(trmm_tmi_24)

;#>TRMM COMB
         dir_trmm_comb = "/stornext/online8/mcga/graziela.luzia/CICLO_DIURNO/dados/TRMM_COMB_2b31/"
        file_trmm_comb = "MEAN_15anos_24h_2b31_djf_1999_2013.nc"
             trmm_comb = addfile (dir_trmm_comb + file_trmm_comb,"r")
	  trmm_comb_24 = trmm_comb->prec
		 
        printVarSummary(trmm_comb_24)

;#aplicacao mascara

                   lnd = landsea_mask(pmask,trmm_comb_24&lat,trmm_comb_24&lon)
      	   trmm_comb_24 = mask(trmm_comb_24,lnd.eq.0,False)
	printVarSummary(trmm_comb_24)

;#>EMAs-ANA-CEMIG
    dir_emas_ana_cemig = "/stornext/online8/mcga/graziela.luzia/CICLO_DIURNO/dados/EMAS/EMA_ANA_CEMIG_binarios/"
   file_emas_ana_cemig = "EMA_ANA_CEMIG_prec_1h_djf2010_2016.nc"
        emas_ana_cemig = addfile ( dir_emas_ana_cemig + file_emas_ana_cemig,"r")
     emas_ana_cemig_24 = emas_ana_cemig->prec(0:23,:,:)
		 
        printVarSummary(emas_ana_cemig_24)
 			

;#>CFSR
              dir_cfsr = "/stornext/online8/mcga/graziela.luzia/DADOS_DIVERSOS/CFSR_precTOTAL_1h/"
             file_cfsr = "CFSR_prec_1h_djf1999_2013_24h.nc"
                  cfsr1 = addfile (dir_cfsr + file_cfsr,"r")
              ; cfsr_24 = dble2flt(cfsr1->pp(0:23,:,:))
               cfsr_24 = cfsr1->pp(0:23,:,:)

        printVarSummary(cfsr_24)
        printVarSummary(pmask)		 

;#aplicacao mascara
;                  lnd = landsea_mask(pmask,cfsr_24&lat,cfsr_24&lon)
;     cfsr_24 = mask(cfsr_24,lnd.eq.0,False)
					 
;	printVarSummary(cfsr_24)
						 
		 
;#>MERGE
             dir_merge = "/stornext/online8/mcga/graziela.luzia/DADOS_DIVERSOS/MERGE_Rozante/"
            ;file_merge = "MERGE_Rozante_24h_djf.nc"
            file_merge = "MERGE_Rozante_24h_djf.nc"
                 merge1 = addfile (dir_merge + file_merge,"r")
              merge_24 = merge1->prec(0:23,:,:)
	
	printVarSummary(merge_24)
	
;#aplicacao mascara
	
                   lnd := landsea_mask(pmask,merge_24&lat,merge_24&lon)
              merge_24 = mask(merge_24,lnd.eq.0,False)
			
;	printVarSummary(merge_24)
					

;#>IMERGv04
          dir_imergv04 = "/stornext/online8/mcga/graziela.luzia/DADOS_DIVERSOS/IMERG_GPM/V04/temp/"
         file_imergv04 = "IMERG_djf_media24h.nc"
              imergv04 = addfile (dir_imergv04 + file_imergv04,"r")
          imergv04_24 = imergv04->ppcal
		 
        printVarSummary(imergv04_24)
	
;#aplicacao mascara
	
                   lnd := landsea_mask(pmask,imergv04_24&lat,imergv04_24&lon)
              imergv04_24 = mask(imergv04_24,lnd.eq.0,False)
					 
        printVarSummary(imergv04_24)
						 
		 
;#>IMERGv05
          dir_imergv05 = "/stornext/online8/mcga/graziela.luzia/DADOS_DIVERSOS/IMERG_GPM/V05/nc/"
        file_imergv05 = "IMERGv05_djf_media24h.nc"
             imergv05 = addfile (dir_imergv05 + file_imergv05,"r")
          imergv05_24 = imergv05->ppcal
		 
          printVarSummary(imergv05_24)
	  
;#aplicacao mascara 
  
                   lnd = landsea_mask(pmask,imergv05_24&lat,imergv05_24&lon)
              imergv05_24 = mask(imergv05_24,lnd.eq.0,False)
		                                       
          printVarSummary(imergv05_24)

do a=0,6
  print("área = " + (a+1))

;;; NOVAS Areas:

;[A1: Oeste Amazonia]
if (a .eq. 0) then 
loi=-69
lof=-67
lai=-11.5
laf=-8.5
end if

;[A2: Amazonia Central Sul (LBA)]
if (a .eq. 1) then 
loi=-61
lof=-57
lai=-04
laf=-02
end if

;[A3: Amazonia Central Norte]
if (a .eq. 2) then 
loi=-55
lof=-45
lai=-16
laf=-08
end if

;[A4: Nordeste]
if (a .eq. 3) then 
loi=-45
lof=-35
lai=-16
laf=-02
end if

;[A5: Centro Oeste-Sudeste]
if (a .eq. 4) then 
loi=-56
lof=-40
lai=-24
laf=-16
end if

;[A6: Sul PR]
if (a .eq. 5) then 
loi=-54
lof=-48
lai=-28
laf=-24
end if

;[A7: Sul RS]
if (a .eq. 6) then 
loi=-56
lof=-49
lai=-33
laf=-28
end if
										       
print("INICIO MEDIA")
;;;#######MEDIA
 ema       = wgt_areaave_Wrap(emas_ana_cemig_24(:,{lai:laf},{loi:lof}),1.0,1.0,0)   ; referencial 
 pr        = wgt_areaave_Wrap(trmm_pr_24(:,{lai:laf},{loi:lof}),1.0,1.0,0)	    ; satelite
 tmi       = wgt_areaave_Wrap(trmm_tmi_24(:,{lai:laf},{loi:lof}),1.0,1.0,0)	    ; satelite
 comb      = wgt_areaave_Wrap(trmm_comb_24(:,{lai:laf},{loi:lof}),1.0,1.0,0)	    ; satelite
 cfsr      = wgt_areaave_Wrap(cfsr_24(:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)	    ; reanalise
 merge     = wgt_areaave_Wrap(merge_24(:,{lai:laf},{loi:lof}),1.0,1.0,0)	    ; satelite
 imerg4    = wgt_areaave_Wrap(imergv04_24(:,{lai:laf},{loi:lof}),1.0,1.0,0)	    ; satelite
 imerg5    = wgt_areaave_Wrap(imergv05_24(:,{lai:laf},{loi:lof}),1.0,1.0,0)	    ; satelite
print("FIM MEDIA")
print("         ")
print("INICIO DESVIO PADRAO")
;;;#######DESVIO PADRAO
ema_tdev   =    dim_stddev_n_Wrap(ema,0)      ;observado

pr_dev     =     dim_stddev_n_Wrap(pr,0)      ;outros
tmi_dev    =    dim_stddev_n_Wrap(tmi,0)      ;outros
comb_dev   =   dim_stddev_n_Wrap(comb,0)      ;outros
cfsr_dev   =   dim_stddev_n_Wrap(cfsr,0)      ;outros
merge_dev  =  dim_stddev_n_Wrap(merge,0)      ;outros
imerg4_dev = dim_stddev_n_Wrap(imerg4,0)      ;outros
imerg5_dev = dim_stddev_n_Wrap(imerg5,0)      ;outros
print("FIM DESVIO PADRAO")
;;;#######NORMALIZANDO
pr_N       =     pr_dev/ema_tdev
tmi_N      =    tmi_dev/ema_tdev
comb_N     =   comb_dev/ema_tdev
cfsr_N     =   cfsr_dev/ema_tdev
merge_N    =  merge_dev/ema_tdev
imerg4_N   = imerg4_dev/ema_tdev
imerg5_N   = imerg5_dev/ema_tdev
;;;#######REORDENED ARRAY
   ema_reordArr =    ndtooned(ema)      	;observados
    pr_reordArr =     ndtooned(pr)		;outros
   tmi_reordArr =    ndtooned(tmi)		;outros
  comb_reordArr =   ndtooned(comb)		;outros
  cfsr_reordArr =   ndtooned(cfsr)		;outros
 merge_reordArr =  ndtooned(merge)		;outros
imerg4_reordArr = ndtooned(imerg4)		;outros
imerg5_reordArr = ndtooned(imerg5)		;outros

;;;#######CORRELACAO
    Cor24pr = esccr (ema_reordArr,pr_reordArr,0)		    ;(obs,mod,maxlag)
   Cor24tmi = esccr (ema_reordArr,tmi_reordArr,0)		    ;(obs,mod,maxlag)
  Cor24comb = esccr (ema_reordArr,comb_reordArr,0)		    ;(obs,mod,maxlag)
  Cor24cfsr = esccr (ema_reordArr,cfsr_reordArr,0)		    ;(obs,mod,maxlag)
 Cor24merge = esccr (ema_reordArr,merge_reordArr,0)		    ;(obs,mod,maxlag)
Cor24imerg4 = esccr (ema_reordArr,imerg4_reordArr,0)		    ;(obs,mod,maxlag)
Cor24imerg5 = esccr (ema_reordArr,imerg5_reordArr,0)		    ;(obs,mod,maxlag)
;;;#######MONTAR ARRAY
an_rat    = (/pr_N	,tmi_N	    ,comb_N	,cfsr_N	    ,merge_N	,imerg4_N	,imerg5_N/)
an_cc     = (/Cor24pr	,Cor24tmi   ,Cor24comb  ,Cor24cfsr  ,Cor24merge ,Cor24imerg4	,Cor24imerg5/)
        
;an_rat    = (/pr_N,   tmi_N,   comb_N,   merge_N,   imerg4_N,   imerg5_N/)
;an_cc     = (/Cor24pr,Cor24tmi,Cor24comb,Cor24merge,Cor24imerg4,Cor24imerg5/)
;an_rat    = (/pr_N,   tmi_N,   comb_N,   merge_N,   imerg4_N,   imerg5_N/)
;an_cc     = (/Cor24pr,Cor24tmi,Cor24comb,Cor24merge,Cor24imerg4,Cor24imerg5/)
 

;---2º script

; create some dummy data. ;
; All ratio values must be between 0 and 3.25
; All cross correlation values are 0.0 to 1.0 [inclusive]
;**********************************
ndevs	=   (/an_rat,an_rat,an_rat,an_rat,an_rat,an_rat/)	    ;new1
ncors	=   (/an_cc,an_cc,an_cc,an_cc,an_cc,an_cc/)

gdevs	=   (/an_rat,an_rat,an_rat,an_rat,an_rat,an_rat/)	    ;gfs
gcors	=   (/an_cc,an_cc,an_cc,an_cc,an_cc,an_cc/)

printVarSummary(gdevs)
printVarSummary(gcors)

;**********************************
; Put the ratios and pattern correlations into
; arrays for plotting
;**********************************
    nDataSets  = 2						    ; number of datasets
    npts       = dimsizes(ndevs(0,:))				    ;dimsizes(ndevs(0,:))
    npts       = dimsizes(ncors(0,:))				    ;dimsizes(ncors(0,:))
    ratio      = new ((/nDataSets, npts/),double )
    cc         = new ((/nDataSets, npts/),double )

wks   =	    gsn_open_wks("png","CD_A"+(a+1)+"taylor-br") 
;**********************************

res			    =   True
res@ccRays		    =   (/0.4, 0.75, 0.95 /)		    ; correllation rays
res@centerDiffRMS	    =   True				    ; RMS 'circles'
res@centerDiffRMS_color	    =   "gray50"			    ; default is "black"
res@tiMainFontHeightF	    =   0.018;0.016
res@taylorDraw		    =   False				    ; don't draw
res@taylorFrame		    =   False				    ; don't advance frame
res@cnLineThicknessF  = 2. 

;#add 03_04_18
;lgres                    = True
;  lgres@lgLineColors     = (/"foreground","blue"/)
;    lgres@lgLineThicknessF   = res@cnLineThicknessF  ; legend line thickness = contour line thickness
;      lgres@lgItemType         = "Lines"        ; show lines only (default)
;        lgres@lgLabelFontHeightF = .08            ; set the legend label font thickness
;	  lgres@vpWidthF           = .9           ; width of legend (NDC)
;	    lgres@vpHeightF          = .7            ; height of legend (NDC)
;	      lgres@lgPerimColor       = "orange"       ; draw the box perimeter in orange
;	        lgres@lgPerimThicknessF  = 5.0            ; thicken the box perimeter
;		  lbid = gsn_create_legend(wks,2,(/" T3"," T5"/),lgres)         ; create legend
;#fim

;#-- ratios plots   - amazon
ratio(0,:)		    =   ndevs(0,:)
cc(0,:)			    =   ncors(0,:)

ratio(1,:)		    =   gdevs(0,:)
cc(1,:)			    =   gcors(0,:)

;#
ptres			    =	True
ptres@gsMarkerSizeF         =	09
ptres@gsMarkerThicknessF    =	2
ptres@gsMarkerIndex	    =	12				    ; Markers

res@tiMainString    =	"A"+(a+1) 
drawNDCGrid(wks)
plot		    =	taylor_diagram(wks, ratio, cc, res)
    draw(plot)				                            ; draw the plot
    frame(wks)
;    drawNDCGrid(wks)



;#add 04_04_18
lgres                    = True
lgres@lgLineColors     = (/"foreground","blue"/)
;lgres@lgLineThicknessF   = res@cnLineThicknessF  ; legend line thickness = contour line thickness
lgres@lgItemType         = "Lines"        ; show lines only (default)
;lgres@lgLabelFontHeightF = .08            ; set the legend label font thickness
lgres@vpWidthF           = 1           ; width of legend (NDC)
lgres@vpHeightF          = 2            ; height of legend (NDC)
lgres@lgPerimColor       = "orange"       ; draw the box perimeter in orange
;lgres@lgPerimThicknessF  = 5.0            ; thicken the box perimeter
lbid = gsn_create_legend(wks,2,(/" T3"," T5"/),lgres)         ; create legend
draw(lbid)											  
;fim add 04_04_18
;#add 05_04_18
txres1                                    = True                     ; text mods desired

txres1@txFontHeightF                      = 0.002
txres1@txPerimOn                          = False ;True
txres1@txFont                              = "helvetica-bold"

h=(/"24 h"/)
x=(/0.749/)
y=(/0.993/)
gsn_text_ndc(wks,h,x,y(:),txres1)
;#fim add 05_04_18

;# Cases [Model]

;case			    =	(/"GFS","BAM","MERGE-v5"/)
;nCase			    =	dimsizes(case )			    ; # of Cases [Cases]
;res@Markers		    =	(/16, 16,16, 16,12/)		    ; make all solid fill
;res@caseLabels		    =	case				    ;(-1::)

;res@tiMainString    =	" "
;plot(6)		    = taylor_diagram(wks, ratio, cc, res)

								    ;drawNDCGrid(wks)

;      star			= True
;      star@gsMarkerSizeF        = 09
;      star@gsMarkerThicknessF   = 2
;      star@gsMarkerIndex	= 12				    ; Markers


;  gsn_polymarker_ndc(wks,0.317,0.0457,ptres)			    ;ok plata draw star ref
; gsn_polymarker_ndc(wks,0.317,0.377,ptres)			    ;ok sudest 
;  gsn_polymarker_ndc(wks,0.652,0.374,ptres)			    ; central 
;  gsn_polymarker_ndc(wks,0.484,0.705,ptres)			    ; nort 
;  gsn_polymarker_ndc(wks,0.15,0.705,ptres)			    ; amazon 
;  gsn_polymarker_ndc(wks,0.819,0.705,ptres)			    ; amazon


;txres			= True					    ; Set up resource list for text strings
;txres@txFontHeightF	= 0.015

;gsn_text_ndc(wks,"{ano}",0.7,0.27,txres)
								    ;gsn_text_ndc(wks,"Primavera",0.7,0.27,txres)
;gsn_text_ndc(wks,"{mes}",0.58,0.27,txres)

; *******************************************************************
; Create demo panels
; *******************************************************************
;  resP					    = True
;  resP@gsnFrame			    = True		    ;False 
;  resP@gsnMaximize			    = False		    ;True
;  resP@gsnPanelFigureStrings		    = (/"a) Amazon(B5)","b) Northeast(B4)","c) Central West(B3)", 
;						"d) Southeast","e) La Plata(B1)","f)South America "/)
;  resP@gsnPanelFigureStringsFontHeightF	    = 0.013
;  resP@amJust				    = "TopLeft"
;  resP@amParallelPosF                       = -0.48
;  resP@amOrthogonalPosF                     = -0.58
;  resP@gsnPanelFigureStringsPerimOn         = False
;  resP@gsnPanelXWhiteSpacePercent           = 5.0;
;  resP@gsnPanelYWhiteSpacePercent           = 5.0;
;  resP@gsnPanelRowSpec = True
 
							    ;gsn_panel(wks,plot,(/3,2,2/),resP)
;  gsn_panel(wks,plot,(/3,3,2/),resP)
  delete(wks)
;  system("convert -trim -density 300 -rotate -360 CD_A"+(a+1)+"taylor-br.ps CD_A"+(a+1)+"taylor-br.png")
;  system("rm CD_A"+(a+1)+"taylor-br.ps")
  print("OK")


end do
;end 

;---Fim do segundo script



end
