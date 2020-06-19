function sureBet(Ods)
OdsSum = sum(Ods.^(-1));
if OdsSum < 1
    fprintf('This is a surebet! You are guaranteed to earn %.2f %%\n',100*(1-OdsSum))
    numOutcoms = length(Ods);
    for i = 1:numOutcoms
        fprintf('Bet %.2f %% on option %i\n',100/Ods(i)/OdsSum,i)
    end
else
    fprintf('You will loose money on this!\nThe bookmarkers earn %.2f %%\n',-100*(1-OdsSum))
end
end