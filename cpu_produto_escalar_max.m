
function [resultado, indice] = cpu_produto_escalar_max(v_maior, v_menor, array_eh_longo)
    
    i=1;
    array_de_resultados = zeros(1, length(v_maior));
    array_de_indices = zeros(1, length(v_maior));

    if array_eh_longo == 1
        length_maior_sobre_20 = length(v_maior)/2.5;
    else
        length_maior_sobre_20 = length(v_menor)/20;
    end
    
    
    length_v_menor = length(v_menor);
    length_v_maior = length(v_maior);
    
    while (i-1)+length_v_menor<=length(v_maior) && i<length_maior_sobre_20%%Percorremos o array maior
        
        
%        for j=1:length(v_menor)%Estamos selecionando uma parte do array maior de mesmo tamanho que o array menor.
%            
%            v_auxiliar(j) = v_maior(j+i-1);%j come�a valendo zero ('j=1' - 1), pois o �ndice do vetor maior � 'i+j'. Se
%            %ambos come�assem valendo 1, o vetor maior come�aria no �ndice 2
%            %e o resultado dos �ndices teria "i" uma unidade menor.
%        end
       
       array_de_resultados(i) = dot(v_maior(i:length_v_menor+i-1),v_menor);
       array_de_indices(i) = i;
       
       i=i+1;
       
    end

    resultado = max(array_de_resultados);
    index = find(array_de_resultados == resultado, 1 );%Este "1" � s� pra escoher o primeiro elemento dentre as soulu��es caso mais de uma retorne o valor desejado.
    indice = array_de_indices(index);
    
end

