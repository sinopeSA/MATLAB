function [ ] = harmonic_func(x,y,T,h)
%x=[0 6 120 180 240 300];
%x=(pi/180)*x
%y=[1 1.4 1.9 1.7 1.5 1.2];
w=(2*pi)/T;
syms t
a0=2*mean(y);
HS=(a0)/2;
%h= it is a harmonic series 
for i=1:h
    a(i)=2*mean(y.*cos(i*w*x));
    b(i)=2*mean(y.*sin(i*w*x));
    HS=HS+a(i)*cos(i*w*t)+b(i)*sin(i*w*t);
end
HS=vpa(HS,5);
disp(HS)
%flot(HS [0,lenght(x)])
%hold on
plot (x,y,'*')
hold on
t=linspace(x(1),x(end),1000);
y1=eval(HS);
plot(t,y1,'--')
end

