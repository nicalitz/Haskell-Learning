import Data.List

-- multiples :: (Integral x) => x -> x -> [x]
-- multiples x y = [ n | n <- [1..(y-1)], n `mod` x == 0 ]

-- multiplesList :: (Integral x) => [x] -> x -> [x]
-- multiplesList [] _ = []
-- multiplesList (x:xs) y = 
--     let multiples x y = [ n | n <- [1..(y-1)], n `mod` x == 0 ]
--     in  nub ( multiples x y ++ multiplesList xs y )

multiplesList :: (Integral x) => [x] -> x -> [x]
multiplesList [] _ = []
multiplesList (x:xs) y = nub ( multiples x y ++ multiplesList xs y )
    where multiples x y = [ n | n <- [1..(y-1)], n `mod` x == 0 ]