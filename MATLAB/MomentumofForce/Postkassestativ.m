%% Define constants
F               = 100;          % Force [N]
s               = 1:.25:2;    % Hekk [m]
gamma           = 0;           % Hellning hekk [Deg]
theta           = 90+gamma;     % [Deg]
alpha           = 0:0.1:90-gamma-1;
Mexcact         = zeros(length(alpha),length(s));
h               = zeros(1,length(s));
wire            = zeros(length(alpha),length(s));
%%
for j = 1:length(s)
    Mexcact(:,j)= F*s(j).*sind(alpha);
    [MMax, I]   = max(Mexcact(:,j));
end
%% Plot
plot(alpha,flip(Mexcact,2))
xlabel('Degrees')
ylabel('Momentum')
grid on
grid minor
legend(num2str(flip(s')))
T = sprintf('S:%.1fm - %.1fm ',s(1),s(end));
title(T)