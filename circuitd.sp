Lab2: Current Mirror Circuit D
******************************
** Chris Winstead
** ECE 5420
** Fall 2014
******************************
.include ../lab_parts.md
.param DD=10

*Voltage Sources basic current mirror
VDD nvdd 0 DC DD
VX  nvx  0 DC DD

*Resistors
Rref nvdd n1a 1k
RL   nvx n2a 1k

* meter sources
Vm1 n1a n1 DC 0V
Vm2 n2a n2 DC 0V

*********************************
* Modified Wilson mirror
*********************************
XM1 n1 n1 n3 0 aldn
XM2 n2 n1 ngs 0 aldn
XM3 n3 ngs 0  0 aldn
XM4 ngs ngs 0  0 aldn
*********************************

.end
