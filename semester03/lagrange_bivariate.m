function [polynomial] = lagrange_bivariate(X, Y, Z)
	n = length(Y);
	syms x y;
	j_sum = 0;
    polynomial = 0;
    
    for i=1:n
        for j=1:n
            x_prod = 1;
            y_prod = 1;
            for s=1:n
                if s~=i
                    x_prod = x_prod*((x-X(s))/(X(i)-X(s)));
                end
            end
            for s=1:n
                if s~=j
                    y_prod = y_prod*((y-Y(s))/(Y(j)-Y(s)));
                end
            end
            j_sum = j_sum + (x_prod*y_prod*Z(i,j));
        end
        polynomial = polynomial + j_sum;
        j_sum = 0;
    end
    
	polynomial = expand(polynomial);
    fsurf(polynomial);
    legendText = strcat('$',arrayfun(@latex,polynomial,'UniformOutput',false),'$');
    legend(legendText,'interpreter', 'latex','FontSize',16, 'Location', 'best');
end
