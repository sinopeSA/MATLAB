function [ ] = eulermethod(x0,y0,h,f)
xn=1; y(1)=y0;
x=x0:h:xn;
n=length(x);
for i=1:(n-1)
    y(i+1) = y(i) +(h*f(x(i),y(i)));
end
%plotting:
plot(x,y,'--*') %numeric plotting
%exact Plotting:
u=dslove('Dy=x+y','y(x0)=y0','x');
u=eval(u);
hold on
plot(x,u,'r')
% labels:
xlabel('inputs');ylabel('Functional Value');
legends('Approximate value','Exact Value');
title('Eulers method')
end