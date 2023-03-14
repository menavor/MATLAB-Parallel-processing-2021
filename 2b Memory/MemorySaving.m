%% This script allows you to open and explore the data in a *.nc file
clear all % clear all variables
close all % close all windows

FileName = '../Model/o3_surface_20180701000000.nc'; % define the name of the file to be used, the path is included

Contents = ncinfo(FileName); % Store the file content information in a variable.


%% Section 2: Load all the model data together
[AllDataMem] = LoadAllData(FileName);

%% Section 3: Loading all the data for a single hour from all the models
[HourDataMem] = LoadHours(FileName);

%% Section 4: Cycle through the hours and load all the models for each hour and record memory use
[HourMem] = LoadAllHours(FileName);

%% Section 5: Print our results
fprintf('\nResults:\n')
fprintf('Memory used for all data: %.2f MB\n', AllDataMem)
fprintf('Memory used for hourly data: %.2f MB\n', HourDataMem)
fprintf('Maximum memory used hourly = %.2f MB\n', HourMem)
fprintf('Hourly memory as fraction of all data = %.2f\n\n', HourMem / AllDataMem)