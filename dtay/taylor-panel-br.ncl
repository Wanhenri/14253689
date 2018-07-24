;**********************************
; taylor_1.ncl    ==> 06022015
;                     04032015             
;                     10032015  
;                     18032015
;**********************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"   
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl" 
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/time_axis_labels.ncl"
;load "./teste_contas_v2.2_versao_TMAX.ncl"
load "./read-data-br.ncl" 
load "./taylor_diagram_mod-3.25.ncl"

;**********************************
begin




;**********************************
; create some dummy data. ;
; All ratio values must be between 0 and 3.25
; All cross correlation values are 0.0 to 1.0 [inclusive]
;**********************************
  ndevs=(/an_rat,nn_rat,cn_rat,sn_rat,ln_rat,san_rat/)    ;new1
  ncors=(/an_cc,nn_cc,cn_cc,sn_cc,ln_cc,san_cc/)

  mdevs=(/am_rat,nm_rat,cm_rat,sm_rat,lm_rat,sam_rat/)    ;new2
  mcors=(/am_cc,nm_cc,cm_cc,sm_cc,lm_cc,sam_cc/)

  sdevs=(/as_rat,ns_rat,cs_rat,ss_rat,ls_rat,sas_rat/)    ;sl
  scors=(/as_cc,ns_cc,cs_cc,ss_cc,ls_cc,sas_cc/)

  gdevs=(/ag_rat,ng_rat,cg_rat,sg_rat,lg_rat,sag_rat/)    ;gfs
  gcors=(/ag_cc,ng_cc,cg_cc,sg_cc,lg_cc,sag_cc/)

  bdevs=(/abam_rat,nabam_rat,cabam_rat,sabam_rat,labam_rat,saabam_rat/) 
  bcors=(/abam_cc,nabam_cc,cabam_cc,sabam_cc,labam_cc,saabam_cc/)


;**********************************
; Put the ratios and pattern correlations into
; arrays for plotting
;**********************************
  nDataSets  = 6                               ; number of datasets
  npts       = dimsizes(ndevs(0,:))
  npts       = dimsizes(ncors(0,:))
  ratio      = new ((/nDataSets, npts/),double )
  cc         = new ((/nDataSets, npts/),double )

;**********************************
; create plot
;**********************************
  wks   = gsn_open_wks("ps","taylor-"+est(m)+"_panel-br_1") 

;**********************************
  plot = new(7,graphic)

  res                     = True
  ;res@Colors              = (/"blue","red","black","forestgreen"/);
;res@Colors              = (/"blue","red","black","forestgreen"/)
 ; res@Colors              = (/"blue","red","black","forestgreen","black"/);
  res@ccRays              = (/0.4, 0.75, 0.95 /) ; correllation rays
  res@centerDiffRMS       = True ; RMS 'circles'
  res@centerDiffRMS_color = "gray50"; default is "black"
  res@tiMainFontHeightF   = 0.018;0.016

  res@taylorDraw  = False                          ; don't draw
  res@taylorFrame = False                          ; don't advance frame

;;; ratios plots   - amazon
  ratio(3,:) = bdevs(0,:) ; ndevs(0,:)
  cc(3,:)    = bcors(0,:) ; ncors(0,:)

  ratio(2,:) = bdevs(0,:) ; mdevs(0,:)
  cc(2,:)    = bcors(0,:) ; mcors(0,:)

  ratio(1,:) = bdevs(0,:) ; sdevs(0,:)
  cc(1,:)    = bcors(0,:) ; scors(0,:)

  ratio(0,:) = bdevs(0,:)
  cc(0,:)    = bcors(0,:)

  ratio(4,:) = gdevs(0,:)
  cc(4,:)    = gcors(0,:)

;;;;
      ptres                    = True
      ptres@gsMarkerSizeF                = 09
      ptres@gsMarkerThicknessF          = 2
      ptres@gsMarkerIndex    = 12     ; Markers
      ;ptres@gsItemType         = "Markers"     ; draw markers only

  res@tiMainString    = " "

  plot(0)  = taylor_diagram(wks, ratio, cc, res)

;;; ratios plots - nordeste
  ratio(3,:) = bdevs(1,:) ; ndevs(1,:)
  cc(3,:)    = bcors(1,:) ;ncors(1,:)

  ratio(2,:) = bdevs(1,:) ;mdevs(1,:)
  cc(2,:)    = bcors(1,:) ;mcors(1,:)

  ratio(1,:) = bdevs(1,:) ;sdevs(1,:)
  cc(1,:)    = bcors(1,:) ;scors(1,:)

  ratio(0,:) = bdevs(1,:) ;bdevs(1,:)
  cc(0,:)    = bcors(1,:) ;bcors(1,:)

  ratio(4,:) = gdevs(1,:)
  cc(4,:)    = gcors(1,:)

  res@tiMainString    = " "
  plot(1)  = taylor_diagram(wks, ratio, cc, res)


;;; ratios plots - nordeste
  ratio(3,:) = bdevs(2,:) ; ndevs(2,:)
  cc(3,:)    = bcors(2,:) ; ncors(2,:)

  ratio(2,:) = bdevs(2,:) ; mdevs(2,:)
  cc(2,:)    = bcors(2,:) ; mcors(2,:)

  ratio(1,:) = bdevs(2,:) ; sdevs(2,:)
  cc(1,:)    = bcors(2,:) ; scors(2,:)

  ratio(0,:) = bdevs(2,:)
  cc(0,:)    = bcors(2,:)

  ratio(4,:) = gdevs(2,:)
  cc(4,:)    = gcors(2,:)

  res@tiMainString    = " "
  plot(2)  = taylor_diagram(wks, ratio, cc, res)



;;; ratios plots  - central
  ratio(3,:) = bdevs(3,:) ; ndevs(3,:)
  cc(3,:)    = bcors(3,:) ; ncors(3,:)

  ratio(2,:) = bdevs(3,:) ; mdevs(3,:)
  cc(2,:)    = bcors(3,:) ; mcors(3,:)

  ratio(1,:) = bdevs(3,:) ; sdevs(3,:)
  cc(1,:)    = bcors(3,:) ; scors(3,:)

  ratio(0,:) = bdevs(3,:)
  cc(0,:)    = bcors(3,:)

  ratio(4,:) = gdevs(3,:)
  cc(4,:)    = gcors(3,:)

  res@tiMainString    = " "
  plot(3)  = taylor_diagram(wks, ratio, cc, res)

;;; ratios plots - sudeste
  ratio(3,:) = bdevs(4,:)  ; ndevs(4,:)
  cc(3,:)    = bcors(4,:)  ; ncors(4,:)

  ratio(2,:) = bdevs(4,:)  ; mdevs(4,:)
  cc(2,:)    = bcors(4,:)  ; mcors(4,:)

  ratio(1,:) = bdevs(4,:)  ; sdevs(4,:)
  cc(1,:)    = bcors(4,:)  ; scors(4,:)

  ratio(0,:) = bdevs(4,:)
  cc(0,:)    = bcors(4,:)

  ratio(4,:) = gdevs(4,:)
  cc(4,:)    = gcors(4,:)

  res@tiMainString    = " "
  plot(4)  = taylor_diagram(wks, ratio, cc, res)

;;; ratios plots - plata
  ratio(3,:) = bdevs(5,:);ndevs(5,:)
  cc(3,:)    = bcors(5,:);ncors(5,:)

  ratio(2,:) = bdevs(5,:);mdevs(5,:)
  cc(2,:)    = bcors(5,:);mcors(5,:)

  ratio(1,:) = bdevs(5,:);sdevs(5,:)
  cc(1,:)    = bcors(5,:);scors(5,:)

  ratio(0,:) = bdevs(5,:)
  cc(0,:)    = bcors(5,:)

  ratio(4,:) = gdevs(5,:)
  cc(4,:)    = gcors(5,:)

;;; Cases [Model]
case      =(/"BAM","M3","M2","M1","GFS","MERGE-v5"/)
;case      =(/"M3","M2","M1","","ERA-interim"/)

;case      =(/"M1","M2","M3","MERGE"/)
  nCase     = dimsizes(case )                 ; # of Cases [Cases]

res@Markers      = (/16,16, 16,16, 16,12/)               ; make all solid fill
;anterior 16/03  res@Markers      = (/16, 16,16, 16,12/)               ; make all solid fill
;res@Markers      = (/16, 16,16,12,16/)
  res@caseLabels   = case



  res@tiMainString    =" "
  plot(5)  = taylor_diagram(wks, ratio, cc, res)

;drawNDCGrid(wks)

      star                    = True
      star@gsMarkerSizeF                = 09
      star@gsMarkerThicknessF          = 2
      star@gsMarkerIndex    = 12     ; Markers


  gsn_polymarker_ndc(wks,0.317,0.0457,ptres)  ;ok plata draw star ref
  gsn_polymarker_ndc(wks,0.317,0.377,ptres)  ;ok sudest 
  gsn_polymarker_ndc(wks,0.652,0.374,ptres)  ; central 
  gsn_polymarker_ndc(wks,0.484,0.705,ptres)  ; nort 
  gsn_polymarker_ndc(wks,0.15,0.705,ptres)  ; amazon 
  gsn_polymarker_ndc(wks,0.819,0.705,ptres)  ; amazon



    txres           = True   ; Set up resource list for text strings
  txres@txFontHeightF = 0.015
;  gsn_text_ndc(wks,"Nine possible values for resource 'txJust'",0.5,0.27,txres)

  gsn_text_ndc(wks,estacao,0.7,0.27,txres)
  ;gsn_text_ndc(wks,"Primavera",0.7,0.27,txres)
  gsn_text_ndc(wks,"Season:",0.58,0.27,txres)






; *******************************************************************
; Create demo panels
; *******************************************************************
  resP                                  = True
  resP@gsnFrame         = True;False 
  resP@gsnMaximize                      = False;True
  resP@gsnPanelFigureStrings            = (/"a) Amazon(B5)","b) Northeast(B4)","c) Central West(B3)", \
                                           "d) Southeast","e) La Plata(B1)","f)South America "/)
  resP@gsnPanelFigureStringsFontHeightF = 0.013
  resP@amJust                           = "TopLeft"
  resP@amParallelPosF                         = -0.48
  resP@amOrthogonalPosF                       = -0.58
  resP@gsnPanelFigureStringsPerimOn           = False
  resP@gsnPanelXWhiteSpacePercent               = 5.0;
  resP@gsnPanelYWhiteSpacePercent               = 5.0;
  resP@gsnPanelRowSpec = True
 
  gsn_panel(wks,plot,(/3,2,2/),resP)
;  delete(wks)
  system("convert -trim -density 300 -rotate -360 taylor-"+est(m)+"_panel-br_1.ps taylor-"+est(m)+"_panel-br_1.png ; rm taylor-"+est(m)+"_panel-br_1.ps")

  print("OK")

end 

