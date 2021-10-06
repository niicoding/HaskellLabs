{- ##################################
   Zachary Perales
   2/11/2020 
   Homework 1
   ################################## -}
module Prog1 where

-- This function takes a Float argument and returns a Boolean, True or False, depending on whether the Float is positive or negative. 
isPositive :: Float -> Bool 
isPositive x = x >= 0

-- This function takes an Integer argument and returns a Boolean, True or False, depending on whether it is divided evenly by 5, or that division does not produce a remainder.
dividesEvenlyByFive :: Integer -> Bool
dividesEvenlyByFive x = mod x 5 == 0

-- This function takes three Integer arguments and returns the second greatest Integer, giving priority to x then y then z if arguments are equal. 
middle :: Integer -> Integer -> Integer -> Integer 
middle x y z
  | (x >= y && x <= z) || (x <= y && x >= z) = x
  | (y >= x && y <= z) || (y <= x && y >= z) = y
  | otherwise = z

-- This function takes two Boolean arguments, True or False, and returns a Boolean. The returned Boolean is only True if both inputs are False.
nor :: Bool -> Bool -> Bool 
nor x y = (x || y) /= True

-- This function takes two Integer arguments, the base and height of a triangle, and returns an Integer, the area of the triangle.
triangleArea :: Integer -> Integer -> Float 
triangleArea b h = if (b * h > 0) 
                   then fromIntegral (b * h) / 2 
                   else error "Not a triangle."

-- This function takes a Float argument, and returns the ceiling of the Float as a Float. 
ceilingDecimal :: Float -> Float 
ceilingDecimal f = fromIntegral (ceiling f)

-- This function takes an Integer argument and returns the corresponding grade according to the CSC345 syllabus grading scale as a String. 
letterGrade :: Integer -> String 
letterGrade g 
  | g > 100 = error "Grade can't be greater than 100."
  | g >= 93 = "A"
  | g >= 90 = "A-"
  | g >= 87 = "B+"
  | g >= 83 = "B"
  | g >= 80 = "B-"
  | g >= 77 = "C+"
  | g >= 73 = "C"
  | g >= 70 = "C-"
  | g >= 67 = "D+"
  | g >= 63 = "D"
  | g >= 60 = "D-"
  | g >= 0 = "F"
  | otherwise = error "Grade can't be less than 0."

-- This function takes three Integer arguments and returns the mean of the three arguments as a Float. 
averageThree :: Integer -> Integer -> Integer -> Float 
averageThree x y z = fromIntegral (x + y + z) / 3

-- This function takes three Integer arguments and returns the number of entered arguments that are above, but not equal to, their mean. 
howManyAboveAverage :: Integer -> Integer -> Integer -> Integer 
howManyAboveAverage x y z 
  | ((fromIntegral (x) > averageThree x y z)
      && (fromIntegral (y) > averageThree x y z)) 
      || ((fromIntegral (y) > averageThree x y z) 
      && (fromIntegral (z) > averageThree x y z)) 
      || ((fromIntegral (x) > averageThree x y z)
      && (fromIntegral (z) > averageThree x y z)) = 2
  | (fromIntegral (x) > averageThree x y z) 
      || (fromIntegral (y) > averageThree x y z) 
      || (fromIntegral (z) > averageThree x y z)  = 1
  | otherwise = 0

-- This function takes three Integer arguments and a Float argument, the threshold, and returns the number of entered arguments that are within the mean +- the threshold, exclusive of the end points. 
howManyWithinThreshold :: Integer -> Integer -> Integer -> Float -> Integer 
howManyWithinThreshold x y z t
  | t < 0 = error "Threshold can't be less than 0."
  | (((fromIntegral(x) > (averageThree x y z) - t) && (fromIntegral(x) < (averageThree x y z) + t))
      && ((fromIntegral(y) > (averageThree x y z) - t) && (fromIntegral(y) < (averageThree x y z) + t))
      && ((fromIntegral(z) > (averageThree x y z) - t) && (fromIntegral(z) < (averageThree x y z) + t))) = 3
  | (((fromIntegral(x) > (averageThree x y z) - t) && (fromIntegral(x) < (averageThree x y z) + t))
      && ((fromIntegral(y) > (averageThree x y z) - t) && (fromIntegral(y) < (averageThree x y z) + t))) 
      || (((fromIntegral(y) > (averageThree x y z) - t) && (fromIntegral(y) < (averageThree x y z) + t)) 
      && ((fromIntegral(z) > (averageThree x y z) - t) && (fromIntegral(z) < (averageThree x y z) + t)))
      || (((fromIntegral(x) > (averageThree x y z) - t) && (fromIntegral(x) < (averageThree x y z) + t))
      && ((fromIntegral(z) > (averageThree x y z) - t) && (fromIntegral(z) < (averageThree x y z) + t))) = 2
  | ((fromIntegral(x) > (averageThree x y z) - t) && (fromIntegral(x) < (averageThree x y z) + t)) 
      || ((fromIntegral(y) > (averageThree x y z) - t) && (fromIntegral(y) < (averageThree x y z) + t)) 
      || ((fromIntegral(z) > (averageThree x y z) - t) && (fromIntegral(z) < (averageThree x y z) + t))  = 1
  | otherwise = 0