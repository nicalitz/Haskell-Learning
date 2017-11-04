doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmall x = if x > 100
                then x
                else x*2
boomBangs xs = [ if x > 10 then "BANG!" else "BOOM!" | x <- xs, odd x]
length' xs = sum [ 1 | _ <- xs ]

removeNonUppercase :: String -> String  -- could also use :: [Char] -> [Char]
removeNonUppercase xs = [ c | c <- xs, c `elem` ['A'..'Z'] ]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z
