clear;
clc;
a = linspace(1,50,50);%(1,50,50)
a = a(randperm(length(a)));

b = linspace(51,100,50);
b = b(randperm(length(b)));%(51,100,50)

go = 1;


subjectNum = input('\n Input Subject ID and Press Enter to start the trial \n'); % wait until enter is pressed


for I = eye (2)
    
    if go == 1
        seqarr = a;
        ses = 'a';
        go = 2;
    elseif go == 2
        seqarr = b;
        ses = 'b';
        go = 3;
    end
    
    cd('C:\Users\NCAI\Documents\DA Documentation\FINAL CUES-20221104T074646Z-001\FINAL CUES\Pics');
    
    figure('WindowState','maximized');
    ha = axes('units','normalized','outerposition',[0 0 1 1]);
    imshow('pic0 (1).png','Parent',ha); % blank
%     seqarr = randperm(5);
    for i = 1:length(seqarr)
        imshow('pic0 (1).png','Parent',ha); % blank
        drawnow 
        timestampcell(seqarr(i),1) = {clock};
        tic;
        while toc < 2
        end
        imshow('pic00 (1).png','Parent',ha); % plus sign
        drawnow 
        timestampcell(seqarr(i),2) = {clock};
        tic;
        while toc < 2
        end
        imshow(['pic' num2str(seqarr(i)) ' (1).jpg'],'Parent',ha); %,'Parent',app.UIAxes);
        drawnow 
        timestampcell(seqarr(i),3) = {clock};
        tic;
        while toc < 2    
        end
    end
    close all;
    %go = 2;
    % save timestampcell to mat file. locs+trials+steps = 5*3*6 = 90 clocks
    
    save([sprintf('%02d',subjectNum) (strcat(ses,'_TScueexp'))],'timestampcell','seqarr', 'a', 'b', 'subjectNum');
    
    if(go == 2)
    nextrun = input('\n Are you ready for the next session ? \n'); % wait until enter is pressed
    end
end

% save timestampcell to mat file. locs+trials+steps = 5*3*6 = 90 clocks
% save([sprintf('%02d',subjectNum) 'TScueexp'],'timestampcell','seqarr');
