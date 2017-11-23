function [] = writefile(filename,str)
%WRITEFILE Write the string into the file passed through parameters
%   Write the string into the file passed through parameters
fileID = fopen(filename,'w');
formatSpec = '%c';
fprintf(fileID,formatSpec,str);
fclose(fileID);
end

