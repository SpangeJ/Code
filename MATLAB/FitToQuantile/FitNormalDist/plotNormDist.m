close all
x = 400:.1:999;
PDF = zeros(length(x),a);
for i = 1:a
    PDF(:,i)=1000/(sqrt(2*pi*SIGMA(i)^2))*exp(-(x-A(i,3)).^2/(2*SIGMA(i)^2));
end
%% 11 �r med l�nn
figure(1)
plot(x,PDF)
legend('0','1','2','3','4','5','6')
title('L�nnsfordeling etter eksamens�r pr. �r')
ylabel('%')
xlabel('L�nn [k]')
grid on
grid minor

%% PDF
for kk = 7
    figure(kk)
    hold on
    plot(x,PDF(:,kk))
    plot([round(A(kk,2)),round(A(kk,2))],[0,10],'r')
    plot([round(A(kk,3)),round(A(kk,3))],[0,10],'r')
    plot([round(A(kk,4)),round(A(kk,4))],[0,10],'r')
    legend(num2str(kk-1),char(188),char(189),char(190))
    title(sprintf('L�nnsfordeling %i. �r etter eksamen',kk-1))
    ylabel('%')
    xlabel('L�nn [k]')
    grid on
    grid minor
    axis([550,900,0,5.9])
    xticks([500,round(A(kk,2)),round(A(kk,3)),round(A(kk,4)),800+10*kk])
end
%% �nsket l�nn i PDF
kk=7;
Salary = 650;
figure(2)
hold on
plot(x,PDF(:,kk))
plot([A(kk,2),A(kk,2)],[0,10],'r')
plot([Salary,Salary],[0,10],'k')
plot([round(A(kk,3)),round(A(kk,3))],[0,10],'r')
plot([round(A(kk,4)),round(A(kk,4))],[0,10],'r')
legend(num2str(kk-1),char(188),'~14%',char(189),char(190))
title(sprintf('L�nnsfordeling %i. �r etter eksamen',kk-1))
ylabel('%')
xlabel('L�nn [k]')
grid on
grid minor
axis([600,900,0,5.9])
xticks([650,round(A(kk,2)),round(A(kk,3)),round(A(kk,4)),800+10*kk])

%% CDF
X   = 1:length(x);
CDF = zeros(1,length(X));
for i = X
    CDF(i) = sum(PDF(1:i,kk));
end
figure(8)
hold on
plot(x,CDF./100)
plot(x,14*ones(1,length(x)),'r')
plot(x,25*ones(1,length(x)),'r')
plot(x,33*ones(1,length(x)),'r')
plot(x,50*ones(1,length(x)),'r')
title(sprintf('CDF %i. �r etter eksamen',kk-1))
ylabel('%')
xlabel('L�nn  [k]')
grid on
grid minor