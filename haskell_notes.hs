functions:
succ
min
max
div  ->  [div 10 2] or [10 `div` 2] for output 5


data = 1:[2,3,4]++[5,6] -> [1,2,3,4,5,6]
data !! 3 -> 3
"hello" ++ " " ++ "world" -> "hello world"
1:2:3:[] -> [1,2,3] (iteratively prepend to empty list)
[1,2,3] ++ [4] -> [1,2,3,4]

head [1,2,3] -> 1
tail [1,2,3] -> [2,3]
last [1,2,3] -> 3
init [1,2,3] -> [1,2]
length [1,2,3] -> 3
null [1,2,3] - > False (check if list is empty)
reverse [1,2,3] -> [3,2,1]
take 2 [1,2,3] -> [1,2] (take number of elements from start of list)
drop 1 [1,2,3] -> [2,3] (drop number of elements from start of list)
drop 100 [1,2,3] -> []
maximum [1,2,3] -> 3
minimum [1,2,3] -> 1
sum [1,2,3] -> 6
product [1,2,3] -> 6
elem 3 [1,2,3] -> True (3 is an element of [1,2,3])
3 `elem` [1,2,3] -> True

[1..5] -> [1,2,3,4,5]
['a'..'d'] -> ['a','b','c','d']
[2,4..10] -> [2,4,6,8,10]
take 5 [2,4..] -> [2,4,6,8,10] (first 5 multiples of 2)

take 5 (cycle [1,2,3]) -> [1,2,3,1,2]
take 3 (repeat 5) -> [5,5,5]

replicate 3 10 -> [10,10,10]

[x*2 | x <- [1..5]] -> [2,4,6,8,10]
[x*2 | x <- [1..10], x*2 >= 12] -> [12,14,16,18,20] (return doubled elements that are greater than 12)
[x | x <- [50..100], x `mod` 7 == 3] (numbers between 50 and 100 whose remainder when divided by 7 is 3)

All numbers between 10 and 20 that does not equal 13, 15 or 19: (all predicates must evaluate to True)
[x | x <- [10..20], x /= 13, x /= 15, x /= 19] -> [10,11,12,14,16,17,18,20]

[x*y | x <- [2,3], y <- [4,5]] -> [8,10,12,15] (all combinations)
[x*y | x <- [2,5,10], y <- [8,10,12], x*y > 50]

Own version of length function:
length' xs = [ 1 | _ <- xs ]

removeNonUpperCase st = [ c | c <- st, c `elem` ['A'..'Z']]

xss = [[1,2,3,4],[1,2,2],[1,2,3,4,4,5]]
[ [ x | x <- xs, even x ] | xs <- xss ] -> [[2,4],[2,2],[2,4,4]]

tuples: 
- (x,y) and (x,y,z) are different types
- [[1,2],[1,2,3],[1,2]] possible; [(1,2),(1,2,3),(1,2)] not possible (list can only contain a single type)
- tuples can contain different types (as well as lists): ("this", 6, [1,2,3])

fst (8,11) -> 8 (first)
snd (5,16) -> 16 (second)

zip [1,2,3] ["one","two","three"] -> [(1,"one"),(2,"two"),(3,"three")]
zip [1..] ["a","b","c"] -> [(1,"a"),(2,"b"),(3,"c")]

triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]
rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24 ]

Note:
[ (a,b) | a <- [1,2], b <- [1..a] ] -> [(1,1),(2,1),(2,2)]

:t -> type
read: :: -> has type of

[Char] == String

-- Function type decleration:  
functionName :: Type -> Type

-- types:
Int  -- [range -2147483648 to 2147483647]
Integer -- much larger range
Float
Double
Bool
Char
Ordering  -- type that can be GT (greater than), LT (less than), EQ (equal)

-- type variables
:t head  ->  head :: [a] -> a  -- for a list of any type to a single value of that type

==, +, -, *, /  --> All functions (surround in parentheses to pass to another function)
:t (==)

=>  --> Everthing before the => symbol is a class constraint

-- Typeclasses: Sort of interface that defines some behaviour (not the same as classes in OOP)
-- Basic Typeclasses:
Eq --> Equality testing
Ord --> Ordering type testing
Show --> Types that can be presented as strings (try function 'show')
Read --> Opposite of show
Enum --> Sequentially ordered types that can be enumerated
Bounded --> Must have upper and lower bound (e.g. minBound :: Int -> -2147483648)
Num --> Numeric
Integral --> Includes Int and Integer
Floating --> Double, Float

-- Explicit type annotation via ::
read "5" - 2  ->  3
read "5"  ->  Error
:t read  ->  read :: (Read a) => String -> a
read "5" :: Int  ->  5

-- usefull function (convert Integral type to more generally applicable Num type)
fromIntegral :: (Num b, Integral a) => a -> b

-- pattern matching:
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, bad luck!"

-- factorial example
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- pattern matching with tuples:
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) -> (x1 + x2, y1 + y2)

-- pattern match inside list comprehension
let xs = [(1, 2), (3, 3), (4, 5)]
[ a + b | (a, b) <- xs ]  ->  [3, 6, 9]

x:xs  --> bind the head of list to x and and the rest to xs

-- define head function
head' :: [a] -> a
head' [] = error "Empty list has no head"
head' (x:_) = x  --> To bind several variables, surround in parentheses

-- as patterns
xs@(x,y,xs)

-- let bindings
let <bindings> in <expression>

-- Difference between 'where' and 'let..in':
-- let bindings are expressions themselves, where bindings are just syntactic constructs

-- if statements are also expressions:
[if 5 > 3 then "Five" else "Three", if 'a' > 'b' then "A" else "B"]  ->  ["Five", "A"]
4 * (if 10 > 5 then 10 else 0) + 2  ->  42
4 * (let a = 9 in a + 1) + 2  ->  42
[let square x = x * x in (square 5, square 3, square 2)] -> [(25,9,4)]
(let a = 100; b = 200; c = 300 in a*b*c, let foo = "hey"; bar = " there" in foo ++ bar)  ->  (6000000, "hey there")
(let (a,b,c) = (1,2,3) in a+b+c) * 100  ->  600

-- let example:
let calc x y z = x * y + z in calc 2 3 4  ->  10

-- case expression:
case expression of 	pattern -> result
					pattern -> result
					pattern -> result
					...   --> runtime error occurs if no suitable match is found

