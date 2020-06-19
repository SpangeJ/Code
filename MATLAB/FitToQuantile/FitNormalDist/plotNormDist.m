close all
x = 350:.1:899;
PDF = zeros(length(x),a);
for i = 1:a
    PDF(:,i)=1000/(sqrt(2*pi*SIGMA(i)^2))*exp(-(x-A(i,3)).^2/(2*SIGMA(i)^2));
end
%% 11 år med lønn
figure(1)
plot(x,PDF)
legend('0','1','2','3','4','5','6','7','8','9','10')
title('Lønnsfordeling etter eksamensår pr. år')
ylabel('%')
xlabel('Lønn [k]')
grid on
grid minor

%% PDF
for kk = 4:6
    figure(kk)
    hold on
    plot(x,PDF(:,kk))
    plot([round(A(kk,2)),round(A(kk,2))],[0,10],'r')
    plot([round(A(kk,3)),round(A(kk,3))],[0,10],'r')
    plot([round(A(kk,4)),round(A(kk,4))],[0,10],'r')
    legend(num2str(kk),char(188),char(189),char(190))
    title(sprintf('Lønnsfordeling %i. år etter eksamen',kk-1))
    ylabel('%')
    xlabel('Lønn [k]')
    grid on
    grid minor
    axis([350,800,0,7.2])
    xticks([400,round(A(kk,2)),round(A(kk,3)),round(A(kk,4)),700+10*kk])
end
%% Ønsket lønn i PDF
kk=4;
Salary = 600;
figure(7)
hold on
plot(x,PDF(:,kk))
plot([A(kk,2),A(kk,2)],[0,10],'r')
plot([Salary,Salary],[0,10],'k')
plot([round(A(kk,3)),round(A(kk,3))],[0,10],'r')
plot([round(A(kk,4)),round(A(kk,4))],[0,10],'r')
legend(num2str(kk-1),char(188),'Joa-33%',char(189),char(190))
title(sprintf('Lønnsfordeling %i. år etter eksamen',kk-1))
ylabel('%')
xlabel('Lønn [k]')
grid on
grid minor
axis([350,800,0,7.2])
xticks([400,round(A(kk,2)),Salary,round(A(kk,3)),round(A(kk,4)),700+10*kk])

%% CDF
X   = 1:length(x);
CDF = zeros(1,length(X));
for i = X
    CDF(i) = sum(PDF(1:i,kk));
end
figure(8)
hold on
plot(x,CDF./100)
plot(x,3.6*ones(1,length(x)),'r')
plot(x,25*ones(1,length(x)),'r')
plot(x,33*ones(1,length(x)),'r')
plot(x,50*ones(1,length(x)),'r')
title(sprintf('CDF %i. år etter eksamen',kk-1))
ylabel('%')
xlabel('Lønn  [k]')
grid on
grid minor