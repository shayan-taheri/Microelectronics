* OTA Circuit Description
********************************
** By Chris Winstead
** ECE 5420
** Utah State University
********************************

.global 0 nvdd


**********************************************************
** SUBCIRCUIT DEFINITIONS
**********************************************************
.subckt nmirror in out 
XN1 in  in 0 0 aldn
XN2 out in 0 0 aldn
.ends

.subckt pmirror in out 
XP1 in  in nvdd nvdd aldp
XP2 out in nvdd nvdd aldp
.ends

.subckt ndiffpair inplus inminus outplus outminus source
XN1 outminus inplus  source 0 aldn
XN2 outplus  inminus source 0 aldn
.ends






**********************************************************
** REFERENCE RESISTOR
**********************************************************
Rref nvdd nref {Rref}



**********************************************************
** OTA CIRCUIT
**********************************************************
X1  nplus  nminus  nx nout nsource  ndiffpair
X2  nx     nout                     pmirror
X3  nref   ns                       nmirror

**********************************************************
** METER SOURCE FOR THE TAIL CURRENT
**********************************************************
Vmtail nsource ns DC 0V


