function [ ] = NDDIP(x,y)
% netwon divided difference
n= length(y); D=zeros(n,n); D(:,1)=y;
for j=2:n
    for i=j:n
        D(i,j)=(D(i,j-1)-D(i-1,j-1))/(x(i)-x(i-j+1));
    end
end
delta=diag(D);
fprintf('The divided difference table is:\n');
disp(D);
fprintf('The divided difference is: \n');
disp(delta);

poly=delta(1);
prod = 1; 

syms R
syms t
for i = 2:n
    prod = prod * (R - x(i-1));
    poly = poly + prod * delta(i);
end
%{fprintf('the required polynimial is: ');
% % disp(equation);
% % fprintf('The poly displayed using vap method is: ');
% % disp(vpa(equation,8))
% % fprintf('The poly displayed using simplify command is: ');
% % disp(simplify(equation))
% % fprintf('The poly displayed using simplify and vpa command is: ');
% % disp(vpa(simplify(equation)),8)
% % equation= simplify(equation);
% % equation=vpa(equation,4);
% % disp('final ans')
% % disp(equation)
disp(simplify(poly));
%plot
R=linspace(min(x),max(x),100);
z=eval(poly);
plot(R,z,'r',x,y,'*')
end


