from scipy.optimize import fsolve

# Solve A, B and C in A + Bx + Cx²
def f(vars):
    A, B, C = vars
    return [A + B*VALUE[0] + C*VALUE[0]**2 - RESULTS[0],
            A + B*VALUE[1] + C*VALUE[1]**2 - RESULTS[1],
            A + B*VALUE[2] + C*VALUE[2]**2 - RESULTS[2]]

VALUE = [0, 5, 9]
RESULTS = [0, -1905154, -7244856]
A, B, C = fsolve(f, (1,0,0))
print(f"For the equation f(x) = A + Bx + CX², with f({VALUE[0]}) = {RESULTS[0]}, f({VALUE[1]}) = {RESULTS[1]}, f({VALUE[2]}) = {RESULTS[2]} the solution is:")
print(f"A: {A:.4f}, B:{B:.8f}, C:{C:.8f}")