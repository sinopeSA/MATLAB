f=@(x,y) (x+y^2);
y(1)=1;
h=0.2;
xend=0.4;
x=0:h:xend;
for n=1:length(x)-1
k1=h*f(x(n),y(n));
k2= h*f(x(n)+h/2,y(n)+k1/2);
k3= h*f(x(n)+h/2,y(n)+k2/2);
k4= h*f(x(n)+h,y(n)+k3);
y(n+1)= y(n)+ (1/6)*(k1+ 2*k2 + 2*k3 + k4);
end

fprintf("n= %d\n,k1= %f\n,k2= %f\n,k3= %f\n,k4= %f\n,x= %f\n,y= %f\n",n,k1,k2,k3,k4,x,y(n+1));


    