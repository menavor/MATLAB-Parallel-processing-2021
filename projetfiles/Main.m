tic
[FileName] = Model_Load; %Loads the dataset and needed parameters
toc

tic %Times execution
for Nproc = 1:6
   for NuHour = 1:25
       if Nproc == 1
           [tSeq, T2] = SequentialProcessing(FileName, NuHour); %Processes the hour
       else
  
           [Onehour, T2] = ParallelProcessing(FileName, Nproc, NuHour); %Processes the hour
       end
   end
   TimeLoop = toc; %Times execution
   fprintf(LogID, '%s: Processing of %s finished for %.2f with %i workers \n',datestr(now, 0), FileName, TimeLoop, Nproc);
end