function [ output, media, desvpad ] = removeDiscrepante( input )
    output = input;
    media = mean(output);
    desvpad = std(output);
    
    i=1;
    while i<=length(output)
       
       if(output(i)>media+desvpad || output(i)<media-desvpad)
           output(i) = media;
       end
        i = i+1;
    end

end

