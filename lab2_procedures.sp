LAB2: Current Mirrors (Part 1) Simulation Procdures

* Start of control commands
.control


* Loop through all the circuits:
foreach file "circuita.sp" "circuitb.sp" "circuitc.sp" "circuitd.sp"

* Load the appropriate circuit:
source $file

** PROCEDURE 1
OP
echo Operating Point for $file
echo *****************************
echo Important device parameters:
echo *****************************
show m.xm1.m1 : vdsat gds
*print v(n2) i(Vm1) i(Vm2)
wrdata proc2_$file v(n2) i(Vm1) i(Vm2) v(ngs)

** PROCEDURE 2
DC RL 100 2000 10
echo DC sweep of RL for $file
*print v(n2) i(Vm1) i(Vm2)
plot i(Vm2) i(Vm1)
wrdata proc3_$file v(n2) i(Vm1) i(Vm2)

** PROCEDURE 3
DC VX 0 10 0.1
echo DC sweep of VX for $file
*print v(n2) i(Vm1) i(Vm2)
wrdata proc4_$file v(n2) i(Vm1) i(Vm2)

* End of foreach loop
end

* End of control commands
.endc

* End of file
.end
