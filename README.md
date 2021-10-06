# HaskellLabs
 Assignments for Programming Language Concepts and Paradigms class.

# Description
 These Haskell programs each provide solutions to several logic problems per file that were assigned for homework in this class.
 
# Program 1

1. Write a function isTwoDigitPositive that returns whether an integer is a two digit positive
number.
isTwoDigitPositive :: Integer -> Bool

2. Write a function dividesEvenly that returns whether the second integer divides evenly into the
first integer.
dividesEvenly 10 3 should return False .
dividesEvenly :: Integer -> Integer -> Bool

3. Write a function middle that returns the 2nd greatest of three given int arguments.
middle 3 5 3 should return 3 .
middle :: Int -> Int -> Int -> Int

4. Write a function nand that computes the NAND gate of two boolean arguments. (Look up
"nand" if you do not know what it is.)
nand :: Bool -> Bool -> Bool

5. Write a function f2c that converts a temperature in Fahrenheit into Celcius using the equation:
c = (f-32)*(5/9)
f2c :: Float -> Float

6. Write a function floorDecimal that calculates the floor of a float, but returns it as a float rather
than an integer.
floorDecimal 15.1 should return 15.0 .
floorDecimal :: Float -> Float

7. Write a function letterGrade that returns the equivalent letter grade for a given numerical
integer grade, per the syllabus for this course.
letterGrade :: Integer -> String

8. Write a function averageThree to return the average of three integers.
averageThree :: Integer -> Integer -> Integer -> Float

9. Write a function howManyBelowAverage that returns how many of three integer inputs are below
its average value. (Hint: utilize the averageThree function.)
howManyBelowAverage 3 4 11 should return 2 .
howManyBelowAverage :: Integer -> Integer -> Integer -> Integer

# Program 2

1. Write a function twoSame that returns True if at least two of the three arguments are equal, and
False otherwise.
twoSame :: Integer -> Integer -> Integer -> Bool

2. Write a function sum' that that uses recursion to compute the sum of all numbers from 1 to n,
the argument. Assume that n is greater than or equal to 1.
sum' :: Integer -> Integer

3. Write a function abssum' that that uses recursion to compute the sum of all numbers from -n to
n, where n is the argument. Assume that n is greater than or equal to 1.
abssum' :: Integer -> Integer

4. Redefine the built-in infix || operator. Name your new function or' with prefix notation. Do not
use guards in your definition, but rather utilize pattern matching. Use the wildcard _ pattern so
that you only have two definitions, rather than the four definitions we would usually write given
the truth table of ||.
or' :: Bool -> Bool -> Bool

5. Write a function integerSqrt that returns the integer square root of a positive integer n. (The
integer square root is defined to be the largest integer whose square is less than or equal to n,
i.e. the result of integerSqrt 15 is 3.).
integerSqrt :: Integer -> Integer

6. Write a function exponent' that recursively computes the result of raising some base number, b,
to some exponent, e. (e.g. 2^8 = 64). You may not use the ^ or ** operators -- you must use
recursion. This function will only be called on an exponent value that is a whole number (an
integer that is 0 or greater).
exponent' :: Integer -> Integer -> Integer

7. Write a function swap that swaps the characters in a quintuple (5-tuple) in the following way: the
first element swaps with the last, the second swaps with the fourth, and the middle doesn't
change. Only use pattern matching. You may not call any other functions.
swap :: (Char, Char, Char, Char, Char) -> (Char, Char, Char, Char, Char)

8. Write a function negateTwoDigits that uses list comprehension to take a list of integers and
return a list of integers with all of the two-digit integers negated.
negateTwoDigits :: [Integer] -> [Integer]

9. Write a function matches that uses list comprehension to pick out all instances of an integer n
from a list.
matches :: Integer -> [Integer] -> [Integer]
Example usage:
matches 3 [3,4,5,3] should return [3,3]
matches 3 [4,5,7] should return []

10. Use the matches function in the above problem to write a function element that uses list
comprehension to return True if an element is a member of a list, False otherwise. (You may not
use the elem function that is already defined in Haskell.).
element :: Integer -> [Integer] -> Bool

# Program 3

1. Write a function tripleAll that takes a list of ints, and returns a list of
pairs, such that the first element in each pair is in the original number,
and the second element is the original number tripled.
tripleAll :: [Int] -> [(Int, Int)]

2. Write a function flip that takes a list of pairs, and returns a list of pairs,
with the pairs flipped (the first item becomes the second item, and vice
versa).
flip :: [(Int, Int)] -> [(Int, Int)]

3. Write a function sumLastPart which, only using list library functions (no
list comprehension), returns the sum of the last n numbers in the list,
where n is the first argument to the function. (Assume that there are
always at least n numbers in the list. For this problem and the others,
assume that no error checking is necessary unless otherwise specified. But
feel free to incorporoate error checking into your definition.)
sumLastPart :: Int -> [Int] -> Int

4. Write a function middleProduct which, only using list library functions
(no list comprehension), returns the product of the interior items in the
list, that is, everything except the first and last item. Assume there are
always at least three numbers in the list.
middleProduct :: [Int] -> Int

5. Write a function init' that has identical behavior to the init function.
In your definition, you may only use list library functions that we covered
(no list comprehension). And obviously, you may not use init.
init' :: [Int] -> [Int]

6. Write a function triads that generates a list of integer triples, such that
x
2 + y
2 = z
2 and x, y, z <= n. (Hint: use a list comprehension with
multiple generators.)
triads :: Int -> [(Int,Int,Int)]

7. Write a function pushRight that takes a string and and an integer n and
forms a string of length n by putting spaces at the front of the string. (n
is guaranteed to be greater than or equal to the length of the string, and
no more than 40.)
For example, pushRight "crocodile" 12 should return " crocodile"
(three leading spaces).
pushRight :: String -> Int -> String

8. Write a function lowerFirstCharacter that lowercases the first character
in a string. (If the first character is not an uppercase letter, return the
entire string unmodified.)
lowerFirstCharacter :: String -> String

9. Write a function elemAt that returns the ith item of the list, where the
first item is index 1. Hint: how can you utilize multiple generators?
elemAt :: Int -> [Int] -> Int

10. Write a function middleWord that that returns the second word in a string
that is composed of exactly three words. Assume that always exactly
three words are present, and that words are separated by the single space
character: ' '. For example, “Haskell is fun!” should return "is". (Hint:
which helper functions would be useful to define?)
middleWord :: String -> String

# Program 4

1. Write a recursive function tripleAll that takes a list of ints, and returns
a list of pairs, such that the first element in each pair is in the original
number, and the second element is the original number tripled.
tripleAll :: [Int] -> [(Int, Int)]

2. Write a recursive function flip that takes a list of pairs, and returns a
list of pairs, with the pairs flipped (the first item becomes the second item,
and vice versa).
flip :: [(Int, Int)] -> [(Int, Int)]

3. Write a recursive function sumLastPart which, only using list library
functions (no list comprehension), returns the sum of the last n numbers in
the list, where n is the first argument to the function. (Assume that there
are always at least n numbers in the list. For this problem and the others,
assume that no error checking is necessary unless otherwise specified. But
feel free to incorporoate error checking into your definition.)
sumLastPart :: Int -> [Int] -> Int

4. Write a recursive function middleProduct which, only using list library
functions (no list comprehension), returns the product of the interior items
in the list, that is, everything except the first and last item. Assume there
are always at least three numbers in the list.
middleProduct :: [Int] -> Int

5. Write a recursive function init' that has identical behavior to the init
function. In your definition, you may only use list library functions that
we covered (no list comprehension). And obviously, you may not use init.
init' :: [Int] -> [Int]

6. Write a recursive function lowerOddLetters that lowercases the first,
third, fifth letter (and so on) of a string. Assume that the string only
contains alphabet characters (no numbers or symbols).
lowerOddLetters :: String -> String

7. Write a recursive function elemAt that returns the ith item of the list, where
the first item is index 1. Hint: how can you utilize multiple generators?
elemAt :: Int -> [Int] -> Int

8. Write a recursive function iSort' that uses insertion sort to sort a list
of pairs (String, Int) where only the first element (the Int part of the
pair) is to be considered during the sorting process.
iSort' :: [(String, Int)] -> [(String, Int)]

9. Write a recursive function middleWord that that returns the second word
in a string that is composed of exactly three words. Assume that always
exactly three words are present, and that words are separated by the single
space character: ' '. For example, “Haskell is fun!” should return "is".
(Hint: which helper functions would be useful to define?)
middleWord :: String -> String

10. Write a recursive function lowerFirstLetter that lowercases the first
uppercase letter in a string. (The first uppercase letter may or may not
be the initial character. If there is no uppercase letter, return the entire
string unchanged.)
lowerFirstLetter :: String -> String

# Program 5

1. Write a function reverse' that reverses a list. You must use a case
expression inside of your function definition. You may not use any built-in
Haskell functions.
reverse' :: [a] -> [a]

2. Write a function isShorter that takes two timestamps and returns 1 if
the first is shorter, -1 if the second is shorter, and 0 if they are the same
duration. (Hint: what type synonym is implied with the below function
signature?) Assume for this, and other problems unless otherwise specified,
that the timestamps will always be valid (e.g. not negative, no more than
60 seconds in a minute, etc.).
isLonger :: TimeStamp -> TimeStamp -> Int

3. Write a function totalSeconds that returns the number of total seconds
that a video clip spans.
totalSeconds :: TimeStamp -> Int

4. Write a function isValid that returns whether a time stamp is valid: is
not negative in any of its parts, there are no more than 59 seconds and no
more than 59 minutes in its representation.
isValid :: TimeStamp -> Bool

5. Write a function time2Str that returns a string representation of timestamp in the form HH:MM:SS. (Hint: look up and use the built-in functionshow as well as ++.) Add leading zeros if necessary, such that the hours,
minutes, and seconds are always two digits. (Assume that hours in the
timestamp argument will never be three digits.)
time2Str :: TimeStamp -> String

6. Write a function member that checks whether the given item is present in
the given set.
member :: Int -> Set345 -> Bool

7. Write a function size that returns the number of elements in a given set.
size :: Set345 -> Int

8. Write a function ins that inserts the given item into a set. (If the item
is already in the set, simply return the set unmodified.) (Hint: you may
want to program a helper function that takes two Sets and merges them
into one.)
ins :: Int -> Set345 -> Set345

9. Write a function safeLast that behaves similarly to the built-in last
function, except that it returns Nothing if an empty list is passed as an
argument.
safeLast :: [Int] -> Maybe Int

10. Write a function safeCount that takes an item to search for and a list
of numbers, and returns Nothing if the list is empty; Just 0 if the item
doesn’t appear in the list; or Just x where x is the number of times that
the item appears in the list.
safeCount :: Int -> [Int] -> Maybe Int

# Program 6

1. Write a function singletonOrEmpty that takes a set and returns if it is
empty or is a singleton.
singletonOrEmpty :: Set345 -> Bool

2. Write a function union' that takes two sets and returns the union of both
sets.
union' :: Set345 -> Set345 -> Set345

3. Write a function intersection' that takes two sets and returns the
intersection of both sets.
intersection' :: Set345 -> Set345 -> Set345

4. Write a function countLetters that inputs three Strings from the user
on separate lines (feel free to prompt the user to enter each String if you
wish), and returns the number of letters in each entered String as a list.
countLetters :: IO [Int]

5. Write a function and' that takes as an argument a Boolean value and
performs a conjunction (“ands it”) with an inputed String “True” or “False”
from the user, and returns the Boolean value result.
and' :: Bool -> IO Bool

6. Write a function preorder that takes a tree argument and returns as a
list an preorder traversal of the tree.
preorder :: Tree1 -> [Int]

7. Write a function sumPositives that takes a tree argument and returns
the sum of positive integers in the tree.
sumPositives :: Tree1 -> Int

8. Write a function countInteriorNodes that returns the number of interior
nodes in the given tree.
countInteriorNodes :: Tree1 -> Int

9. Write a function depth that returns the depth of a tree. (A tree with only
a root node is defined to have depth=0.)
depth :: Tree1 -> Int

10. A tree is balanced if the number of leaves in the left and right subtree of
every node differ by at most one. Write a function balanced that returns
whether a tree is balanced or not.
balanced :: Tree1 -> Bool

# Program 7

1. Write a function unique that returns the list of elements that occur
exactly once in the argument list. You must use recursion and not list
comprehension. A helper function, or functions, may be useful.
unique :: Eq a => [a] -> [a]

2. Write a function piglatinize that returns a word into its piglatin form:
if it begins with a vowel, add to the end “yay”, else move non-vowels to
the end of the string until a vowel is at the front and then add to the end
“ay”. The word arguments are guaranteed to have a vowel (a, e, i, o, or u)
and not begin with the letter y.
piglatinize :: String -> String

3. Consider the following type:
data Expr1 = Val1 Int
| Add1 Expr1 Expr1
| Sub1 Expr1 Expr1
| Mul1 Expr1 Expr1
| Div1 Expr1 Expr1
Write a function value1 that evaluates an expression.
value1 :: Expr1 -> Int

4. Write a function value2 that evaluates an expression, but returns Nothing
if there is a division by zero scenario.
value2 :: Expr1 -> Maybe Int

5. Make the Expr1 type an instance of the Show class. Appropriate define
the function show so that (Add2 (Val2 3) (Val2 4)) returns the string
“(3+4)” and (Add2 (Val2 3) (Mul2 (Val2 2)(Val2 4))) returns the
string "(3+(2*4))".

6. Write a function bEval :: BExpr2 -> Bool that evaluates instances of
the above boolean expression.
bEval :: BExpr2 -> Bool

7. Write a function value2 that evaluates an expression.
value3 :: Expr2 -> Maybe Int
