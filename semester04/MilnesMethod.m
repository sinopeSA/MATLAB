function [x y ] = MilnesMethod(x0,xn,h,y0,f,g)
% x0 is initial condition
% xn is final condtion
% h is step length
% g=="Dy=x-y^2"
% f= @(x,y) (x-y^2);
% n is a final step for which data is given
x=x0:h:xn;
y(1)=y0; n=length(x);
 for i=1:3
    k1=h*f(x(i),y(i));
    k2= h*f(x(i)+h/2,y(i)+k1/2);
    k3= h*f(x(i)+h/2,y(i)+k2/2);
    k4= h*f(x(i)+h,y(i)+k3);
    y(i+1)= y(i)+ (1/6)*(k1+ 2*k2 + 2*k3 + k4);
 end
 for i=4:n-1
    % predictor formula:
    y(i+1)=y(i-3)+(4*h/3)*(2*f(x(i-2),y(i-2))-f(x(i-1),y(i-1))+(2*f(x(i),y(i)))); 
    
    % corrector formula:
      s(i+1,1)=y(i+1);
      for j=1:10
          s(i+1,j+1)=y(i-1)+(h/3)*(f(x(i-1),y(i-1))+4*f(x(i),y(i))+f(x(i+1),s(i+1,j)));
          if abs(s(i+1,j+1)-s(i+1,j)) < 10^-6
              y(i+1)=s(i+1,j+1);
              break
          end
      end
 end

% plotting:
plot (x,y,'*') %Actual plot
u=eval(dsolve(g,'y(0)=0','x'));
hold on
grid on
plot(x,u,'--') %computed data plotting
% extra:
legend('Actual data','computed data');xlabel('x-axis');
ylabel('y-axis');title('Milnes Method');
end


