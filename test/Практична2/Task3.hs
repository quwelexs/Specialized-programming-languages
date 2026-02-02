--максимум списку- це або голова, або максимум хвоста (що більше).
findMaxRec :: [Int] -> Int
findMaxRec []  = error "Список порожній! Неможливо знайти максимум."
findMaxRec [x] = x  -- якщо в списку один елемент, він і є максимумом
findMaxRec (x:xs) = 
    let maxTail = findMaxRec xs -- рекурсивний пошук максимуму в списку
    in if x > maxTail 
       then x 
       else maxTail

myMax :: Int -> Int -> Int
myMax a b = 
    if a > b then a 
       else b

findMaxFold :: [Int] -> Int
findMaxFold [] = error "Список порожній!"
-- (x:xs) - перший елемент х як акамулятор
-- починає з x, далі решта списку,потім вже застосовується myMax до результату і наступного числа
findMaxFold (x:xs) = foldl myMax x xs

main :: IO ()
main = do
    let test1 = [5, 2, 9, -3, 7]
    let test2 = [42]
    let test3 = [-5, -10, -2, -100]

    putStrLn "Тест 1: [5, 2, 9, -3, 7]"
    putStrLn $ "рекурсивно: " ++ show (findMaxRec test1)
    putStrLn $ "через fold: " ++ show (findMaxFold test1)

    putStrLn "\nТест 2: [42]"
    putStrLn $ "рекурсивно: " ++ show (findMaxRec test2)
    putStrLn $ "через fold: " ++ show (findMaxFold test2)

    putStrLn "\nТест 3: [-5, -10, -2, -100]"
    putStrLn $ "рекурсивно: " ++ show (findMaxRec test3)
    putStrLn $ "через fold: " ++ show (findMaxFold test3)