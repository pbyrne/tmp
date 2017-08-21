-- doubleMe x = x + x

-- doubleUs x y = doubleMe x + doubleMe y

-- doubleSmallNumber x = if x > 100
-- then x
-- else x * 2

-- length' xs = sum [1 | _ <- xs]

-- length'' :: (Num b) => [a] -> b
-- length'' [] = 0
-- length'' (_:xs) = 1 + length'' xs

-- removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

-- triangles' xs ys zs = [ (a,b,c) | c <- zs, b <- ys, a <- xs ]

-- addThree :: Int -> Int -> Int -> Int
-- addThree x y z = x + y + z

-- -- factorial :: Integer -> Integer
-- -- factorial n = product [1..n]

-- factorial :: (Integral a) => a -> a
--   factorial 0 = 1
-- factorial n = n * factorial (n - 1)

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

fib :: (Integral a) => a -> a
fib n
  | n < 0 = error "Can't fib a negative number"
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fib(n-1) + fib(n-2)

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
