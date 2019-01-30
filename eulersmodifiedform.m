function [ ] = eulersmodifiedform(h,x0,y0,f,xn)
%f =@(x,y) (x+y)
format long;
maxirr=12;
y(1)=y0;
x=x0:h:xn;
n=length(x);
for i=1:(n-1)
    y(i+1) = y(i) +(h*f(x(i),y(i)));
    yc(1)=y(i+1);
    for j=1:maxirr
        yc(j+1)= y(i)+((h/2)*((f(x(i),y(i)))+f(x(i+1),yc(j))));
        if abs(yc(j+1)-yc(j)) <= (10^(-6))
            y(i+1)=yc(j+1);
            break;
        end
    end
end
fprintf('The approximate solution is given by: y(%f) = %f\n',x(end),y(end));

% plotting:
plot(x,y,'r--')
hold on
u=dsolve('Dy=x+y','y(x0)=y0','x');
u=eval(u);
plot(x,u,'b')
% labels:
xlabel('inputs');ylabel('Functional Value');
legend('Approximate value','Exact Value');
title('Eulers modified method')
end

