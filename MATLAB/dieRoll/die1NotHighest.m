clear all
clc
%% d1 shall not be the highest die!
droll   = 1e10;
d2c     = 0;
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
    if d1 > d2
        d2c = d2c+1;
    end
    if (d1 > d2 && d1 > d3)
        d3c = d3c+1;
    end
    if (d1 > d2 && d1 > d3 && d1 > d4)
        d4c = d4c+1;
    end
    if (d1 > d2 && d1 > d3 && d1 > d4 && d1 > d5)
        d5c = d5c+1;
    end
    if (d1 > d2 && d1 > d3 && d1 > d4 && d1 > d5 && d1 > d6)
        d6c = d6c+1;
    end
end
%%
fprintf('Die 1 shall not be the highest this will pollute\n')
fprintf('Rolling 2 dies: %.2f%%\n',100*d2c/droll)
fprintf('Rolling 3 dies: %.2f%%\n',100*d3c/droll)
fprintf('Rolling 4 dies: %.2f%%\n',100*d4c/droll)
fprintf('Rolling 5 dies: %.2f%%\n',100*d5c/droll)
fprintf('Rolling 6 dies: %.2f%%\n',100*d6c/droll)
