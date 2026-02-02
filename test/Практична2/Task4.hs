getSquares :: [Int] -> [Int]
getSquares list = map (\x -> x * x) list

getEvens :: [Int] -> [Int]
getEvens list = filter even list

-- починаємо з нуля і додаємо з ліва направо 
getSumFold :: [Int] -> Int
getSumFold list = foldl (+) 0 list

sumOfSquaresOfEvens :: [Int] -> Int
sumOfSquaresOfEvens list = 
    let 
        evens = filter even list-- парні
        --безіменна одноразова фкнкція
        squares = map (\x -> x * x) evens--до квадртау
    in 
        foldl (+) 0 squares--згортання списку, при цьому все додається з нуля

runTest :: [Int] -> IO ()
runTest xs = do
    putStrLn $ "ихідний список: " ++ show xs
    putStrLn $ "список квадратів:" ++ show (getSquares xs)
    putStrLn $ "список парних:" ++ show (getEvens xs)
    putStrLn $ "сума всіх (fold):" ++ show (getSumFold xs)
    putStrLn $ "сума квадратів парних:" ++ show (sumOfSquaresOfEvens xs)

main :: IO ()
main = do
    putStrLn "map,filter,fold\n"

    let list = [1..10]
    putStrLn "[1..10]:"
    runTest list
    putStrLn "\nтестування:"
    let test1 = [1, 2, 3, 4, 5, 6]
    runTest test1
    let test2 = [0, -1, -2, 10]
    runTest test2
    let test3 = [5, 5, 5]
    runTest test3