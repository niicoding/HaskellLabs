{- ##################################
 Zachary Perales
 Homework 7
 30 April 2020
 ################################## -}
module Prog7 where

-- This is the data for Expr.
data Expr = Val Int
    | Add Expr Expr
    | Sub Expr Expr
    | Mul Expr Expr
    | Div Expr Expr

-- This function "evaluates an expression" using addition, subtraction, multiplication, or division (Burns, Richard. “PDF.” 23 Apr. 2020.).
eval :: Expr -> Int
eval (Val n) = n
eval (Add e1 e2) = (eval e1)   +   (eval e2)
eval (Sub e1 e2) = (eval e1)   -   (eval e2)
eval (Mul e1 e2) = (eval e1)   *   (eval e2)
eval (Div e1 e2) = (eval e1) `div` (eval e2)

-- This function "returns the greatest integer literal in an expression" (Burns, Richard. “PDF.” 23 Apr. 2020.).
maxlit :: Expr -> Int
maxlit (Val v)  = v
maxlit (Add e1 e2) = if (maxlit e1 > maxlit e2) then maxlit e1 else maxlit e2
maxlit (Mul e1 e2) = if (maxlit e1 > maxlit e2) then maxlit e1 else maxlit e2
maxlit (Sub e1 e2) = if (maxlit e1 > maxlit e2) then maxlit e1 else maxlit e2
maxlit (Div e1 e2) = if (maxlit e1 > maxlit e2) then maxlit e1 else maxlit e2

-- This function "evaluates an expression, safely -- that is, catches any division by zero errors" (Burns, Richard. “PDF.” 23 Apr. 2020.).
safeeval :: Expr -> Maybe Int
safeeval (Val n) = Just n
safeeval (Div e1 (Val 0)) = Nothing
safeeval (Add e1 e2) = Just (eval (Add e1 e2))
safeeval (Sub e1 e2) = Just (eval (Sub e1 e2))
safeeval (Mul e1 e2) = Just (eval (Mul e1 e2))
safeeval (Div e1 e2) = Just (eval (Div e1 e2))

-- This function makes " the 'Expr' type an instance of the 'Show' class, so that 'show' function is now defined for the 'Expr' type" (Burns, Richard. “PDF.” 23 Apr. 2020.).
instance Show Expr where
    show (Val n) = show n
    show (Add e1 e2) = "(" ++ show e1 ++ "+" ++ show e2 ++ ")"
    show (Sub e1 e2) = "(" ++ show e1 ++ "-" ++ show e2 ++ ")"
    show (Mul e1 e2) = "(" ++ show e1 ++ "*" ++ show e2 ++ ")"
    show (Div e1 e2) = "(" ++ show e1 ++ "'div'" ++ show e2 ++ ")" -- Could also make 'div' /

-- This function "takes an expression, and returns a new tree with 1 added to every literal" (Burns, Richard. “PDF.” 23 Apr. 2020.).
addone :: Expr -> Expr
addone (Val n) = Val (n + 1)
addone (Add e1 e2) = Add (addone e1) (addone e2)
addone (Sub e1 e2) = Sub (addone e1) (addone e2)
addone (Mul e1 e2) = Mul (addone e1) (addone e2)
addone (Div e1 e2) = Div (addone e1) (addone e2)

-- This function "returns whether each element in the first list is also in the second list" (Burns, Richard. “PDF.” 23 Apr. 2020.).
containing :: Eq a => [a] -> [a] -> Bool
containing [] _ = True
containing _ [] = False
containing x y = if (tail x == [] && elem (head x) y) then True else if (not (elem (head x) y)) then False else containing (tail x) y 

-- This function "computes the 'sum of squares of negatives'" (Burns, Richard. “PDF.” 23 Apr. 2020.). This function was modified from the function " 'sum of squares of positives' " from the April 28th "Folding" Slide and Lecture.
sumSqNeg :: [Int] -> Int
sumSqNeg xs = foldr (+) 0 (map sqr (filter neg xs))
    where
        sqr x = x * x
        neg x = x < 0
 
-- This function "returns a list of lengths of the given strings" (Burns, Richard. “PDF.” 23 Apr. 2020.).
lengths :: [String] -> [Int]
lengths x = map length x

-- This function "applies the function (first argument) to every element in the list (second argument) and sums the result" (Burns, Richard. “PDF.” 23 Apr. 2020.).
total :: (Int -> Int) -> [Int] -> Int
total f x = foldr (+) 0 (map f x)

-- This function "returns whether each element in the first list is also in the second list" (Burns, Richard. “PDF.” 23 Apr. 2020.).
containing' :: Eq a => [a] -> [a] -> Bool
containing' xs ys = if (length [tf | tf <- (map elem' xs), tf == False] == 0) then True else False
    where
        elem' x = elem x ys