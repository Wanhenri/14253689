i=1
anomes=201505
anoname=MAY2015
while(i<=31)
hour = 12
if(i<10); i = '0'i; endif;
j=1
*while(j<=2)
if(hour<10); hour = '0'hour; endif;
name = 'GPOSCPT'anomes''i''hour
rc = write(dummy.ctl,'dset ^GPOSCPT'anomes''i''hour'%y4%m2%d2%h2P.fct.TQ0299L064.grb')
rc = write(dummy.ctl,'*',append)
rc = write(dummy.ctl,'index ^GPOSCPT'anomes''i''hour'.idx',append)
rc = write(dummy.ctl,'*',append)
rc = write(dummy.ctl,'undef 9.999E+20',append)
*rc = write(dummy.ctl,'undef -9.99e+08',append)
rc = write(dummy.ctl,'*',append)
rc = write(dummy.ctl,'title PRESSURE HISTORY    PTEC AGCM REVIS 1.0 2000  T029964   COLD',append)
rc = write(dummy.ctl,'*',append)
rc = write(dummy.ctl,'dtype grib   255',append)
rc = write(dummy.ctl,'*',append)
rc = write(dummy.ctl,'options template yrev',append)
rc = write(dummy.ctl,'*',append)
rc = write(dummy.ctl,'xdef   900 linear    0.000   0.4000000000',append)
rc = write(dummy.ctl,'ydef   450 levels',append)
rc = write(dummy.ctl,' -89.69415 -89.29794 -88.89940 -88.50032 -88.10105 -87.70167 -87.30225 -86.90279',append)
rc = write(dummy.ctl,' -86.50331 -86.10381 -85.70430 -85.30479 -84.90526 -84.50574 -84.10621 -83.70667',append)
rc = write(dummy.ctl,' -83.30714 -82.90760 -82.50806 -82.10851 -81.70897 -81.30943 -80.90988 -80.51033',append)
rc = write(dummy.ctl,' -80.11079 -79.71124 -79.31169 -78.91214 -78.51259 -78.11304 -77.71349 -77.31394',append)
rc = write(dummy.ctl,' -76.91439 -76.51484 -76.11528 -75.71573 -75.31618 -74.91663 -74.51708 -74.11752',append)
rc = write(dummy.ctl,' -73.71797 -73.31842 -72.91886 -72.51931 -72.11976 -71.72020 -71.32065 -70.92110',append)
rc = write(dummy.ctl,' -70.52154 -70.12199 -69.72244 -69.32288 -68.92333 -68.52377 -68.12422 -67.72466',append)
rc = write(dummy.ctl,' -67.32511 -66.92556 -66.52600 -66.12645 -65.72689 -65.32734 -64.92778 -64.52823',append)
rc = write(dummy.ctl,' -64.12867 -63.72912 -63.32956 -62.93001 -62.53045 -62.13090 -61.73134 -61.33179',append)
rc = write(dummy.ctl,' -60.93223 -60.53268 -60.13312 -59.73357 -59.33401 -58.93446 -58.53490 -58.13535',append)
rc = write(dummy.ctl,' -57.73579 -57.33624 -56.93668 -56.53713 -56.13757 -55.73802 -55.33846 -54.93891',append)
rc = write(dummy.ctl,' -54.53935 -54.13980 -53.74024 -53.34069 -52.94113 -52.54157 -52.14202 -51.74246',append)
rc = write(dummy.ctl,' -51.34291 -50.94335 -50.54380 -50.14424 -49.74469 -49.34513 -48.94558 -48.54602',append)
rc = write(dummy.ctl,' -48.14646 -47.74691 -47.34735 -46.94780 -46.54824 -46.14869 -45.74913 -45.34958',append)
rc = write(dummy.ctl,' -44.95002 -44.55046 -44.15091 -43.75135 -43.35180 -42.95224 -42.55269 -42.15313',append)
rc = write(dummy.ctl,' -41.75358 -41.35402 -40.95446 -40.55491 -40.15535 -39.75580 -39.35624 -38.95669',append)
rc = write(dummy.ctl,' -38.55713 -38.15757 -37.75802 -37.35846 -36.95891 -36.55935 -36.15980 -35.76024',append)
rc = write(dummy.ctl,' -35.36069 -34.96113 -34.56157 -34.16202 -33.76246 -33.36291 -32.96335 -32.56380',append)
rc = write(dummy.ctl,' -32.16424 -31.76468 -31.36513 -30.96557 -30.56602 -30.16646 -29.76691 -29.36735',append)
rc = write(dummy.ctl,' -28.96779 -28.56824 -28.16868 -27.76913 -27.36957 -26.97002 -26.57046 -26.17090',append)
rc = write(dummy.ctl,' -25.77135 -25.37179 -24.97224 -24.57268 -24.17313 -23.77357 -23.37401 -22.97446',append)
rc = write(dummy.ctl,' -22.57490 -22.17535 -21.77579 -21.37623 -20.97668 -20.57712 -20.17757 -19.77801',append)
rc = write(dummy.ctl,' -19.37846 -18.97890 -18.57934 -18.17979 -17.78023 -17.38068 -16.98112 -16.58157',append)
rc = write(dummy.ctl,' -16.18201 -15.78245 -15.38290 -14.98334 -14.58379 -14.18423 -13.78468 -13.38512',append)
rc = write(dummy.ctl,' -12.98556 -12.58601 -12.18645 -11.78690 -11.38734 -10.98778 -10.58823 -10.18867',append)
rc = write(dummy.ctl,'  -9.78912  -9.38956  -8.99001  -8.59045  -8.19089  -7.79134  -7.39178  -6.99223',append)
rc = write(dummy.ctl,'  -6.59267  -6.19311  -5.79356  -5.39400  -4.99445  -4.59489  -4.19534  -3.79578',append)
rc = write(dummy.ctl,'  -3.39622  -2.99667  -2.59711  -2.19756  -1.79800  -1.39845  -0.99889  -0.59933',append)
rc = write(dummy.ctl,'  -0.19978   0.19978   0.59933   0.99889   1.39845   1.79800   2.19756   2.59711',append)
rc = write(dummy.ctl,'   2.99667   3.39622   3.79578   4.19534   4.59489   4.99445   5.39400   5.79356',append)
rc = write(dummy.ctl,'   6.19311   6.59267   6.99223   7.39178   7.79134   8.19089   8.59045   8.99001',append)
rc = write(dummy.ctl,'   9.38956   9.78912  10.18867  10.58823  10.98778  11.38734  11.78690  12.18645',append)
rc = write(dummy.ctl,'  12.58601  12.98556  13.38512  13.78468  14.18423  14.58379  14.98334  15.38290',append)
rc = write(dummy.ctl,'  15.78245  16.18201  16.58157  16.98112  17.38068  17.78023  18.17979  18.57934',append)
rc = write(dummy.ctl,'  18.97890  19.37846  19.77801  20.17757  20.57712  20.97668  21.37623  21.77579',append)
rc = write(dummy.ctl,'  22.17535  22.57490  22.97446  23.37401  23.77357  24.17313  24.57268  24.97224',append)
rc = write(dummy.ctl,'  25.37179  25.77135  26.17090  26.57046  26.97002  27.36957  27.76913  28.16868',append)
rc = write(dummy.ctl,'  28.56824  28.96779  29.36735  29.76691  30.16646  30.56602  30.96557  31.36513',append)
rc = write(dummy.ctl,'  31.76468  32.16424  32.56380  32.96335  33.36291  33.76246  34.16202  34.56157',append)
rc = write(dummy.ctl,'  34.96113  35.36069  35.76024  36.15980  36.55935  36.95891  37.35846  37.75802',append)
rc = write(dummy.ctl,'  38.15757  38.55713  38.95669  39.35624  39.75580  40.15535  40.55491  40.95446',append)
rc = write(dummy.ctl,'  41.35402  41.75358  42.15313  42.55269  42.95224  43.35180  43.75135  44.15091',append)
rc = write(dummy.ctl,'  44.55046  44.95002  45.34958  45.74913  46.14869  46.54824  46.94780  47.34735',append)
rc = write(dummy.ctl,'  47.74691  48.14646  48.54602  48.94558  49.34513  49.74469  50.14424  50.54380',append)
rc = write(dummy.ctl,'  50.94335  51.34291  51.74246  52.14202  52.54157  52.94113  53.34069  53.74024',append)
rc = write(dummy.ctl,'  54.13980  54.53935  54.93891  55.33846  55.73802  56.13757  56.53713  56.93668',append)
rc = write(dummy.ctl,'  57.33624  57.73579  58.13535  58.53490  58.93446  59.33401  59.73357  60.13312',append)
rc = write(dummy.ctl,'  60.53268  60.93223  61.33179  61.73134  62.13090  62.53045  62.93001  63.32956',append)
rc = write(dummy.ctl,'  63.72912  64.12867  64.52823  64.92778  65.32734  65.72689  66.12645  66.52600',append)
rc = write(dummy.ctl,'  66.92556  67.32511  67.72466  68.12422  68.52377  68.92333  69.32288  69.72244',append)
rc = write(dummy.ctl,'  70.12199  70.52154  70.92110  71.32065  71.72020  72.11976  72.51931  72.91886',append)
rc = write(dummy.ctl,'  73.31842  73.71797  74.11752  74.51708  74.91663  75.31618  75.71573  76.11528',append)
rc = write(dummy.ctl,'  76.51484  76.91439  77.31394  77.71349  78.11304  78.51259  78.91214  79.31169',append)
rc = write(dummy.ctl,'  79.71124  80.11079  80.51033  80.90988  81.30943  81.70897  82.10851  82.50806',append)
rc = write(dummy.ctl,'  82.90760  83.30714  83.70667  84.10621  84.50574  84.90526  85.30479  85.70430',append)
rc = write(dummy.ctl,'  86.10381  86.50331  86.90279  87.30225  87.70167  88.10105  88.50032  88.89940',append)
rc = write(dummy.ctl,'  89.29794  89.69415',append)
rc = write(dummy.ctl,'tdef   21 linear 'hour'Z'i''anoname' 6hr',append)
rc = write(dummy.ctl,'*',append)
rc = write(dummy.ctl,'zdef    33 levels  1000  985  975  960  950  930  925  915  900  880',append)
rc = write(dummy.ctl,'                  875  850  825  800  775  750  725  700  675  650',append)
rc = write(dummy.ctl,'                  600  500  300  250  200  150  100   70   50   30',append)
rc = write(dummy.ctl,'                   20   10    3',append)
rc = write(dummy.ctl,'vars    52',append)
rc = write(dummy.ctl,'topo  0 132,1,0 ** surface TOPOGRAPHY [m]',append)
rc = write(dummy.ctl,'lsmk  0  81,1,0 ** surface LAND SEA MASK [0,1]',append)
rc = write(dummy.ctl,'PSLC    0  135,    1,    0  ** sfc    SURFACE PRESSURE                        (HPA             )',append)
rc = write(dummy.ctl,'UVES    0  192,    1,    0  ** sfc    SURFACE ZONAL WIND (U)                  (M/S             )',append)
rc = write(dummy.ctl,'UVEL   33   33,  100,    0  **        ZONAL WIND (U)                          (M/S             )',append)
rc = write(dummy.ctl,'VVES    0  194,    1,    0  ** sfc    SURFACE MERIDIONAL WIND (V)             (M/S             )',append)
rc = write(dummy.ctl,'VVEL   33   34,  100,    0  **        MERIDIONAL WIND (V)                     (M/S             )',append)
rc = write(dummy.ctl,'OMEG   33   39,  100,    0  **        OMEGA                                   (PA/S            )',append)
rc = write(dummy.ctl,'VORT   33   43,  100,    0  **        VORTICITY                               (1/S             )',append)
rc = write(dummy.ctl,'FCOR   33   35,  100,    0  **        STREAM FUNCTION                         (M2/S            )',append)
rc = write(dummy.ctl,'POTV   33   36,  100,    0  **        VELOCITY POTENTIAL                      (M2/S            )',append)
rc = write(dummy.ctl,'ZGEO   33    7,  100,    0  **        GEOPOTENTIAL HEIGHT                     (GPM             )',append)
rc = write(dummy.ctl,'PSNM    0    2,  102,    0  ** msl    SEA LEVEL PRESSURE                      (HPA             )',append)
rc = write(dummy.ctl,'TEMS    0  188,    1,    0  ** sfc    SURFACE ABSOLUTE TEMPERATURE            (K               )',append)
rc = write(dummy.ctl,'TEMP   33   11,  100,    0  **        ABSOLUTE TEMPERATURE                    (K               )',append)
rc = write(dummy.ctl,'UMRS    0  226,    1,    0  ** sfc    SURFACE RELATIVE HUMIDITY               (NO DIM          )',append)
rc = write(dummy.ctl,'UMRL   33   52,  100,    0  **        RELATIVE HUMIDITY                       (NO DIM          )',append)
rc = write(dummy.ctl,'UMES   33   51,  100,    0  **        SPECIFIC HUMIDITY                       (KG/KG           )',append)
rc = write(dummy.ctl,'AGPL    0   54,  200,    0  ** atm    INST. PRECIPITABLE WATER                (KG/M2           )',append)
rc = write(dummy.ctl,'TSFC    0  187,    1,    0  ** sfc    SURFACE TEMPERATURE                     (K               )',append)
rc = write(dummy.ctl,'DO2A    0  155,  105,    2  ** sfc2m  PARTIAL OXYGEN DENSITY                  (g/m**3          )',append)
rc = write(dummy.ctl,'STTM    0  251,    1,    0  ** sfc    TIME MEAN SURFACE TEMPERATURE           (K               )',append)
rc = write(dummy.ctl,'PREC    0   61,    1,    0  ** sfc    TOTAL PRECIPITATION                     (KG/M2/DAY       )',append)
rc = write(dummy.ctl,'PRCV    0   63,    1,    0  ** sfc    CONVECTIVE PRECIPITATION                (KG/M2/DAY       )',append)
rc = write(dummy.ctl,'CSSF    0  122,    1,    0  ** sfc    SENSIBLE HEAT FLUX FROM SURFACE         (W/M2            )',append)
rc = write(dummy.ctl,'CLSF    0  121,    1,    0  ** sfc    LATENT HEAT FLUX FROM SURFACE           (W/M2            )',append)
rc = write(dummy.ctl,'USST    0  193,    1,    0  ** sfc    SURFACE ZONAL WIND STRESS               (PA              )',append)
rc = write(dummy.ctl,'VSST    0  195,    1,    0  ** sfc    SURFACE MERIDIONAL WIND STRESS          (PA              )',append)
rc = write(dummy.ctl,'CBNV    0   71,    3,    0  ** cltlay CLOUD COVER                             (0-1             )',append)
rc = write(dummy.ctl,'OLIS    0  207,    1,    0  ** sfc    DOWNWARD LONG WAVE AT BOTTOM            (W/M2            )',append)
rc = write(dummy.ctl,'OLES    0  211,    1,    0  ** sfc    UPWARD LONG WAVE AT BOTTOM              (W/M2            )',append)
rc = write(dummy.ctl,'ROLE    0  114,    8,    0  ** toa    OUTGOING LONG WAVE AT TOP               (W/M2            )',append)
rc = write(dummy.ctl,'OCIS    0  209,    1,    0  ** sfc    DOWNWARD SHORT WAVE AT GROUND           (W/M2            )',append)
rc = write(dummy.ctl,'OCES    0  212,    1,    0  ** sfc    UPWARD SHORT WAVE AT GROUND             (W/M2            )',append)
rc = write(dummy.ctl,'ROCE    0  214,    8,    0  ** toa    UPWARD SHORT WAVE AT TOP                (W/M2            )',append)
rc = write(dummy.ctl,'OCAS    0  111,    1,    0  ** sfc    SHORT WAVE ABSORBED AT GROUND           (W/M2            )',append)
rc = write(dummy.ctl,'TGSC    0  191,    1,    0  ** sfc    GROUND/SURFACE COVER TEMPERATURE        (K               )',append)
rc = write(dummy.ctl,'T2MT    0  229,  105,    2  ** sfc2m  TIME MEAN TEMP AT 2-M FROM SFC          (K               )',append)
rc = write(dummy.ctl,'Q2MT    0  228,  105,    2  ** sfc2m  TIME MEAN SPEC HUMIDITY AT 2-M FROM SFC (KG/KG           )',append)
rc = write(dummy.ctl,'w010    0  167,  105,   10  ** sfc10m SPEED WIND AT 10-M FROM SURFACE         (M/S             )',append)
rc = write(dummy.ctl,'TOZN    0   10,    1,    0  ** sfc    VERTICALLY INTEGRATED OZONE CONTENT     (DOBSON          )',append)
rc = write(dummy.ctl,'TPOR   33   17,  100,    0  **        DEW POINT TEMPERATURE                   (K               )',append)
rc = write(dummy.ctl,'U10T    0  216,  105,    2  ** sfc2m  TIME MEAN AT 10 METRE U-WIND COMPONENT  (M/S             )',append)
rc = write(dummy.ctl,'V10T    0  217,  105,    2  ** sfc2m  TIME MEAN AT 10 METRE V-WIND COMPONENT  (M/S             )',append)
rc = write(dummy.ctl,'CAPE    0  140,  200,    0  ** atm    CONVECTIVE AVAIL. POT.ENERGY            (M2/S2           )',append)
rc = write(dummy.ctl,'CINE    0  141,  200,    0  ** atm    CONVECTIVE INHIB. ENERGY                (M2/S2           )',append)
rc = write(dummy.ctl,'SWET    0  154,    1,    0  ** sfc    SEVERE WEATHER THREAT                   (                )',append)
rc = write(dummy.ctl,'w050    0  168,  105,   50  ** sfc50m SPEED WIND AT 50-M FROM SURFACE LAYER   (M/S             )',append)
rc = write(dummy.ctl,'w100    0  169,  105,  100  ** sfc100mSPEED WIND AT 100-M FROM SURFACE LAYER  (M/S             )',append)
rc = write(dummy.ctl,'d010    0  170,  105,   10  ** sfc10m DIR WIND AT 10-M FROM SURFACE LAYER     (DEGREES         )',append)
rc = write(dummy.ctl,'d050    0  171,  105,   50  ** sfc50m DIR WIND AT 50-M FROM SURFACE LAYER     (DEGREES         )',append)
rc = write(dummy.ctl,'d100    0  172,  105,  100  ** sfc100mDIR WIND AT 100-M FROM SURFACE LAYER    (DEGREES         )',append)
rc = write(dummy.ctl,'endvars',append)

rc = close(dummy.ctl)

***LN
*****Para dados pegando do online8
***'!ln -s /stornext/online8/mcga/w.santos/TQ0299L064/'anomes''i''hour'/GPOSCPT'anomes''i''hour''anomes''i''hour'P.icn.TQ0299L064.grb /stornext/online8/mcga/w.santos/TQ0299L064/'anomes''i''hour'/GPOSCPT'anomes''i''hour''anomes''i''hour'P.fct.TQ0299L064.grb'
'!ln -s /stornext/online6/assim_dados/gdad/eval_SMG_2.0.0/dados_temp_mauro/'anomes''i''hour'/GPOSCPT'anomes''i''hour''anomes''i''hour'P.icn.TQ0299L064.grb /stornext/online6/assim_dados/gdad/eval_SMG_2.0.0/dados_temp_mauro/'anomes''i''hour'/GPOSCPT'anomes''i''hour''anomes''i''hour'P.fct.TQ0299L064.grb'

*/stornext/online6/assim_dados/gdad/eval_SMG_2.0.0/dados_temp_mauro

*****DUMMY

******Para dados pegando do online8
'!mv dummy.ctl /stornext/online6/assim_dados/gdad/eval_SMG_2.0.0/dados_temp_mauro/'anomes''i''hour'/'name'.ctl'


****GRIBMAP

*****Para dados pegando no online8
'!gribmap -i /stornext/online6/assim_dados/gdad/eval_SMG_2.0.0/dados_temp_mauro/'anomes''i''hour'/'name'.ctl'

j = j + 1
*hour = 12
*endwhile
i = i + 1
endwhile
'quit'
      
