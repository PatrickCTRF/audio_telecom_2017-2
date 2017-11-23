% string = le_arquivo(caracteres_160);

string = 'aaaa';%APAGAR

string = 'ab3.4cd3 5_ab3.4cd3 51,13-45_';%APAGAR

binario = atoi_bin(string);

saida_pura = toca(binario, 25);

saida_awgn = awgn(saida_pura, +3);

saida_awgn_com_zeros_no_inicio = horzcat(zeros(1,1000),saida_awgn);

