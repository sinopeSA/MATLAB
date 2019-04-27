function [ ] = lag_poly(year,population, value)
%AUTHOR: SHUBHAM AGARWAL (175)
%APPROACH: LAGRANGE INTERPOLATING POLYNOMIAL
n=length(year); summation= 0; syms x;
for i=1:n
    prod=1;
    for j=1:n
        if i~=j
             prod= prod*((x-year(j))/(year(i)-year(j)));
        end
    end
        summation=summation+prod*population(i);
end
fprintf(' LAGRANGE INTERPOLATING POLYNOMINAL IS:\n ');
summation = expand(summation);
disp(summation);
x=value;
fprintf('number of polio affected children in the below given year:\n');
disp('year:'); disp(value); disp('population:'); disp(eval(summation));
x=year(1):0.1:year(n);
Z = eval(summation);
plot(year,population,'+',x,Z);
grid on
title('LAGRANGE INTERPOLATING POLYNOMINAL curve');
legend('approximate root','functional value');
xlabel('YEAR'); ylabel('population');
end