from math import pi, ceil
import numpy as np
from scipy.optimize import fsolve
import matplotlib.pyplot as plt

# Sigmoid function: σ(x) = k0/(1+exp(-(x-INFLECTION)))
# There are many bell shaped curves, some of them are algebraic: k1/(1+(x-BOTTOM)^2)^4
# Solve k0, k1 in σ(x)-bell(x)
INFLECTION = 8
BOTTOM = 2
def f(vars):
    k0, k1 = vars
    return [sigmoid(X[0], k0) - algebraic_bell(X[0], k1) - Y[0],
            sigmoid(X[1], k0) - algebraic_bell(X[1], k1) - Y[1]]

def sigmoid(x, k):
    return k/(1+np.exp(-1.5*(x-INFLECTION)))

def algebraic_bell(x, k):
    return k/((1+(x-BOTTOM)**2))

X = [2, 10]
Y = [-3, 6]
roots = fsolve(f, (Y[-1], Y[0]), xtol=1e-6, maxfev=100000, factor=0.0001)
print(f"For the equation f(x) = σ1(x) - bell(x),\n"
      f"with f({X[0]}) = {Y[0]},\n"
      f"f({X[1]}) = {Y[1]},\n"
      f"the solution is:\n"
      f"k1: {roots[0]:.2f},\n"
      f"c4: {roots[1]:.2f}"
      )

check = f(roots)
if all(np.isclose(f(roots), [0,0])):
    xi = np.linspace(0, 12, 1000)
    fx = np.zeros_like(xi)
    for i, x in enumerate(xi):
        fx[i] = sigmoid(x, roots[0]) - algebraic_bell(x, roots[1])

    fig, ax = plt.subplots()
    ax.plot(xi, fx, linewidth=2.0)
    ax.set(xlim=(0, X[-1]+1), xticks=np.arange(1, X[-1]+1),
        ylim=(Y[0]-2,  Y[-1]+2), yticks=np.arange(Y[0]-2,  Y[-1]+2))
    ax.grid()
    plt.show()
else:
    print("The solution is not matching!")
    print(f"Control:\n"
          f"f({X[0]})={check[0]+Y[0]:.2f},\n"
          f"f({X[1]})={check[1]+Y[1]:.2f}"
          )