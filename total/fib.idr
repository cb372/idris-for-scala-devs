-- return the nth Fibonacci number
total
fib : Nat -> Int
fib Z = 1
fib (S (S k)) = fib(S (S k)) + fib(k)
