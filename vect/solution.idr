import Data.Fin

data Vect : (len : Nat) -> (elem : Type) -> Type where
  Nil : Vect Z elem
  (::) : (x : elem) -> (xs : Vect k elem) -> Vect (S k) elem

head : Vect (S k) elem -> elem
head (x :: xs) = x

tail : Vect (S k) elem -> Vect k elem
tail (x :: xs) = xs

take : (n : Nat) -> Vect (n + m) elem -> Vect n elem
take Z xs = []
take (S k) (x :: xs) = x :: take k xs

drop : (n : Nat) -> Vect (n + m) elem -> Vect m elem
drop Z xs = xs
drop (S k) (x :: xs) = drop k xs

(++) : Vect n elem -> Vect m elem -> Vect (n + m) elem
(++) [] ys = ys
(++) (x :: xs) ys = x :: xs ++ ys

index : Fin k -> Vect k elem -> elem
index FZ (x :: xs) = x
index (FS k) (x :: xs) = index k xs
