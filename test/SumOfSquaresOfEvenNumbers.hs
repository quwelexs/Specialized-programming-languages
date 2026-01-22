module Main where
sumOfEvenSquares :: [Int] -> Int
sumOfEvenSquares =sum . map (^2) . filter even

main :: IO ()
main = do
    putStrLn "Сума квадратів парних чисел\n"
    let list1 = [1,2,3,4]
    let list2 = [10,-5,7,6]
    let list3 = [1,3,5]
    let list4 = [] :: [Int]

    putStrLn ("Вхід: "++ show list1 ++" --> результат: " ++ show (sumOfEvenSquares list1))
    putStrLn ("Вхід: "++ show list2 ++" --> результат: " ++ show (sumOfEvenSquares list2))
    putStrLn ("Вхід: "++ show list3 ++" --> результат: " ++ show (sumOfEvenSquares list3))
    putStrLn ("Вхід: "++ show list4 ++" --> результат: " ++ show (sumOfEvenSquares list4))