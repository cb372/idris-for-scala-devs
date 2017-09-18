lists : Int -> List Int -> Stream (List Int)
lists n xs = xs :: (lists (n+1) (xs ++ [n]))

codata Tree : Type -> Type where
  Node : (e : a) -> Tree a -> Tree a -> Tree a

tree : Int -> Tree Int
tree n = Node n (tree (n+1)) (tree (n+1))

