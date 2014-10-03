$PROBLEM    PK model
$INPUT      ID TIME DV DROP DROP AMT DROP DROP WT
$DATA       ../../m1/mc-1.sim_data_1_copy.dta IGNORE=@
$SUBROUTINE ADVAN1 TRANS2
$PK 
 
 CL  = THETA(1) * EXP(ETA(1))
 V   = THETA(2) * EXP(ETA(2))
 ;BASCL = THETA(3)
 ;EMAX  = THETA(4)
 ;E50   = THETA(5)
 ;HL    = THETA(6)

 ;CL    = BASCL+TVCL*((EMAX*WT**HL)/(E50**HL+WT**HL))
 ;V     = TVV *(WT/70)

 SC    = V
  
$ERROR 
 IPRED = F
 Y= IPRED*(1+EPS(1))+EPS(2)

$THETA  (0,1,100) ; TVCL
 (0,20,100) ; TVV
; (0, 2, 10)            ; EMAX
; (0, 25,  200)         ; E50
; (0, 5, 20)            ; HL
$OMEGA  0.05
 0.05
$SIGMA  0.015
 0.0015
$SIMULATION (936027) ONLYSIM
$TABLE      ID TIME DV AMT WT NOPRINT NOAPPEND ONEHEADER
            FILE=mc-sim-2.dat
