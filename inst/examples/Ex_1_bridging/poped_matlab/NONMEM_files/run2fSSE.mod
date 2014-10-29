$PROB PK model

$INPUT ID TIME DV AMT WT
$DATA datarich.csv IGNORE=@       

$SUBROUTINES ADVAN1 TRANS2
$PK

 TVCL  = THETA(1) * EXP(ETA(1))
 TVV   = THETA(2) * EXP(ETA(2))
 EMAX  = THETA(3)
 E50   = THETA(4)
 HL    = THETA(5)

 CL    = TVCL+((EMAX*WT**HL)/(E50**HL+WT**HL))
 V     = TVV *(WT/70)

 SC    = V
  
$THETA
 (0,  1,   100)        ; TVCL
 (0,  20,   100)       ; TVV
 (0, 2, 100)            ; EMAX
 (0, 25,  1000)         ; E50
 (0, 5, 20)            ; HL
$OMEGA
 0.05 
 0.05 
$SIGMA
 0.015
 0.0015
$ERROR
 IPRED = F
 Y= IPRED*(1+EPS(1))+EPS(2)

;$SIM (1000) ONLYSIM NSUBPROBLEM=1
;$TABLE ID TIME DV AMT FILE=outA.tab NOAPPEND NOPRINT NOHEADER
$EST METHOD=1 INTER MAXEVAL=9999 SIG=3 PRINT=5 NOABORT POSTHOC
$COV MATRIX=S UNCONDITIONAL
