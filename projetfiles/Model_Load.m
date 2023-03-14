function [FileName] = Model_Load
FileName = '../Model/o3_surface_20180701000000.nc'; % define the name of the file to be used, the path is included

Contents = ncinfo(FileName); % Store the file content information in a variable.


% Load all the model data together
for idx = 1: 8
    AllData(idx,:,:,:) = ncread(FileName, Contents.Variables(idx).Name);
    fprintf('Loading %s\n', Contents.Variables(idx).Name); % display loading information
end

AllDataMem = whos('AllData').bytes/1000000;
fprintf('Memory used for all data: %.3f MB\n', AllDataMem)

StartLat = 1; % latitude location to start laoding
NumLat = 400; % number of latitude locations ot load
StartLon = 1; % longitude location to start loading
NumLon = 700; % number of longitude locations ot load
StartHour = 1; % starting time for analyises
NumHour = 1;
end