--Summer 2013]
--Q1A
count:: Eq a => a -> [a] -> Int
count x [] = 0
count x xs = length ( filter (\n -> x == n) xs)

--Q1B
remdups :: Eq a => [a] -> [a]
remdups [] = []
remdups (x:xs) =  x : remdups (remover x xs)
  
remover x xs = filter( \n -> x /=n ) xs
--Q1C
occurences :: Eq a => [a] -> [(a, Int)]
occurences [] = []
occurences (x:xs) = (x, length ( fil x (x:xs))) : occurences (remover x (x:xs))

fil :: Eq a => a -> [a] -> [a]
fil x xs = filter( \n -> x ==n ) xs

--Q2A
--iterater :: (a -> a) -> a -> [a]
iterater f x = x : zipWith (\n m -> m*n) (iterater f x) [f,f..]

-- Alternative solution
iterateQ :: (a->a) -> a -> [a]
iterateQ f x = x : iterateQ f (f x)

--Q2C
--powers :: Int -> [Int]
powers n = iterater n n

-- Alternative solution
powersQ :: Num a => a -> [a] 
powersQ x = iterateQ (\y -> y*x) x

--Q3
--isPermutation :: (a -> b) -> [b] -> Bool
isPermutation :: Eq a => (a -> a) -> [a] -> Bool
isPermutation f [] = True
isPermutation f (x1:xs) = if (count ( f x1) (x1:xs) == 1) && (distinctPair f x1 xs) then
                          isPermutation f xs
                          else
                          False
                          
--distinctPair :: (a -> b) -> b -> [b] -> Bool                        
distinctPair f x [] = True
distinctPair f x (x1:xs) = if (f x) /= (f x1) then
                          distinctPair f x xs
                          else
                          False
                          
--Q4
--inverse not done
-- Not sure about this one. I think inverse should just give the original list back, which is what
-- you take in as s, but that seems too simple. Maybe I'm reading it wrong. -Henry
inverse :: Eq a => (a -> a) -> [a] -> [a]
inverse f s = if isPermutation f s then s else error "uh oh"