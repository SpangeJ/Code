from math import exp
from scipy.optimize import fsolve

# Solve A, B, C in A + B*e^(Cx)
def f(vars):
    A, B, C = vars
    return [A + B*exp(C*X[0]) - Y[0],
            A + B*exp(C*X[1]) - Y[1],
            A + B*exp(C*X[2]) - Y[2]]

X = [0, 5, 9]
Y = [0, -3, 5]
A, B, C = fsolve(f, (0,1,1))
print(f"For the equation f(x) = A + B*e**(Cx), with f({X[0]}) = {Y[0]}, f({X[1]}) = {Y[1]}, and f({X[2]}) = {Y[2]}, the solution is:")
print(f"A: {A:.4f}, B:{B:.4f}, C:{C:.4f}")
check = f([A, B, C])
if abs(check[0]) > 0.1 or abs(check[1]) > 0.1 or abs(check[2]) > 0.1:
    print("The solution is not matching!")
    print(f"Control: f({X[0]})={check[0]+Y[0]:.2f}, f({X[1]})={check[1]+Y[1]:.2f}, f({X[2]})={check[2]+Y[2]:.2f}")