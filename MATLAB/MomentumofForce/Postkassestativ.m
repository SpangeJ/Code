%% Define constants
F               = 100;          % Force [N]
s               = 1:0.2:2.2;    % Hekk [m]
theta           = 24;           % Hellning hekk [Deg]
alpha           = 0:0.1:90-theta;
Mexcact         = zeros(length(alpha),length(s));
h               = zeros(1,length(s));
%%
for i = 1:length(s)
    %% Calculations Excact
    wire            = s(i)*sind(theta)./(sind(alpha)*cosd(theta)+cosd(alpha)*sind(theta));
    Mexcact(:,i)    = F*cosd(alpha+theta).*(wire.^2+s(i)^2-2*wire*s(i)).^0.5;
    [MMax, I]       = max(Mexcact(:,i));
    h(i)            = wire(I)^2+s(i)^2-2*wire(I)*s(i)*cosd(alpha(I));
    %% Calculations simplified
    Msimple         = 1/2*F*wire.*sind(2*alpha+theta);
end
%% Plot
plot(alpha,Mexcact)
xlabel('Degrees')
ylabel('Momentum')
grid on
grid minor
legend(num2str(s'))
T = sprintf('S:%.1fm - %.1fm, h:%.1fm - %.1fm ',s(1),s(end),min(h),max(h));
title(T)

%% Table of Result
T = table(s',round(h,2)',round(max(Mexcact),2)');
T.Properties.VariableNames = {'s','h','Momentum'};
disp(T)