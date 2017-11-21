function [ linho, lao ] = toca( input, ciclos_por_bit )

    resolucao_do_seno = 0.1;

    fs = 96000;
    ts = 1/fs;
    

    angulo_tam1 = 0:resolucao_do_seno:(2*pi)*ciclos_por_bit;
    seno_grave = sin(angulo_tam1);
    

    angulo_tam2 = 0:resolucao_do_seno*2:(2*pi)*2*ciclos_por_bit;
    seno_agudo = sin(angulo_tam2);
    
    t_bit = length(seno_agudo)*ts;%seno_agudo ou seno_grave possuem o msm length().

    soundsc(seno_agudo, fs);
    pause(t_bit);
    
    for i=1:length(input)
        
        if input(i) == 0
            soundsc(seno_grave, fs);
            pause(t_bit);
        else
            soundsc(seno_agudo, fs);
            pause(t_bit);
        end
        
    end
    
    
    
    
    
end
    