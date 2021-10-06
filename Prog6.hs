{- ##################################
 Zachary Perales
 Homework 6
 21 April 2020
 ################################## -}
module Prog6 where

-- This is the data for Set. 
data Set = Set [Int]
    | EmptySet
  deriving Show

-- This is the data for the Tree.
data Tree = Leaf Int
          | Node Tree Int Tree

-- This function "returns whether two sets are equal" (Burns, Richard. “PDF.” 14 Apr. 2020.).
equal :: Set -> Set -> Bool
equal (Set []) (Set []) = True
equal EmptySet EmptySet = True
equal (Set []) EmptySet = True
equal EmptySet (Set []) = True
equal _ (Set []) = False
equal _ EmptySet = False
equal (Set []) _ = False
equal EmptySet _ = False
equal (Set (x:xs)) (Set (y:ys)) = if ( length [i | i <- (y:ys), member i ( Set (x:xs) ) == False ] == 0 ) && ( length [i | i <- (x:xs), member i ( Set (y:ys) ) == False ] == 0 ) then True else False

-- This function "removes the given item from a set" (Burns, Richard. “PDF.” 14 Apr. 2020.).
saferemove :: Int -> Set -> Maybe Set
saferemove x (Set []) = Nothing
saferemove x EmptySet = Nothing
saferemove x (Set (y:ys)) = if (length [p | p <- (y:ys), x /= p] == 0) then Just EmptySet else Just (Set [p | p <- (y:ys), x /= p])

-- This function "takes two sets and returns the union of both sets" (Burns, Richard. “PDF.” 14 Apr. 2020.).
union :: Set -> Set -> Set
union EmptySet EmptySet = EmptySet
union (Set []) EmptySet = EmptySet
union EmptySet (Set []) = EmptySet
union (Set []) (Set []) = EmptySet -- Not sure if you wanted EmptySet here? Same comment as above.
union EmptySet (Set y) = Set y
union (Set x) EmptySet = Set x
union (Set x) (Set y) = Set ([p | p <- (x++y), (gate (member p (Set x)) (member p (Set y)))]++[r | r <- (x), (member r (Set x)) && (member r (Set y))])

-- This function "takes a tree argument and returns as a list [a] preorder traversal of the tree" (Burns, Richard. “PDF.” 14 Apr. 2020.).
preorder :: Tree -> [Int]
preorder (Leaf y) = [y]
preorder (Node left root right) = [root] ++ preorder left ++ preorder right

-- This function "takes a tree argument and returns as a list [a] postorder traversal of the tree" (Burns, Richard. “PDF.” 14 Apr. 2020.).
postorder :: Tree -> [Int]
postorder (Leaf y) = [y]
postorder (Node left root right) = postorder left ++ postorder right ++ [root]

-- This function "takes a tree argument and returns how many values in the tree are exactly 0" (Burns, Richard. “PDF.” 14 Apr. 2020.).
countZeros :: Tree -> Int
countZeros (Leaf 0) = 1
countZeros (Leaf _) = 0
countZeros (Node left root right) = case (Node left root right) of 
  (Node _ 0 _) ->  countZeros left + 1 + countZeros right
  (Node _ _ _) -> countZeros left + 0 + countZeros right

-- This function "returns the number of leaves in [a] given tree" (Burns, Richard. “PDF.” 14 Apr. 2020.).
countLeaves :: Tree -> Int
countLeaves (Leaf y) = 1
countLeaves (Node left root right) = countLeaves left + 0 + countLeaves right

-- This function "returns the number of interior nodes in [a] given tree" (Burns, Richard. “PDF.” 14 Apr. 2020.).
countInteriorNodes' :: Tree -> Int
countInteriorNodes' (Leaf y) = 0
countInteriorNodes' (Node left root right) = countInteriorNodes' left + 1 + countInteriorNodes' right

-- This function checks to see if it is a single node / leaf only root tree. If it is, it returns 1. Else, it moves onto the regular function.
countInteriorNodes :: Tree -> Int
countInteriorNodes tree = if (depth tree == 0) then 1 else countInteriorNodes' tree

-- This function "returns the depth of a tree" (Burns, Richard. “PDF.” 14 Apr. 2020.).
depth :: Tree -> Int
depth (Leaf y) = 0
depth (Node left root right) = if ((1 + depth left) > (1 + depth right)) then 1 + depth left else 1 + depth right

-- This helper function counts the MINIMUM height of the left subtree, or gets the value I need.
balanced'' :: Tree -> Int
balanced'' (Node left root (Leaf z)) = 1
balanced'' (Node (Leaf z) root right) = 1
balanced'' (Node left root right) = if ((1 + balanced'' left) < (1 + balanced'' right)) then 1 + balanced'' left else 1 + balanced'' right

-- This returns true if "the number of leaves in the left and right subtree of every node differ by at most one" and False otherwise (Burns, Richard. “PDF.” 14 Apr. 2020.).
balanced :: Tree -> Bool
balanced (Leaf x) = True
balanced tree = if ((depth tree - balanced'' tree) > 1) then False else True

-- This is a gate that makes sure the arguments are both not true.
gate :: Bool -> Bool -> Bool 
gate x y = ((x && y) /= True)

-- This function searches a Set for an Int to see if it is present in the set already.
member :: Int -> Set -> Bool
member _ EmptySet = False
member _ (Set []) = False
member i (Set (x:xs)) = if (x == i) then True else member i (Set xs)