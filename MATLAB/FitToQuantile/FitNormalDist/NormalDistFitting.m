%disp(char(188:190))
clc
clear all
A = [0 485000 510000 540000
1 505000 540000 570000
2 546000 582572 626000
3 582000 624000 685000
4 614000 660000 725750
5 647759 698077 768924
6 683375 738351 814667
];
% A=[0 507000 530000 550000 
% 1 520000 552000 581694 
% 2 546000 582572 626000 
% 3 565648 602000 650361 
% 4 585000 624380 677400 
% 5 600000 645305 708000 
% 6 618000 670000 731669 
% 7 636000 687200 761082 
% 8 650200 710000 800000 
% 9 673072 740563 834091 
% 10 696079 757440 866000];
A       = A/1000;
[a,~]   = size(A);
SIGMA   = zeros(1,a);
SkewG   = zeros(1,a);
F75     = .75;
F25     = .25;
Ftrue   = F25;
for j = 1:a
    mu75        = A(j,4);
    mu          = A(j,3);
    mu50        = mu; %Median, not mean
    mu25        = A(j,2);
    SkewG       = (mu25+mu75-2*mu50)/(mu75-mu25);
    xq          = mu25;
    sigmaguess  = 10;
    estError    = -1;
    i = 0;
    while abs(estError) > 0.001
        if estError > 0
            sigmaguess = sigmaguess*0.99;
        elseif estError < 0
            sigmaguess = sigmaguess*1.1;
        end
        Fguess = CDF(xq,mu,sigmaguess);
        estError = sign(xq-mu)*(Ftrue-Fguess);
        i = i+1;
        if i > 1e6
            disp('Can''t find a solution')
            return
        end
    end
    fprintf(['Solution after %i tries: ' char(963) ': %.1f, ' char(956) ': %.0f, F: %.4f\n']...
        ,i,sigmaguess,mu,Fguess)
    SIGMA(1,j)=sigmaguess;
end
function F = CDF(x,mu,sigma)
    F = 1/2*(1+erf((x-mu)/(sqrt(2)*sigma)));
end
