clc
clear all
%% Data Input
% A=[yearAfterMSc, Mean, Q25, Median(Q50), Q75, Q90]
A=[
0 544545 520000 540009 560000 589000
1 574198 535550 565000 594138 650000
2 608472 560000 595000 636000 700000
3 648554 582000 624000 685000 768412
4 672466 600000 650000 714000 810000
5 694858 625490 674526 740000 829000
6 718691 642321 690000 765000 874510
7 743341 660000 714000 790000 900000
8 770241 677562 735010 822000 945000
9 799487 700000 756000 870000 995900
10 822891 720000 785169 888800 1007000];
%% Declaration
Quartile    = 1;
A           = A/1000;
[a,~]       = size(A);
SIGMA       = zeros(1,a);
alpha       = zeros(1,a);
scale       = zeros(1,a);
location    = zeros(1,a);
F75         = .75;
F25         = .25;
Aim         = [.25,0;.75,0];
Ftrue       = Aim(Quartile,1);
%% Iterate Skewed Normal Distribution
for j = 1:a
    mu75        = A(j,5);
    mu          = A(j,2);
    mu50        = A(j,4); %Median, not mean
    mu25        = A(j,3);
    skewG       = (mu25+mu75-2*mu50)/(mu75-mu25);
    Aim(1,2)    = mu25;
    Aim(2,2)    = mu75;
    xq          = Aim(Quartile,2);
    SDguess     = 50;
    estError    = -1;
    i = 0;
    while abs(estError) > 0.00001
        if estError > 0
            SDguess = SDguess*0.99;
        elseif estError < 0
            SDguess = SDguess*1.1;
        end
        [Fguess, shape, w, e] = CDF(xq,mu,SDguess,skewG);
        estError = sign(xq-mu)*(Ftrue-Fguess);
        i = i+1;
        if i > 1e6
            disp('Can''t find a solution')
            return
        end
    end
    fprintf(['Solution after %4.0f tries: ' char(963) ': %3.0f, ' char(956) ': %.0f, ' char(945) ': %.2f F: %.4f\n']...
        ,i,SDguess,mu,shape,Fguess)
    SIGMA(1,j)=SDguess;
    alpha(1,j)=shape;
    scale(1,j)=w;
    location(1,j)=e;
end
%% PDF Normal distribution
function fn = PDFnormal(x)
    fn      = 100/(sqrt(2*pi))*exp(-1/2*x^2);
end
%% CDF Normal Distribution
function Fn = CDFnormal(x)
    Fn      = 1/2*(1+erf((x)/(sqrt(2))));
end
%% PDF (Probability Density Function) Skewed Normal distribution
function [F,alpha]  = PDF(x,mu,sigma,skewG)
    skewG       = abs(skewG);
    delta       = sqrt(pi/2*skewG^(2/3)/(skewG^(2/3)+((4-pi)/2)^(2/3)));
    alpha       = delta/sqrt((1-delta^2));
    scale       = sqrt(sigma)/(1-2*delta^2/pi);
    location    = (mu-scale*delta*sqrt(2/pi));
    fn          = PDFnormal((x-location)/scale);
    Fn          = CDFnormal(alpha*(x-location)/scale);
    F           = 2/scale*fn*Fn;
end

%% CDF (Cumulative Density Function) Skewed Normal distribution - Formula
function [F,alpha,scale,location]  = CDF(x,mu,SD,skewG)
    skewG       = abs(skewG);
    delta       = sqrt(pi/2*skewG^(2/3)/(skewG^(2/3)+((4-pi)/2)^(2/3)));
    alpha       = delta/sqrt((1-delta^2));
    scale       = SD/(1-2*delta^2/pi);
    location    = (mu-scale*delta*sqrt(2/pi));
    %fn         = PDFnormal(x,mu,sigma);
    Fn          = CDFnormal((x-location)/scale);
    Tow         = tfn((x-location)/scale,alpha);
    F           = Fn-2*Tow;
end