
function [resultado, indice] = gpu_produto_escalar_max(v_maior_cpu, v_menor_cpu)


    v_maior = gpuArray(v_maior_cpu);
    v_menor = gpuArray(v_menor_cpu);
    

    v_auxiliar = zeros(1,length(v_menor), 'gpuArray');% alocamos um array do tamanho necessário para receber os índices devidos do atual array
    
    i=1;
    array_de_resultados = zeros(1, length(v_maior), 'gpuArray');
    array_de_indices = zeros(1, length(v_maior), 'gpuArray');

    length_maior_sobre_20 = length(v_maior)/20;
    length_v_menor = length(v_menor);
    length_v_maior = length(v_maior);
    
    while (i-1)+length_v_menor<=length(v_maior) && i<length_maior_sobre_20%%Percorremos o array maior
        
        
%        for j=1:length(v_menor)%Estamos selecionando uma parte do array maior de mesmo tamanho que o array menor.
%            
%            v_auxiliar(j) = v_maior(j+i-1);%j começa valendo zero ('j=1' - 1), pois o índice do vetor maior é 'i+j'. Se
%            %ambos começassem valendo 1, o vetor maior começaria no índice 2
%            %e o resultado dos índices teria "i" uma unidade menor.
%        end
       
       array_de_resultados(i) = dot(v_maior(i:length_v_menor+i-1),v_menor);
       array_de_indices(i) = i;
       
       i=i+1;
       
    end

    resultado = max(array_de_resultados);
    index = find(array_de_resultados == resultado, 1 );%Este "1" é só pra escoher o primeiro elemento dentre as souluções caso mais de uma retorne o valor desejado.
    indice = array_de_indices(index);
    
end

