function [ ] =heateqtn(x0,xn,t0,tn,h,k,c,f)
%HEATEQN Solves the heat equation numerically using finite difference
%Author: SHUBHAM AGARWAL(17ETCS002175)
%f = @(x) 4*x - (0.5.*x.^2);
x=x0:h:xn;
t=t0:k:tn;
m=length(x);n = length(t);
u=zeros(m,n);
a=k*c/h^2;
u(:,1)=f(x);
if (a>0.5)
    fprintf('\nMethod fails\n');
    return
else
    for j=1:n-1
        for i=2:m-1
          u(i,j+1)=(a*u(i-1,j))+((1-2*a)*u(i,j))+(a*u(i+1,j));
        end
    end
end
disp(u);
%plotting
%[T,X]=meshgrid(x,t);
surf(t,x,u);
xlabel('x-axis'); ylabel('Y-axis');zlabel('Z-axis');
title('Heat equation');
end

