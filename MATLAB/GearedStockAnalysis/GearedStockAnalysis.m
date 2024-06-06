%% Choose gear value of your BULL and BEAR
N = 3;
%% Construct how the main stock develops during the day
x = 0:pi/2:9*pi;
A = 100+10*sin(x);
%% create BULL and BEAR
p = zeros(1,length(A));
p(1) = nan;
p(2:end) = diff(A)./A(1:end-1)*100;
BULL = 100*ones(1,length(A));
BEAR = BULL;
for i = 2:length(BULL)
    BULL(i) = BULL(i-1)*(1+N*p(i)/100);
    BEAR(i) = BEAR(i-1)*(1-N*p(i)/100);
end

%% PLOT
figure(1)
subplot(3,1,1)
plot(A)
title('Share price')
ylabel('$')
xlim([1,length(A)])
subplot(3,1,2)
plot(p)
title('Change in %')
ylabel('%')
xlim([1,length(A)])
subplot(3,1,3)
plot(BULL)
hold on
plot(BEAR)
title(sprintf('%.2f-Gered change',N))
legend('BULL', 'BEAR')
ylabel('%')
xlim([1,length(A)])