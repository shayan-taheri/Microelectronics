Lab2: Current Mirror Circuit A
******************************
** Chris Winstead
** ECE 5420
** Fall 2014
******************************
.include ../lab_parts.md
.param DD=5

*Voltage Sources basic current mirror
VDD nvdd 0 DC {DD}
VX  nvx  0 DC {DD}

*Resistors
Rref nvdd n1a 1k
RL   nvx n2a 1k

* meter sources
Vm1 n1a ngs DC 0V
Vm2 n2a n2 DC 0V

*********************************
* Standard Current Mirror Part A
*********************************
XM1 ngs ngs 0 0 aldn
XM2 n2 ngs 0 0 aldn
*********************************

.end
