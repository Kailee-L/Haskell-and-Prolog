module Homework where

divs :: Integer -> [Integer]
divs x= [i |i <- [1..x], x `mod` i == 0] 

isPrime:: Integer -> Bool
isPrime r 
    | r == 2 = True
    | r ==1 = False
    | r < 1 = False
    |[i |i <- [2..r-1], r `mod` i == 0] == [] = True
    | otherwise = False

-- THIS IS DESCENDING


qsort :: Ord a => [a] -> [a]
qsort list =
    if null list
    then []
    else qsort [b | b<-tail list, b<=head list] ++
         [head list] ++
         qsort [b | b<-tail list, b >head list] 
 
descHelper::Ord a => [a] -> [a]
descHelper x= reverse (qsort x)

descending:: Ord a => [a] -> Bool
descending x = if x == descHelper x then True else False

 
--THIS IS THE END OF DESCENDING 

fakePrimes :: Int -> [Integer]
fakePrimes x = take x [i| i <- [121..], ((mod i 2 /=0 && mod i 3 /= 0 && mod i 5 /= 0 && mod i 7 /= 0 && mod i 9 /= 0 ) && isPrime i == False)]


counting :: Eq a => a -> [a] -> Int
counting x y = length  (filter (==x) y)

counting_tuples:: Eq a => [a] -> [(a, Int)]
counting_tuples x = x `zip` counting_tuples_helper x (length x)

counting_tuples_helper :: Eq a => [a] -> Int -> [Int]
counting_tuples_helper x y = [ counting(x!! i) x | i <- [0..y]]