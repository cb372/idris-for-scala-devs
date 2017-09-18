import Data.Vect

data Sorted : Vect n Nat -> Type where
  EmptyList : Sorted Nil
  SingletonList : {x : Nat} -> Sorted (x :: Nil)
  Recursive : {x : Nat} -> 
              {y : Nat} -> 
              {xs : Vect n'' Nat} -> 
              (prf : x `LTE` y) -> 
              (rec : Sorted (y :: xs)) -> 
              Sorted (x :: y :: xs)
  Tail : (xs : Vect m Nat) ->
         (prf : Sorted (x :: xs)) -> 
         Sorted xs


-- Inserts the given value into the sorted list in the right place
insert : (vect : Vect n Nat) -> (x : Nat) -> {auto prf : Sorted vect} -> Vect (S n) Nat
insert [] x = [x]
insert (y :: ys) x {prf} = case compare x y of
                          LT => x :: y :: ys
                          EQ => x :: y :: ys
                          GT => y :: (insert ys x {prf=Tail ys prf})

-- Bonus points: make the function return a proof that the list is still sorted

