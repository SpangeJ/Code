function R = RotationMatrix(phi,theta,psi)
R = [cos(psi)*cos(theta),(-sin(psi)*cos(phi)+cos(psi)*sin(theta)*sin(phi)),(sin(psi)*sin(phi)+cos(psi)*cos(phi)*sin(theta));
          sin(psi)*cos(theta), (cos(psi)*cos(phi)+sin(phi)*sin(theta)*sin(psi)), (-cos(psi)*sin(phi)+sin(theta)*sin(psi)*cos(phi));
          -sin(theta),(cos(theta)*sin(phi)),(cos(theta)*cos(phi))];
      
%%
disp('Testing: All following values should be 1')
fprintf('DET(R)     = %.6f\n',det(R))
fprintf('sum(R(:,1) = %.6f\n',sum(R(:,1)))
fprintf('sum(R(:,2) = %.6f\n',sum(R(:,2)))
fprintf('sum(R(:,3) = %.6f\n',sum(R(:,3)))
fprintf('sum(R(1,:) = %.6f\n',sum(R(1,:)))
fprintf('sum(R(2,:) = %.6f\n',sum(R(2,:)))
fprintf('sum(R(3,:) = %.6f\n',sum(R(3,:)))
end