from math import pi, ceil
import numpy as np
from scipy.optimize import fsolve
import matplotlib.pyplot as plt

# Sigmoid function: σ(x) = k0/(1+exp(-(x-INFLECTION)))
# Solve K, k0 in K + σ(x)
INFLECTION = 5
def f(vars):
    K, k0 = vars
    return [K + sigmoid(X[0], k0) - Y[0],
            K + sigmoid(X[1], k0) - Y[1]]

def sigmoid(x, k):
    return k/(1+np.exp(-2*(x-INFLECTION)))


X = [0, 9]
Y = [6, 8.42]
roots = fsolve(f, (Y[0], Y[-1]), xtol=1e-6, maxfev=100000, factor=0.0001)
print(f"For the equation f(x) = K + σ(x),\n"
      f"with f({X[0]}) = {Y[0]},\n"
      f"f({X[-1]}) = {Y[-1]},\n"
      f"the solution is:\n"
      f"K: {roots[0]:.2f},\n"
      f"k0: {roots[-1]:.2f}"
      )

check = f(roots)
if all(np.isclose(f(roots), [0,0])):
    xi = np.linspace(0, 12, 1000)
    fx = np.zeros_like(xi)
    for i, x in enumerate(xi):
        fx[i] = roots[0] + sigmoid(x, roots[1])

    fig, ax = plt.subplots()
    ax.plot(xi, fx, linewidth=2.0)
    ax.set(xlim=(0, X[-1]), xticks=np.arange(1, X[-1]),
        ylim=(min(Y)-1,  max(Y)+1), yticks=np.arange(min(Y)-1,  max(Y)+1))
    ax.grid()
    plt.show()
else:
    print("The solution is not matching!")
    print(f"Control:\n"
          f"f({X[0]})={check[0]+Y[0]:.2f},\n"
          f"f({X[-1]})={check[-1]+Y[-1]:.2f}"
          )