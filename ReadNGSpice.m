function [data, labels] = ReadNGSpice(filename)
% [Data, Labels] = ReadSpice(filename)
%
% Data is an MxN matrix containing the values of the M variables
% at each of the N datapoints.
%
% Labels is a M-vector with the Mth label corresponding to the 
% Mth row in Data
%
% This script has been tested on raw (-r Out.raw) data from
% ngspice-rework17.
%
% Usage example:
% [data, labels] = ReadNGSpice('out.raw');
% labels (to view how the data is labeled)
% plot(data(1,:), data(6,:));
% title('Oscillator Output (V)');
%
% (c) Madison McGaffin, 2009

% Function variables
numVars = 0;
numPoints = 0;

% Open file
fid = fopen(filename, 'r');
if fid == -1
	error('Could not open file');
end

% Read headers
headerPattern = '(?<name>[^:]+):\s*(?<value>\w[\w\s]*)';
while feof(fid) == 0
	line = fgetl(fid);
	h = regexp(line, headerPattern, 'names');
	
	% Break when we're done reading headers. 
	if size(h) == 0
		break
	end

	if strcmp(h(1).name, 'No. Variables') == 1
		numVars = sscanf(h(1).value, '%f');
	end
	if strcmp(h(1).name, 'No. Points') == 1
		numPoints = sscanf(h(1).value, '%f');
	end
end

% Sanity check
assert(numVars > 0);
assert(numPoints > 0);

% Now we read the variables
labels = {};
varPattern = '\s*(?<num>[0-9]+)\s+(?<name>[^\s]+)\s+(?<type>[^\s]+)';
for varIndex = 1:numVars
	assert(feof(fid) == 0);
	line = fgetl(fid);
	h = regexp(line, varPattern, 'names');
	labels{varIndex} = sprintf('%s %s', h(1).name, h(1).type);
end

% Time to read the raw data.
line = fgetl(fid);
assert(strcmp(line, 'Binary:') == 1);
data = zeros(numVars, numPoints);

for col=1:numPoints
	for var=1:numVars
		assert(feof(fid) == 0);
		data(var,col) = double(fread(fid, 1, 'double'));
	end
end

fclose(fid);
end
