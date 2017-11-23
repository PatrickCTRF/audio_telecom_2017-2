function [ sinal_filtrado ] = filtro_casado_matched_filter( recebido, forma_de_onda_base )
    
    x = forma_de_onda_base;
    b = x(end:-1:1);
    sinal_filtrado = filter(b,1,recebido);
    
end

