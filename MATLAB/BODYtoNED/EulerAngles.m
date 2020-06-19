function [x,fval]=EulerAngles(X,Z)
    % This functions solves a se of nonlinear equations F(x)=0
    % In order to find the last euler angle (twist) we need informations
    % from two independent measurements.
    % Expected input 
    % I)X=[x1;x2;x3] |x1| >> |x2|&|x3|, typically an acc sensor
    % with x-axsis pointing up or down (with a skewness)
    % II) Z = [z1;z2;z3] |z3|>>|z1|&|z2|
    % To seek futher help see: http://se.mathworks.com/help/optim/ug/fsolve.html
    format long
    Init=[0,0,0]; % Initial angle guess
    options = optimoptions('fsolve','Display','off');
    options.MaxFunEvals = 10000;    % Increase tolerance of Func-count
    options.MaxIter = 1000;         % Increase tolerance of maximum iterations
    Amp = [X,Z]
    f = @(y) myfun(y,Amp); % function of dummy variable y
    [x,fval] = fsolve(f,Init,options)
end
%%
function F = myfun(x,Amp)
    phi = x(1);
    theta = x(2);
    psi = x(3);

    F = [Amp(1)*cos(psi)*cos(theta) + Amp(2)*(-sin(psi)*cos(phi)+cos(psi)*sin(theta)*sin(phi)) + Amp(3)*(sin(psi)*sin(phi)+cos(psi)*cos(phi)*sin(theta))-norm(Amp(1:3));
          Amp(1)*sin(psi)*cos(theta) + Amp(2)*(cos(psi)*cos(phi)+sin(phi)*sin(theta)*sin(psi)) + Amp(3)*(-cos(psi)*sin(phi)+sin(theta)*sin(psi)*cos(phi));
          -Amp(4)*sin(theta)+Amp(5)*(cos(theta)*sin(phi))+Amp(6)*(cos(theta)*cos(phi))-norm(Amp(4:6))];
end


