function [ binario ] = atoi_bin( string )
    base = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789/*+-_;:?!,."';
    
   [lia,locb] = ismember(string, base);
   
   binario = de2bi(locb(1), 7);
   for i=2:length(locb)
       
      binario =  horzcat(binario, de2bi(locb(i),7));
       
   end
    
end

