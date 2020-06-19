X = 1:0.1:4;
Y = 1:0.1:4;
Z = zeros(length(X),length(Y));
for i = 1:length(X)
    for j = 1:length(Y)
        Z(i,j)=log(X(i))*exp(1) + gamma(Y(j));
    end
end
%%
surf(X,Y,Z)
colorbar