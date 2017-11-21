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
pause(5);
stop(r);
% p = play(r); 
myRecording = getaudiodata(r);


disp('meio.');
[resultado, indice] = cpu_produto_escalar_max(myRecording, seno_agudo, 1);

decodificado = [1];
length_myRecording = length(myRecording);
length_seno_agudo = length(seno_agudo);%sen_agudo ou seno_grve tanto faz, pois tem o msm length().
i = indice + length_seno_agudo;


while i<length_myRecording-length_seno_agudo

%     [resultado3, indice3] = cpu_produto_escalar_max(myRecording(i:length_myRecording), senasso, 0);

    [resultado1, indice1] = cpu_produto_escalar_max(myRecording(i:length_myRecording), seno_agudo, 0);

    [resultado0, indice0] = cpu_produto_escalar_max(myRecording(i:length_myRecording), seno_grave, 0);

    if resultado1 > resultado0

        decodificado = horzcat(decodificado, 1);

    else

        decodificado = horzcat(decodificado, 0);

    end

    i = i + length_seno_agudo;

end

