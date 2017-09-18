import Data.Vect

data Sorted : Vect n Nat -> Type where
  -- TODO


-- Inserts the given value into the sorted list in the right place
insert : (vect : Vect n Nat) -> (x : Nat) -> {auto prf : Sorted vect} -> Vect (S n) Nat
-- TODO implement

-- Bonus points: make the function return a proof that the list is still sorted

