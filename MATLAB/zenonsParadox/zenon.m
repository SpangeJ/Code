clear all
clc
pL = 0;             %Posisjon langeviser    [grader]
vL = 360/3600;      %Hastighet Langeviser   [grader/sek]
pK = 90;            %Posisjon korteviser    [grader]
vK = 360/12/3600;   %Hastighet korteviser   [grader/sek]
tid = 0;            %Tid [sek]
%%
for i = 1:100
    t0      = (pK-pL)/vL;
    tid     = tid + t0;
    pL      = pK;
    pK      = pK + vK*t0;
end
fprintf('Langeviseren bruker %.4fs på å ta igjen korteviseren, eller %.4fmin\n',tid,tid/60)
passeringer = 24*3600/tid/2;
fprintf('Ergo vil Langeviseren stå %.0f ganger 90\x00b0 på korteviseren i løpet av 24t\n',passeringer);