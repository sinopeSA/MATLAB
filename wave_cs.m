function [u] = wave_cs( t0, tn, x0, xn, h, k,c)
x=x0:h:xn
f=@(x) sin(pi*x);
g=@(x) 0;
t=t0:k:tn;
L=(k^2*c^2)/h^2;
m=length(x);
n=length(t);
u=zeros(m,n)
u(1,:)=0;
u(:,1)=f(x);
u(m,:)=0;
for i=2:m-1
    u(i,2)=(1-L)*u(i,1)+0.5*L*(u(i-1,1)+u(i+1,1));
end
for j=2:n-1
    for i=2:m-1
        u(i,j+1)=2*(1-L)*u(i,j)+L*(u(i-1,j)+u(i+1,j))-u(i,j-1);
    end
end
surf(t,x,u)
title('wave plotting');
xlabel('x-axis'); ylabel('y-label'); zlabel('z-axis');
end

