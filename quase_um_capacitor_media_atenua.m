function [ output_atenuado ] = quase_um_capacitor_media_atenua( input, largura )

    if largura>length(input)
        disp('escolheu uma largura maior que o pr�prio vetor');
        return;
    end

    length_input = length(input);
    
    output_atenuado = zeros(1,length_input);
    
    i = 1;
    while(i<=length_input-largura)
        
        soma = 0;
        for j=i:i+largura
           
            soma = soma + input(j);
            
        end
        
        media = soma/largura;
        
        for j=i:i+largura
           
            output_atenuado(j) = media;
            
        end
        
        i = i+largura+1;
    end
    
    %� possivel que o array nao seja m�ltiplo exato de "largura". Ent�o aqui tiramos a m�dia tamb�m dos pontos que nao form contemplados o while acima.
    i = i - (largura-1);
    soma = 0;
    for j=i:length_input

        soma = soma + input(j);

    end

    media = soma/largura;

    for j=i:length_input

        output_atenuado(j) = media;

    end

end

