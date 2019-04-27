function [ p] = newton_forw_intr( T, Y, a )
%AUTHOR: SHUBHAM AGARWAL (175)
%APPROACH: NETWON FORWARD DIFFERENCE INTERPOLATION
n=length(T);D= zeros (n,n); D(:,1)= Y;
for j= 2:n
    for i= j:n
        D(i,j) = D(i,j-1)-D(i-1,j-1);
    end
end
fprintf('forward difference table is: \n');
disp(D);
delta=diag(D);
syms t p pr s;
h=T(2)-T(1);
s= (t-T(1))/h;
p = delta(1);
pr=1;
for i=2:n
    pr=pr*(s-i+2)/(i-1);
    p=p+pr*delta(i);
end
fprintf('The interpolating polynomial as a function of time is:\n');
disp(expand(p))
t=a;
fprintf('Distance travelled by horse at T=%d is:%f\n',a,eval(p));
end

