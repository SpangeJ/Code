function circumference = ellipseCircumference(a,b)
    h = (a-b)^2/(a+b)^2;
    circumference = 0;
    for r = 0:1000
        circumference = circumference + (bionominalCoefficient(0.5,r))^2*h^r;
    end
    circumference = pi*(a+b)*circumference;
end

function b = bionominalCoefficient(n,r)
    FactorialN  = gamma(n+1);
    FactorialNR = gamma(n-r+1);
    b = FactorialN/(factorial(r)*FactorialNR);
end