function [  ] = newton_rap( y,y1,x0 )
% author: SHUBHAM AGARWAL(175)
%NEWTON RAPESON METHOD FOR CALCULATION OF RATE OF INTEREST
% x0 is the initial values guessed and further teh calculation is done 
% at x0 functional values is found and slope is calculated 
%conditionn for pitfall is checked when slope/ derivatives turns to zero
%tolerance is checked and error analysis is done
maxit=100;
err=100;
tol=10^(-6);
x(1)=x0;
for i=1:maxit
    if abs (y1(x(i)))<10^(-15)
        fprintf('pitfall has occured\n assumed initial value was wrong');
        break;
    end
    x(i+1)=x(i)-y(x(i))/y1(x(i));
    
    if abs((x(i+1)-x(i))/x(i+1))<tol
        fprintf('\nThe root has converged\n  Root found at the %d iteration\n Root=%f\n',i,x(i+1));
break;
    end
    fprintf('%d iteration\t root =%f\n',i,x(i+1));
    if i==maxit
   fprinf('Root has not converged even after performing %d iterations', maxit);
    end
end

x1=0.5:0.0001:2;
g=y(x1);
plot (x1 ,g)
grid on;
hold on;
title('Root finder using Netwon Raphson method');
plot (x(i+1),0,'*');
end

