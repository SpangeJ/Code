from scipy.optimize import fsolve

# Solve A, B and C in A + Bx + Cx²
def f(vars):
    A, B, C = vars
    return [A + B*X[0] + C*X[0]**2 - Y[0],
            A + B*X[1] + C*X[1]**2 - Y[1],
            A + B*X[2] + C*X[2]**2 - Y[2]]

X = [0, 5, 9]
Y = [0, -1905154, -7244856]
A, B, C = fsolve(f, (1,0,0))
print(f"For the equation f(x) = A + Bx + CX², with f({X[0]}) = {Y[0]}, f({X[1]}) = {Y[1]}, f({X[2]}) = {Y[2]} the solution is:")
print(f"A: {A:.4f}, B:{B:.8f}, C:{C:.8f}")
check = f([A, B, C])
if abs(check[0]) > 0.1 or abs(check[1]) > 0.1 or abs(check[2]) > 0.1:
    print("The solution is not matching!")
    print(f"Control: f({X[0]})={check[0]+Y[0]:.2f}, f({X[1]})={check[1]+Y[1]:.2f}, f({X[2]})={check[2]+Y[2]:.2f}")