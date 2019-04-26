% Predicted characteristics for OTA based on ALD1105 devices
% -----------------------------------------
% MAKE SURE TO PUT THE CORRECT Rref HERE:
% -----------------------------------------
Rref = 10e3;

% Device parameters:
Kn   = 7e-04;
ln   = 0.042;
Vthn = 0.75;

Kp   = 1.9e-04;
lp   = 0.017;
Vthp = -0.74;

% Bias solution:
VDD  = 5;
Vov  = % FILL IN THE SOLUTION

VGS  = Vov + Vthn;
Iref = 0.5*Kn*Vov^2
ID3  = Iref;
ID2  = Iref/2
ID5  = ID2;

Vovp = sqrt(2*ID2/Kp)

% Predicted gain and output resistance for the OTA stage (stage 1):
gm2  = % FILL IN THE SOLUTION
ro2  = % FILL IN THE SOLUTION
ro5  = % FILL IN THE SOLUTION

Rout1 = % FILL IN THE SOLUTION
Avo1  = % FILL IN THE SOLUTION

Vicm_min = % FILL IN THE SOLUTION
Vout_min = % FILL IN THE SOLUTION
Vout_max = % FILL IN THE SOLUTION

% Predicted gain for the CS stage (stage 2):
% Assume the OTA's output is at the bottom of its
% allowed range:
VY    = Vout_min; 
ID7   = 0.5*Kp*(VDD-VY-abs(Vthp))^2;
ro7   = 1/(lp*ID2);
gm7   = sqrt(2*Kp*ID7);

Rout2 = % FILL IN THE SOLUTION
Avo2  = % FILL IN THE SOLUTION

%-----------------------------------------------
% CLOSED-LOOP CONFIGURATION
%-----------------------------------------------
R2 = 10e3;
R1 = 1e3;

% Open-loop gain when loaded by feedback resistor R2:
AVL = Avo1*Avo2*(R2/(Rout2 + R2))

% Final closed-loop gain:
G = (R2/R1);
ACL = (G)*AVL/(1+G+AVL)
