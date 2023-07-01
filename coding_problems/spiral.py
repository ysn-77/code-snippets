import numpy as np
from math import sqrt

def spiral(N):
  assert N%2 == 1
  A = np.zeros(shape=(N,N), dtype=int)
  x = (N//2)*(1j+1)
  a = 1
  d = -1j
  for n in range(1, N**2+1):
      A[int(x.imag), int(x.real)] = n
      if n == a:
        a += round(sqrt(a))
        d *= 1j
      x += d
  return A

[print(spiral(2*k+1)) for k in range(4)]
