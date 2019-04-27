function [  ] = lag_interpolation( X,Y)
n=length(X); sum= 0; syms x;
for i=1:n
    prod=1;
    for j=1:n
        if i~=j
             prod= prod*((x-X(j))/(X(i)-X(j)));
        end
    end
        sum=sum+prod*Y(i);
end
fprintf(' LAGRANGE INTERPOLATING POLYNOMINAL IS ');
sum = simplify(sum);
disp(sum)
x=X(1):0.01:X(n);
Z = eval(sum);
plot(X,Y,'*',x,Z,'r');
grid on
title('LAGRANGE INTERPOLATING POLYNOMINAL IS');
end

