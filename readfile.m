function [C] = readfile(filename)
%READFILE Read the file that name passed through parameter
%   Read the file that name passed through parameter
fileID = fopen(filename,'r');
formatSpec = '%c';
C = fscanf(fileID,formatSpec);
fclose(fileID);
end

