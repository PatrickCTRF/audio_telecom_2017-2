resolucao_do_seno = 0.1;

fs = 96000;
ts = 1/fs;

ciclos_por_bit = 25;

angulo_tam1 = 0:resolucao_do_seno:(2*pi)*ciclos_por_bit;
seno_grave = sin(angulo_tam1);


angulo_tam2 = 0:resolucao_do_seno*2:(2*pi)*2*ciclos_por_bit;
seno_agudo = sin(angulo_tam2);

t_bit = length(seno_agudo)*ts;%seno_agudo ou seno_grave possuem o msm length().

disp('começou.');
r = audiorecorder(fs, 24, 1);
record(r);
pause(10);
stop(r);
% p = play(r); 
myRecording = getaudiodata(r);


disp('meio.');


y_0 = filtro_casado_matched_filter(myRecording, seno_grave);
y_1 = filtro_casado_matched_filter(myRecording, seno_agudo);

plot(quase_um_capacitor_media_atenua(abs(y_1)-abs(y_0), 200));

filtrado = quase_um_capacitor_media_atenua(abs(y_1)-abs(y_0), 200);




indice_iniciou = find(filtrado > 10, 1 );%%Gravamos aqui onde a transmissão começou no topo do bit de início.



length_seno_agudo = length(seno_agudo);

media = mean(filtrado);

decodificado = 1;
i=indice_iniciou;
while i<=(58*7)*length_seno_agudo+300+indice_iniciou
    
    
    if filtrado(i)>media
        decodificado = horzcat(decodificado, 1);
    else
        decodificado = horzcat(decodificado, 0);
    end
    
    i=i+length_seno_agudo;
      
end