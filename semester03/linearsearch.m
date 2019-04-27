function [  ] = linearsearch(arr , element)
% USAGE : searchArray(arr , element)
%lengthOfArray = length(arr); 

club = [];
found = false;
for i = 1:1:length(arr)
    if (arr(i)== element)
         club = [club,i];
        found = true;
    end
end
if (found == false)
    fprintf('Element not found\n');
else
    fprintf('Element not found\n');
    for i=1:1:length(club)
        fprintf('%d',club(i));
    end
    fprintf('\b\b\n');
end
end

