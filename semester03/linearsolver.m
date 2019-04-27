function [  ] = linearsolver( A,B)
if rank(A)==rank([A B])
    fprintf('The given system is consistent\n');
    fprintf('rank of A is=%d\nrank of augument matrix [A B] is=%d\nNumber of unknowns is=%d\n',rank(A),rank([A B]),length(A));
    if (rank(A)==length(A) && rank(A)==rank([A B]))
        fprintf('Given system has unique solution \nSolution to the system is\n');
        disp(inv(A)*B)
    else
        fprintf('System has many solutions\nreduced row echlon form for this system is:\n');
        disp(rref([A B]))
    end
else
    fprintf('System is inconsistent and has no solution\n');
end
end

