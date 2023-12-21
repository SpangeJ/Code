from scipy.optimize import fsolve

# Solve A and B in A + B^x
def f(vars):
    A, B = vars
    return [A + B**POWERS[0] - RESULTS[0],
            A + B**POWERS[1] - RESULTS[1]]

POWERS = [0, 9]
RESULTS = [6, 2]
A, B = fsolve(f, (0,1))
print(f"For the equation f(x) = A + B**x, with f({POWERS[0]}) = {RESULTS[0]}, and f({POWERS[1]}) = {RESULTS[1]}, the solution is:")
print(f"A: {A:.4f}, B:{B:.4f}")
check = f([A, B])
print(f"Control: f({POWERS[0]})={check[0]+RESULTS[0]:.2f}, f({POWERS[1]})={check[1]+RESULTS[1]:.2f}")