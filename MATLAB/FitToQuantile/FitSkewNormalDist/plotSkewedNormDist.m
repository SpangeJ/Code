close all
x = 450:1:999;
PDF = zeros(length(x),a);
%% PDF (Probability Density Function) Skewed Normal distribution    
for i = 1:a
    for j = 1:length(x)
        fn      = PDFnormal((x(j)-location(1,i))/scale(1,i));
        Fn      = CDFnormal(alpha(1,i)*(x(j)-location(1,i))/scale(1,i));
        PDF(j,i)= 100*2/scale(1,i)*fn*Fn;
    end
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
    plot([round(A(kk,3)),round(A(kk,3))],[0,40],'r')
    plot([round(A(kk,2)),round(A(kk,2))],[0,40],'r')
    plot([round(A(kk,5)),round(A(kk,5))],[0,40],'r')
    legend(num2str(kk),char(188),char(189),char(190))
    title(sprintf('Lønnsfordeling %i. år etter eksamen',kk-1))
    ylabel('%')
    xlabel('Lønn [k]')
    grid on
    grid minor
    axis([430,1000,0,42])
    xticks([450,round(A(kk,3)),round(A(kk,2)),round(A(kk,5)),700+25*kk])
end
%% Ønsket lønn i PDF
kk=5;
Salary = 640;
figure(7)
hold on
plot(x,PDF(:,kk))
plot([A(kk,3),A(kk,3)],[0,40],'r')
plot([Salary,Salary],[0,40],'k')
plot([round(A(kk,2)),round(A(kk,2))],[0,40],'r')
plot([round(A(kk,5)),round(A(kk,5))],[0,40],'r')
legend(num2str(kk-1),char(188),'Joa-33%',char(189),char(190))
title(sprintf('Lønnsfordeling %i. år etter eksamen',kk-1))
ylabel('%')
xlabel('Lønn [k]')
grid on
grid minor
axis([350,800,0,42])
xticks([450,round(A(kk,3)),Salary,round(A(kk,2)),round(A(kk,5)),700+25*kk])

%% CDF
X   = 1:length(x);
CDF = zeros(1,length(X));
for i = X
    CDF(i) = sum(PDF(1:i,kk));
end
figure(8)
plot(x,CDF./100,'k')
hold on
plot([A(kk,3),A(kk,3)],[0,100],'b')
%plot([Salary,Salary],[0,100],'b')
plot([round(A(kk,2)),round(A(kk,2))],[0,100],'b')
plot([round(A(kk,5)),round(A(kk,5))],[0,100],'b')
plot(x,25*ones(1,length(x)),'r')
plot(x,33*ones(1,length(x)),'r')
plot(x,50*ones(1,length(x)),'r')
title(sprintf('CDF %i. år etter eksamen',kk-1))
ylabel('%')
xlabel('Lønn  [k]')
grid on
grid minor
%% PDF Normal distribution
function fn = PDFnormal(x)
    fn      = 100/(sqrt(2*pi))*exp(-1/2*x^2);
end
%% CDF Normal Distribution
function Fn = CDFnormal(x)
    Fn      = 1/2*(1+erf((x)/(sqrt(2))));
end