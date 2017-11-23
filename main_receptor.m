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
% [resultado, indice] = cpu_produto_escalar_max(saida_awgn, seno_agudo, 1);
% 
% decodificado = 0;
% length_saida_awgn = length(saida_awgn);
% length_seno_agudo = length(seno_agudo);%sen_agudo ou seno_grve tanto faz, pois tem o msm length().
% i = indice + length_seno_agudo;
% 
% 
% while i<=length_saida_awgn-length_seno_agudo+200%Este "200" é só uma margem de erro para garantirmos que nao paramos de decodificar o array antes da hora certa por erros de alinhamento.
% 
%     % [resultado3, indice3] = cpu_produto_escalar_max(saida_awgn(i:length_saida_awgn), senasso, 0);
% 
%     [resultado1, indice1] = cpu_produto_escalar_max(saida_awgn(i:length_saida_awgn), seno_agudo, 0);
% 
%     [resultado0, indice0] = cpu_produto_escalar_max(saida_awgn(i:length_saida_awgn), seno_grave, 0);
% 
%     if resultado1 > resultado0
% 
%         decodificado = horzcat(decodificado, 1);
% 
%     else % aki está coberto também o caso onde os resultados são IGUAIS.
% 
%         decodificado = horzcat(decodificado, 0);s
% 
%     end
% 
%     i = i + length_seno_agudo;
% 
% end

y = filtro_casado_matched_filter(myRecording, seno_grave);