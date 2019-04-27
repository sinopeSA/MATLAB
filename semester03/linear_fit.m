function [  ] = linear_fit(x,y)
n=length(x);Y= log(y);
A=[sum(x.^2),sum(x);sum(x),n];
B=[sum(x.*Y);sum(Y)];
Q=A\B;
a=exp(Q(2)); b=exp(Q(1));
syms t;
func=Q(2)+Q(1)*t;
funct=a*(b.^t);
f1=vpa(func)
f2=vpa(funct)
plot (x,y,'*')
hold on 
t=x(1):0.01:x(n);
plot (t,eval(func),'r')
hold on 
plot (t, eval(funct),'b')
end

