%%harmonic series:
%provide values of x,y,h,t
%x=(pi/180)*x 

w=(2*pi)/T
syms t
a0=2*mean(y);
HS=(a0)/2;
for i=1:h
    a(i)=2*mean(y.*cos(i*w*x));
    b(i)=2*mean(y.*sin(i*w*x));
    HS=HS+(a(i)*cos(i*w*t))+(b(i)*sin(i*w*t));
end
HS=vpa(HS,6)
%plotting:
plot (x,y,'*')
hold on
t=linspace(x(1),x(end),1000);
y1=eval(HS);
plot(t,y1,'--')
legend("data points","approximate fourier series");
xlabel("x-axis"); ylabel("y-axis");
title("harmonic series");

%% real fourier series:
%pass the function: as f1,f2,g
% pass the values of T,k, upper1,upper2,lower, plottinglower,
% plottinghigher
plottingrepeat= (plottinghigher-plottinglower)/T;
syms x
w=(2*pi)/T;
n= 1:k;
a0= (2/T)*(int(f1,x,lower,upper1)+int(f2,x,upper1,upper2));
an= (2/T)*(int((f1.*cos(n*w*x)),x,lower,upper1)+int((f2.*cos(n*w*x)),x,upper1,upper2));
bn= (2/T)*(int((f1.*sin(n*w*x)),x,lower,upper1)+int((f2.*sin(n*w*x)),x,upper1,upper2));

v1=[a0 an bn];
v2=[1/2 cos(n*w*x) sin(n*w*x)];
Fourier_series= vpa((v1*v2'),6)
%plotting:
x=linspace(lower,upper2,1000);
y=eval(Fourier_series);
ry=repmat(y,1,plottingrepeat);
rx= linspace(plottinglower,plottinghigher,length(ry)); %change here for plotting range
plot(rx,ry,'r')

hold on 

x=linspace(lower,upper2,1000);
y1=g(x);
ry1=repmat(y1,1,plottingrepeat);
rx1=linspace(plottinglower,plottinghigher,length(ry1));%change here for plotting range
plot(rx1,ry1,'b')

legend('fourier series','given function','location','best')
xlabel('x');ylabel('functional value');
title('Fourier series expansion for the given wave'); 

%% vectorplotting:
% pass a ,n
x=linspace(-a,a,n);
y=linspace(-a,a,n); 
z=linspace(-a,a,n);
 
[X Y Z]=meshgrid(x,y,z);
 %f =f1i+f2j+f3k use dot star poduct
 %the following is just example:
f1=((Y.^3.*sin(X))+Z.^5);
f2= (-(3*Y.^2).*cos(X)+(7.*Z.*exp(7*Y)));
f3=((5.*X.*Z.^4) + exp(7*Y));
quiver3(X,Y,Z,f1,f2,f3)

title('vetcor plotting for the given ideal fluid');
legend('x');
xlabel('xaxis'); ylabel('yaxis');zlabel('zaxis');

%% periodic plotting:
% pass T, lower, upper, f,plottinglower,plottinghigher
x= linspace(lower,upper,1000);
y= f(x);
plottingrepeat= (plottinghigher-plottinglower)/T;

ry=repmat(y,1,plottingrepeat);
rx=linspace(plottinglower,plottinghigher,length(ry)); %change here for plotting range
plot(rx,ry)

xlabel('x'); ylabel('functional value'); 
title('Plotting of periodic function');
legend('function','location','best')

%% complex fourier series:  non piece wise func
% 47077082
%pass  f, lower, upper, t, k
w=2*pi/T;
syms x
n=-k:k;
cn= (int(f.*exp(-i*n*w*x),x,lower,upper))/T;
cfs= sum(cn.*exp(i*n*w*x));
cfs= (simplify(cfs))

%plotting:
x=linspace(lower,upper,1000);
y=eval(cfs);
ry=repmat(y,1,3);%change here bit
rx= linspace(plottinglower,plottinghigher,length(ry));
plot(rx,ry,'r')

hold on

y1=f1(x);
ry1=repmat(y1,1,3);%change here bit
rx1= linspace(plottinglower,plottinghigher,length(ry1));

plot(rx1,ry1)

legend('fourier series','given function','location','best')
xlabel('x');ylabel('functional value');
title('Fourier series expansion for the given wave'); 

%% complex fourier series for piece wise funtion 

%pass  f,f1,f2, lower, upper1,upper2, t, k, plottinghigher, plottinglower
w=2*pi/T;
syms x
plottingrepeat=(plottinghigher-plottinglower)/T;
n=-k:k;
cn= (int(f1.*exp(-i*n*w*x),x,lower,upper1)+ (int(f2.*exp(-i*n*w*x),x,upper1,upper2)))/T;
cfs= sum(cn.*exp(i*n*w*x));
cfs= (simplify(cfs))

%plotting:
x=linspace(lower,upper,1000);
y=eval(cfs);
ry=repmat(y,1,plottingrepeat);%change here bit
rx= linspace(plottinglower,plottinghigher,length(ry));
plot(rx,ry,'r')

hold on

y1=f(x);
ry1=repmat(y1,1,3);%change here bit
rx1= linspace(plottinglower,plottinghigher,length(ry1));

plot(rx1,ry1)

legend('fourier series','given function','location','best')
xlabel('x');ylabel('functional value');
title('Fourier series expansion for the given wave');

%% inbuilt function:
% heaviside function:
% all are example:

f=@(t) ((t^2)*(heaviside(t-0)-heaviside(t-pi))+(t*heaviside(t-pi)));

%% inbuit function for fourier series(non piece wise function:)
syms t w
f=@(t) sin(t);
fourier(f, t,w)
%%  inbuit function for fourier series(piece wise function:)
syms t w
f=@(t) ((t^2)*(heaviside(t-0)-heaviside(t-pi))+(t*heaviside(t-pi)));
fourier(f, t,w)
%% inbuit function for laplace series(piece wise function:)
syms t s
f=@(t) ((t^2)*(heaviside(t-0)-heaviside(t-pi))+(t*heaviside(t-pi)));
laplace(f, t,s)

%% inbuit function for laplace series(non piece wise function:)
syms t s
f=@(t) sin(t); 
laplace(f, t,s)

%%
