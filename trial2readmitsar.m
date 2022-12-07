clear all
clc 
for I = eye (2);
subjectNum = input('\n Input Subject ID and Press Enter to start the trial \n'); % wait until enter is pressed
% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');

x = 1;
eegstarttime = clock;
tic
while toc<340
    % get data from the inlet
    while toc>0 && toc<340
        [chdata(x,:),tsdata(x,1)] = inlet.pull_sample();
        x = x + 1;
    end
   
   
end
disp('Recording stopped...');
% save('test.mat','X')
save([sprintf('%02d',subjectNum) 'mitsar'],'chdata','tsdata','eegstarttime');
disp('Data saved in MAT file...');

% fprintf('time: %.5f\n',tsdata(x,1));
end
