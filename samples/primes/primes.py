import math

for possiblePrime in range(2, 100):
    isPrime = True
    for num in range(2, int(math.sqrt(possiblePrime))):
        if possiblePrime % num == 0:
            isPrime = False
      
    if isPrime:
        print(possiblePrime)
