load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl" 
load "taylor_diagram_mod-3.25.ncl"


;>>>>>>>BAM com dados de assimilacao<<<<<<<<<
new1 = addfile ("MAY2015_24Z_12Z_SMG.nc", "r")
new1_24=new1->prec
new1_24@_FillValue=-9.99e+08; -9999

;new1 = addfile ("MAY2015_48Z_12Z_SMG.nc", "r")
;new1_48=new1->prec
;new1_48@_FillValue=-9.99e+08; -9999

;new1 = addfile ("MAY2015_72Z_12Z_SMG.nc", "r")
;new1_72=new1->prec
;new1_72@_FillValue=-9.99e+08; -9999
;*
;*
;*
;>>>>>>>BAM dados NCEP<<<<<<<<<<<<<<<<<<<<<<
;fall2 = addfile ("MAY2015_24Z_12Z_NCEP.nc", "r")
;new2_24 = fall2->prec
;new2_24@_FillValue=-9.99e+08; -9999

;fall2 = addfile ("MAY2015_48Z_12Z_NCEP.nc", "r")
;new2_48 = fall2->prec
;new2_48@_FillValue=-9.99e+08; -9999

;fall2 = addfile ("MAY2015_72Z_12Z_NCEP.nc", "r")
;new2_72 = fall2->prec
;new2_72@_FillValue=-9.99e+08; -9999
;*
;*
;*
;>>>>>>>GFS<<<<<<<<<<<<<<<<<<<<<<
;fall3 = addfile ("prev.2015.mar.24h_seldate.nc", "r")
;gfs_24 = fall3->APCP_surface
;gfs_24@_FillValue=-9.99e+08

;fall3 = addfile ("prev.2015.mar.48h_seldate.nc", "r")
;gfs_48 = fall3->APCP_surface
;gfs_48@_FillValue=-9.99e+08

;fall3 = addfile ("prev.2015.mar.72h_seldate.nc", "r")
;gfs_72 = fall3->APCP_surface
;gfs_72@_FillValue=-9.99e+08
;*
;*
;*
;>>>>>IMERG
fall3 = addfile ("GPM_REC_ACUM_24h_grib2.nc","r")
tmpa = fall3->PREC_surface

;>>>>Pensar num jeito de colocar as coordenadas num array

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
      ;>Variando 24 48 72
       ema       = wgt_areaave_Wrap(tmpa   (:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)   ; referencial 
       pr        = wgt_areaave_Wrap(new1_24(:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)	    ; satelite
       tmi       = wgt_areaave_Wrap(new1_24(:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)	    ; satelite
       comb      = wgt_areaave_Wrap(new1_24(:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)	    ; satelite
       cfsr      = wgt_areaave_Wrap(new1_24(:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)	    ; reanalise
       merge     = wgt_areaave_Wrap(new1_24(:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)	    ; satelite
       imerg4    = wgt_areaave_Wrap(new1_24(:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)	    ; satelite
       imerg5    = wgt_areaave_Wrap(new1_24(:,{lai:laf},{loi+360:lof+360}),1.0,1.0,0)	    ; satelite
       print("FIM MEDIA")
      print("         ")
      print("INICIO DESVIO PADRAO")
      ;;;#######DESVIO PADRAO
      ema_tdev   =    dim_stddev_n_Wrap(ema,0)      ;observado
      ;>Variando 24 48 72
      ;>variando cada Area 
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
      ;<><><>processo acima para cada tempo e area 
      ;<><><Apos fazer todo o processo acima, ele reordena os arrays 
      ;cada modelo com todos os seus tempos 
      ;exemplo:
        ;'vm24a1=ndtooned(aa1m24)'       
        ;'vm24a2=ndtooned(aa2m24)'
        ;'vm24a3=ndtooned(aa3m24)'
        ;'vm24a4=ndtooned(aa4m24)'
        ;'vm24a5=ndtooned(aa5m24)'
        ;'vm24a6=ndtooned(aa6m24)'

          
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
      
      print("OK")
      
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
      lgres@lgItemType         = "Lines"        ; show lines only (default)
      lgres@vpWidthF           = 1           ; width of legend (NDC)
      lgres@vpHeightF          = 2            ; height of legend (NDC)
      lgres@lgPerimColor       = "orange"       ; draw the box perimeter in orange
      lbid = gsn_create_legend(wks,2,(/" T3"," T5"/),lgres)         ; create legend
      draw(lbid)											  
      
      txres1                                    = True                     ; text mods desired
      txres1@txFontHeightF                      = 0.002
      txres1@txPerimOn                          = False ;True
      txres1@txFont                              = "helvetica-bold"
      
      h=(/"24 h"/)
      x=(/0.749/)
      y=(/0.993/)
      gsn_text_ndc(wks,h,x,y(:),txres1)
      print("OK")
      
end do
;end 

;---Fim do segundo script



;end
