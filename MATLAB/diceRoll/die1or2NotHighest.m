clear all
clc
%% d1 shall not be the highest die!
droll   = 1e10;
d3c     = 0;
d4c     = 0;
d5c     = 0;
d6c     = 0;
for i = 1:droll
    d1  = randi([1,6]);
    d2  = randi([1,6]);
    d3  = randi([1,6]);
    d4  = randi([1,6]);
    d5  = randi([1,6]);
    d6  = randi([1,6]);
    if (d1 > d3 || d2 > d3)
        d3c = d3c+1;
    end
    if ((d1 > d3 && d1 > d4) || (d2 > d3 && d2 > d4))
        d4c = d4c+1;
    end
    if ((d1 > d3 && d1 > d4 && d1 > d5) || (d2 > d3 && d2 > d4 && d2 > d5))
        d5c = d5c+1;
    end
    if ((d1 > d3 && d1 > d4 && d1 > d5 && d1 > d6) || (d2 > d3 && d2 > d4 && d2 > d5 && d2 > d6))
        d6c = d6c+1;
    end
end
%%
fprintf('Die 1 or Die 2 shall not be the highest this will pollute\n')
fprintf('Rolling 3 dies: %.2f%%\n',100*d3c/droll)
fprintf('Rolling 4 dies: %.2f%%\n',100*d4c/droll)
fprintf('Rolling 5 dies: %.2f%%\n',100*d5c/droll)
fprintf('Rolling 6 dies: %.2f%%\n',100*d6c/droll)
