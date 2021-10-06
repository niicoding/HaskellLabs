{- ##################################
 Zachary Perales
 3/19/20
 Homework 4
 ################################## -}
module Prog4 where

-- This function "takes a list of ints, and returns a list of pairs, such that the first element in each pair [is the] original number, and the second element is the original number doubled" (Burns, Richard. “PDF.” 5 Mar. 2020.).
doubleAll :: [Int] -> [(Int, Int)]
doubleAll x = if (x == []) then [] else (head x, head (x) * 2):doubleAll (tail x)

-- This is an alternative to doubleAll without using head/tail.
-- doubleAll' :: [Int] -> [(Int, Int)]
-- doubleAll' (x:xs) = if ((x:xs) == []) then [] else (x, x * 2) : doubleAll (xs)

-- This function "returns the product of the last n numbers in the list, where n is the first argument to the function" (Burns, Richard. “PDF.” 5 Mar. 2020.). If 0 is entered, it returns 1, because that's what product does.
productLastPart :: Int -> [Int] -> Int
productLastPart d x = if (d == 0) then 1 else (reverse x)!!(d - 1) * productLastPart (d - 1) x

-- Ignore this function. This was a re-write of reverse to be used in productLastPart'.
-- reverse' :: [Int] -> [Int]
-- reverse' (x:xs) = if ((xs) == []) then x:[] else (reverse' xs) ++ x : []

-- Ignore this function. I was just expirementing to see if this could be done without indexing and/or using helper functions instead of LL functions.
-- productLastPart' :: Int -> [Int] -> Int
-- productLastPart' d (x:xs) = if (d == 0) then 1 else x * productLastPart' (d - 1) (reverse' (x:xs)) 

-- This function has "identical behavior to the init function" (Burns, Richard. “PDF.” 5 Mar. 2020.). It returns all of the elements of a list except the last one (Haskell Quickdocs). This version makes empty list empty list instead of throwing an error.
init' :: [Int] -> [Int]
init' x = if (length x == 1) then [] else head x:init' (tail x)

-- This function "lowercases the first, third, fifth letter (and so on) of a string" (Burns, Richard. “PDF.” 5 Mar. 2020.).
lowerOddLetters :: String -> String
lowerOddLetters x = if (x == []) then [] else if (tail x == []) then (if (fromEnum (head x) > 64 && fromEnum (head x) < 91) then (toEnum (fromEnum (head x) + 32) :: Char):lowerOddLetters (tail x) else head (x):[])
                    else if (fromEnum (head x) > 64 && fromEnum (head x) < 91) then (toEnum (fromEnum (head x) + 32) :: Char):head (tail x):lowerOddLetters (tail (tail x)) 
                    else head x:head (tail x):lowerOddLetters (tail (tail x))

-- This function "has [almost] the same behavior as replicate" (Burns, Richard. “PDF.” 5 Mar. 2020.). It takes an argument i, an Int, and c, a Char, and creates a string with that Char repeated i times. If i is 0, then it returns empty string.
replicate' :: Int -> Char -> String
replicate' i c = if (i == 1) then c:[] else if (i == 0) then [] else c : replicate' (i - 1) c

-- This function is the helper insertion function for iSort'.
ins' :: (Int, String) -> [(Int, String)] -> [(Int, String)]
ins' (i, s) x = if (x == []) then [(i, s)] else if (i <= fst (head x)) then (i, s) : (fst ( head x), snd ( head x)) : tail x else (fst ( head x), snd ( head x)) : ins' (i, s) (tail x)

-- This function "uses insertion sort to sort a list of pairs (Int, String) where only the first element (the Int part of the pair) is ... considered during the sorting process" (Burns, Richard. “PDF.” 5 Mar. 2020.). 
iSort' :: [(Int, String)] -> [(Int, String)]
iSort' x = if (x == []) then [] else ins' (head x) (iSort' (tail x))

-- This function "lowercases the first character in a string" (Burns, Richard. “PDF.” 5 Mar. 2020.). 
lowerFirstCharacter :: String -> String
lowerFirstCharacter s = if (length s == 0) then s else if ((fromEnum (head s) > 64 && fromEnum (head s) < 91)) then lowerFirstCharacter ((toEnum (fromEnum (head s) + 32) :: Char):tail s) else s

-- This function "returns the second word in a string that is composed of exactly three words" (Burns, Richard. “PDF.” 5 Mar. 2020.). The string is delimited by whitespace.
middleWord :: String -> String
middleWord s = if (head s /= ' ') then middleWord (tail s) else if (head (drop (length s - 1) s) /= ' ') then middleWord (take (length s - 1) s) else reverse (tail (reverse (tail s)))

-- This function "lowercases the first uppercase letter in a string" (Burns, Richard. “PDF.” 5 Mar. 2020.).
lowerFirstLetter :: String -> String
lowerFirstLetter s = if ([i | i <- [0 .. ((length s) - 1)], fromEnum(s!!i) > 64, fromEnum(s!!i) < 91] == []) then s else if (fromEnum (head s) > 64 && fromEnum (head s) < 91) 
                     then (toEnum (fromEnum (head s) + 32) :: Char):tail s else head s:lowerFirstLetter (tail s)

-- This function "lowercases the first two uppercase letter in a string" (Burns, Richard. “PDF.” 5 Mar. 2020.). It just calls the previous function twice (which uses recursion).
lowerFirstTwoLetters :: String -> String
lowerFirstTwoLetters s = lowerFirstLetter (lowerFirstLetter s)