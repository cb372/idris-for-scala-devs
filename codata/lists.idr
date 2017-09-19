lists : Int -> List Int -> Stream (List Int)
lists n xs = xs :: (lists (n+1) (xs ++ [n]))


