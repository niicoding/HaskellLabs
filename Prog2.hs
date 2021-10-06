{- ##################################
 Zachary Perales
 2/18/2020
 Homework 2
 ################################## -}
module Prog2 where

-- threeDifferent "returns True if no two of the three arguments are equal, and False otherwise (Burns, R. (2020, February 6). PDF.)."
threeDifferent :: Integer -> Integer -> Integer -> Bool
threeDifferent w x y = (w /= x) && (x /= y) && (w /= y)

-- fourDifferent "returns True if no two of the four arguments are equal, and False otherwise (Burns, R. (2020, February 6). PDF.)."
fourDifferent :: Integer -> Integer -> Integer -> Integer -> Bool
fourDifferent w x y z = (threeDifferent w x y) && (w /= z) && (x /= z) && (y /= z) 

-- sum' "uses recursion to compute the sum of all numbers from 1 to n, where n is greater than or equal to 1 (Burns, R. (2020, February 6). PDF.)."
sum' :: Integer -> Integer
sum' x = if (x == 0) then 0 else x + sum' (x - 1)

-- asciisum "uses recursion to compute the sum of the ASCII values in a String (Burns, R. (2020, February 6). PDF.)."
asciisum :: String -> Integer
asciisum [] = 0
asciisum (x:xs) = toInteger(fromEnum x) + asciisum(xs)

-- integerSqrt "returns the integer square root of a positive integer n (Burns, R. (2020, February 6). PDF.)."
integerSqrt :: Integer -> Integer
integerSqrt x = floor (sqrt (fromIntegral x))

-- orderTriple "takes a triple, and returns a version in increasing order (Burns, R. (2020, February 6). PDF.)."
orderTriple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
orderTriple (x, y, z) = if ((x <= y) && (x <= z)) then (x, if (y <= z) then y else z, if (y <= z) then z else y) else 
                        if ((y <= x) && (y <= z)) then (y, if (x <= z) then x else z, if (x <= z) then z else x) else 
                            (z, if (x <= y) then x else y, if (x <= y) then y else x)

-- swap "swaps the characters in a quadruple (4-tuple) in the following way: the first element swaps with the last, and the middle two don't change (Burns, R. (2020, February 6). PDF.)."
swap :: (Char, Char, Char, Char) -> (Char, Char, Char, Char)
swap (w, x, y, z) = (z, x, y, w)

-- negateTwoDigits "takes a list of integers and returns a list of integers with all of the two-digit integers negated (Burns, R. (2020, February 6). PDF.)."
negateTwoDigits :: [Integer] -> [Integer]
negateTwoDigits x = [if ((neg < (-99) || neg > 99) || (neg > (-10) && neg < 10)) then neg else negate neg | neg <- x]

-- matches "picks out all instances of an integer n from a list (Burns, R. (2020, February 6). PDF.)."
matches :: Integer -> [Integer] -> [Integer]
matches x y = [m | m <- y, m == x]

-- element "uses the matches function in the above problem [...] that returns True if an element is a member of a list, False otherwise (Burns, R. (2020, February 6). PDF.)."
element :: Integer -> [Integer] -> Bool
element x y = if (length(matches x y) > 0) then True else False 