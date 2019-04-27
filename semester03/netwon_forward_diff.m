function [ D, p ] = netwon_forward_diff(X, Y)
n=length(X);D= zeros (n,n); D(:,1)= Y;
for j= 2:n
    for i= j:n
        D(i,j) = D(i,j-1)-D(i-1,j-1);
    end
end
delta=diag(D);
syms x p pr s;
h=X(2)-X(1);
s= (x-X(1))/h;
p = delta(1);
for i=2:n
    pr =1;
    for j= 1:i-1
        pr =pr*(s-j+1);
    end
    p= p + (pr*delta(i)/factorial(i-1));
end
p= simplify(p)

x=X(1):0.01:X(end);
z=eval(p);
plot(X,Y,'*',x,z,'r');
grid on
end