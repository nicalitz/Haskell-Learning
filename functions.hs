tell :: (Show a) => [a] -> String
tell [] = "The list has zero elements"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "The list has many elements"

-- Length of list using recursion
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

-- Sum of elements in list
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- First letter
capital :: String -> String
capital "" = "Empty string"
capital all@(x:_) = "First letter of " ++ all ++ " is " ++ [x]

-- Guards illustrated below (sort of like a powerfull if statement with pattern matching)
-- BMI calc
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight"
    | bmi <= normal = "You're normal"
    | bmi <= fat = "You're overweight"
    | otherwise = "You're severly obese" -- otherwise = True (catch-all)
    where   bmi = weight / height ^ 2
            (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- max function
max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

-- compare function
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

-- initials
initials :: String -> String -> String
initials firstname lastname = [f] ++ "." ++ [l] ++ "."
    where   (f:_) = firstname
            (l:_) = lastname

initials' :: String -> String -> String
initials' (first:_) (last:_) = [first] ++ "." ++ [last] ++ "."

-- BMI list from weight height
calcBMI :: (RealFloat a) => [(a, a)] -> [a]
calcBMI xs = [ bmi w h | (w, h) <- xs ]
    where bmi weight height = weight / height ^2

-- names defined in by 'let' visible to output function (part before |) as well as
-- all predicates and sections that come after the binding
calcBMI' :: (RealFloat a) => [(a, a)] -> [a]
calcBMI' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
-- calcBMI' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0] -- BMI of fat people only

-- cylinder's surface area
cylinder :: (RealFloat a) => a -> a -> a
cylinder radius height =
    let     sideArea = 2 * pi * radius * height
            topArea = pi * radius ^ 2
    in      sideArea + 2 * topArea

cylinder' :: (RealFloat a) => a -> a -> a
cylinder' radius height = sideArea + 2 * topArea
    where   sideArea = 2 * pi * radius * height
            topArea = pi * radius ^ 2

-- head function using pattern matching
head' :: [a] -> a
head' [] = error "Empty list has no head"
head' (x:_) = x

-- head function using case expression
head'' :: [a] -> a
head'' xs = case xs of  [] -> error "Empty list has no head"
                        (x:_) -> x

-- case expression can be used almost anywhere
describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of  [] -> "empty."
                                                [x] -> "a singleton list."
                                                xs -> "a longer list."

-- could also be defined as
describeList' :: [a] -> String
describeList' xs = "This list is " ++ what xs
    where   what [] = "empty."
            what [x] = "a singleton list."
            what xs = "a longer list."

-- fibonacci
fibonacci' :: (Integral a) => a -> a
fibonacci' 0 = 0
fibonacci' 1 = 1
fibonacci' n = fibonacci' (n-1) + fibonacci' (n-2)

-- maximum
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of an empty list"
maximum' [x] = x
-- maximum' (x:xs)
--     | x > maxTail = x
--     | otherwise = maxTail
--     where maxTail = maximum' xs
maximum' (x:xs) = max x (maximum' xs)

minimum' :: (Ord a) => [a] -> a
minimum' [] = error "Minimum of empty list"
minimum' [x] = x
minimum' (x:xs) = min x (minimum' xs)

-- replicate with recursion
replicate' :: (Ord i, Integral i) => i -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x:replicate' (n-1) x

-- take with recursion
take' :: (Ord i, Integral i) => i -> [a] -> [a]
take' n _
    | n <= 0    = []
take' _ []      = []
take' n (x:xs)  = x : take' (n-1) xs

-- reverse with recursion
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]

-- repeat with recursion
repeat' :: a -> [a]
repeat' x = x:repeat' x
-- with continue infinitely. with lazy eval can call take 3 (repeat' 5) -> [5,5,5]

-- zip with recursion
zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
-- zip' (x:xs) (y:ys) = [(x, y)] ++ (zip' xs ys)
zip' (x:xs) (y:ys) = (x,y):(zip' xs ys)

-- elem with recursion
elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs)
    | a == x    = True
    | otherwise = elem' a xs

-- quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [ a | a <- xs, a <= x ]
        biggerSorted = quicksort [ a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted  