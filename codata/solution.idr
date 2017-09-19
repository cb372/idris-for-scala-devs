codata Tree : Type -> Type where
  Node : (e : a) -> Tree a -> Tree a -> Tree a

tree : Int -> Tree Int
tree n = Node n (tree (n+1)) (tree (n+1))

