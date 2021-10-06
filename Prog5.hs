{- ##################################
 Zachary Perales
 Homework 5
 15 April 2020
 ################################## -}
module Prog5 where

-- This is the type for TimeeStamp
type TimeStamp = (Int, Int, Int)

-- This is the data for Set. 
data Set = Set [Int]
    | EmptySet
  deriving Show

-- This helper function takes in the TimeStamp, and converts everything to seconds to be returned.
convertTimeStamp :: TimeStamp -> Integer
convertTimeStamp (first, second, third) = toInteger third + toInteger (second * 60) + toInteger (first * 60 * 60) 

-- This function combines two "Sets" and returns the joined "Sets".
combineSet :: Set -> Set -> Set
combineSet (Set (y:ys)) (Set (x:xs)) = Set (y:x:xs)

-- This function reverses a list.
reverse' :: [a] -> [a]
reverse' x = case x of
    [] -> []
    [x] -> [x]
    (x:xs) -> reverse' xs ++ [x]

-- This function returns True if a string can be read backwards and forwards the same way.
isPalindrome :: String -> Bool
isPalindrome x = if (reverse' x == x) then True else False

-- This function takes in two timestamps and returns 1 if the second is longer, 0 if they're equal, and -1 if the first is longer.
isLonger :: TimeStamp -> TimeStamp -> Int
isLonger x y = if ((convertTimeStamp x) > (convertTimeStamp y) && isValid x) then -1 else if ((convertTimeStamp x) < (convertTimeStamp y) && isValid x) then 1 else 0  

-- This converts the TimeStamp to seconds and returns the seconds.
totalSeconds :: TimeStamp -> Int
totalSeconds x = fromInteger (convertTimeStamp x)

-- This function validates a timestamp: for example, minutes are less than 60, seconds are less than 60, all fields are non-negative.
isValid :: TimeStamp -> Bool
isValid (first, second, third) = if (third < 60 && third > (-1) && second < 60 && second > (-1) && first < 100 && first > (-1)) then True else False

-- This function takes the Triple TimeStamp and returns it as a string in hh:mm:ss format.
time2Str :: TimeStamp -> String
time2Str (first, second, third) = (if (first > 9) then show first else "0" ++ show first) ++ ":" ++ 
  (if (second > 9) then show second else "0" ++ show second) ++ ":" ++ 
  (if (third > 9) then show third else "0" ++ show third)

-- This function takes an Int to search for, and a list of Ints, and returns a "safe" Maybe [Int].
safeFindBefore :: Int -> [Int] -> Maybe [Int]
safeFindBefore _ [] = Nothing
safeFindBefore y x = case (y, x) of 
  (y, []) -> Nothing
  (y, x) -> if (head (reverse x) == y) then Just (init x) else safeFindBefore y (init x)

-- This function searches a Set for an Int to see if it is present in the set already. It re
member :: Int -> Set -> Bool
member _ EmptySet = False
member _ (Set []) = False
member i (Set (x:xs)) = if (x == i) then True else member i (Set xs)

-- This function returns the size or length of the set.
size :: Set -> Int
size EmptySet = 0
size (Set x) = length (x)

-- This function inserts an item into the set. If this would cause a duplicate, nothing is added, and the Set is returned unmodified.
ins :: Int -> Set -> Set
ins i EmptySet = (Set [i])
ins i (Set []) = (Set [i])
ins i (Set (x:xs)) = if ((member i (Set (x:xs)) == True)) then Set (x:xs) else combineSet (Set [i]) (Set (x:xs))