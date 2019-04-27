function [ ] = rk4meth(x0,y0,xn,h,f,g)
%f=@(x,y) y*0.5*(1-(y/5000));
%g== Dy=y*0.5*(1-(y/5000)) rk4meth(0,50,12,1,f,)
x=x0:h:xn;
n=length(x);
y(1)=y0;
for i=1:n-1
    k1= h*f(x(i),y(i));
    k2= h*f(x(i)+h/2,y(i)+k1/2);
    k3= h*f(x(i)+h/2,y(i)+k2/2);
    k4= h*f(x(i)+h,y(i)+k3);
    y(i+1)= y(i)+ (1/6)*(k1+ 2*k2 + 2*k3 + k4);
end
fprintf('population after %d years is: %d\n',xn,floor(y(n)));
%plotting (calculated using RK4 method):
plot(x,y,'ro--')
hold on

%solving:
% replotting the given function(exact plotting) :
u=dsolve(g,'y(x0)=y0','x');
u=eval(u);
plot(x,u,'--*');
grid on
title('Runge-Kutta 4th order method');
xlabel('x(years)'); ylabel('population in millions');
legend('Approximate curve','Exact curve');
end

