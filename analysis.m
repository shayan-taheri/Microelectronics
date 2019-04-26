%-------------------------------------
% analysis.m
%-------------------------------------
% By Chris Winstead for ECE 5420
% Utah State University
%
% Description:
% This script generates plots for the
% differential amplifier pre-lab 
% exercises. You need to make small
% modifications for each exercise.
%-------------------------------------


%-------------------------------------
% This line will run the script
% to calculate your predicted values
%-------------------------------------
predictions

%----------------------------------------------------
% MODIFY these lines as needed for each exercise. 
% The 'predicted_gain' variable should refer to the 
% appropriate prediction, e.g. for Exercise 3 and 4 
% it should be set to Avo1; for Exercise 10 it should
% be set to ACL.
%----------------------------------------------------
datafilename = 'ex10.dat';
predicted_gain = ACL;
%----------------------------------------------------

data = dlmread(datafilename);
Vicm = data(:,2);
Iref = data(:,3);
Gain = data(:,4);
GaindB = data(:,5);
BW = data(:,6);

% Gain vs Vicm
figure(1)
plot(Vicm, Gain, Vicm, predicted_gain*ones(1,length(Vicm)),'--')
grid on
xlabel('V_{CM} (V)')
ylabel('Gain (V/V)')

% Bandwidth vs Input Common Mode Voltage
figure(2)
plot(Vicm, BW)
grid on
xlabel('V_{CM} (V)')
ylabel('Bandwidth (Hz)')

% Bias Current vs Input Common Mode Voltage
figure(3)
semilogy(Vicm, Iref)
grid on
xlabel('V_{CM} (V)')
ylabel('I_{Ref} (A)')

