function [ ] =FourierSeriesCala(N,T)
%N=5;
n=1:N;
%T=2;
w=2*pi/T;
syms x
f1=x;
f2=(-x/2)+3;
a0=(2/T)*(int(f1,x,0,2)+int(f2,x,2,6));
an=(2/T)*(int(f1.*cos(n*w*x),x,0,2)+int(f2.*cos(n*w*x),2,6));
bn=(2/T)*(int(f1.*sin(n*w*x),x,0,2)+int(f2.*sin(n*w*x),2,6));
v2=[a0,an,bn];
v1=[1/2,cos(n*w*x),sin(n*w*x)];
FS=sum(v1.*v2);
fprintf(' requried fourier series of the given fuction is \n')
disp(vpa(FS,3));
x=linspace(0,6,500);
y=eval(FS);
ry=repmat(y,1,8);
rx=linspace(-24,24,length(ry));
plot(rx,ry,'b');
grid on  
hold on  
f=@(x)(x).*(0<=x & x<=2)+((-x/2)+3).*(2<=x & x<=6);
x1=linspace(-24,24,50);
y1=f(x1);
ry1=repmat(y1,1,8);
rx1=linspace(-24,24,length(ry1));
plot(rx1,ry1,'r')
end

