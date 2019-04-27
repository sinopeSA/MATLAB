function [polyn  ] = lag_bi_poly( P,Q, R )
n = length(Q);
	syms x y;
	add_sum = 0;
    polyn = 0;
    
    for i=1:n
        for j=1:n
            x_prod = 1;
            y_prod = 1;
            for k=1:n
                if k~=i
                    x_prod = x_prod*((x-P(k))/(P(i)-P(k)));
                end
            end
            for k=1:n
                if k~=j
                    y_prod = y_prod*((y-Q(k))/(Q(j)-Q(k)));
                end
            end
            add_sum = add_sum + (x_prod*y_prod*R(i,j));
        end
        polyn = polyn + add_sum;
        add_sum = 0;
    end
	pol = expand(polyn); 
end

