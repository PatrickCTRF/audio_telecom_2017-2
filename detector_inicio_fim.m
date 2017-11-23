resolucao_do_seno = 0.1;

fs = 96000;
ts = 1/fs;

ciclos_por_bit = 25;

angulo_tam1 = 0:resolucao_do_seno:(2*pi)*ciclos_por_bit;
seno_grave = sin(angulo_tam1);

angulo_tam2 = 0:resolucao_do_seno*2:(2*pi)*2*ciclos_por_bit;
seno_agudo = sin(angulo_tam2);

angulo_tam3 = 0:resolucao_do_seno*3:(2*pi)*3*ciclos_por_bit;
seno_inicio = sin(angulo_tam3);

angulo_tam4 = 0:resolucao_do_seno*0.5:(2*pi)*0.5*ciclos_por_bit;
seno_fim = sin(angulo_tam4);

t_bit = length(seno_agudo)*ts;%seno_agudo ou seno_grave possuem o msm length(). Todos os senos possuem.

disp('come�ou.');
r = audiorecorder(fs, 24, 1);
record(r);
pause(3);

y_inicio = 0;
max_anterior = 5;
max_atual = -10;    

disp('procurando in�cio.');
while max_atual < 300*mean(abs(y_inicio))% A sa�da do filtro casado � uma rampa que sobe e outra que desce. Logo, a primeira condi��o s� passa a ser verdadeira dps de passarmos de seu �pice.
    
    pause(3);
    
    myRecording = getaudiodata(r);
    
    y_inicio = filtro_casado_matched_filter(myRecording, seno_inicio);
    
    max_anterior = max_atual;
    max_atual = max(y_inicio);
    
end

disp('achou in�ciou.');

indice_inicio = find(y_inicio == max_atual, 1 );%%Gravamos aqui onde a transmiss�o come�ou no topo do bit de in�cio.

y_fim = 0;
max_anterior = 5;
max_atual = -10;    

disp('procurando fim.');
while max_atual < 300*mean(abs(y_fim))% A sa�da do filtro casado � uma rampa que sobe e outra que desce. Logo, a primeira condi��o s� passa a ser verdadeira dps de passarmos de seu �pice. A segunda condi��o classifica max_atual como apenas ru�do.
    
    pause(3);
    
    myRecording = getaudiodata(r);
    
    y_fim = filtro_casado_matched_filter(myRecording, seno_inicio);
    
    max_anterior = max_atual;
    max_atual = max(y_fim);
    
end

disp('achou fim.');

indice_fim = find(y_fim == max_atual, 1 );%%Gravamos aqui onde a transmiss�o come�ou no topo do bit de in�cio.

stop(r);
% 
% y_inicio = filtro_casado_matched_filter(myRecording, seno_inicio);
% y_0 = filtro_casado_matched_filter(myRecording, seno_grave);
% y_1 = filtro_casado_matched_filter(myRecording, seno_agudo);
% y_fim = filtro_casado_matched_filter(myRecording, seno_fim);