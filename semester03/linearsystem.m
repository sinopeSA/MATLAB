function [  ] = linearsystem(A,B)
% AUTHOR: AKSHAY HEGDE 
sizeofmatrix = size(A);
numberofunknowns = sizeofmatrix(2);
augumentedmatrix=[A B];
if rank(A)==rank(augumentedmatrix)
    fprintf('The given system is consistent');
    fprintf('The rank of A is %d\n',rank(A));
    if rank(A)==numberofunknowns
        fprintf('System has unique solution\n');
        solution = A^(-1)*B;
        for i=1:1:length(solution)
          fprintf('T%d = %f\n',i,solution(i));
        end
    else
        fprintf('The given system has infinetly many solutions');
        disp(rref(augumentedmatrix))
    end
else
    fprintf('The given system is inconstent and has no solution');
    fprintf('The rank of A = %d\n ',rank(A));
  fprintf('The rank of augumentated matrix = %d\n',rank(augumentedmatrix));
end
end

