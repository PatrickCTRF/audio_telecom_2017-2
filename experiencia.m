    

    disp('come�ou.');
    r = audiorecorder(fs, 24, 1);
    record(r);
    
% for i=1:4
    
    pause(3);
    
    % p = play(r); 
    myRecording = getaudiodata(r);
    
    plot(myRecording);
    
% end  

stop(r);