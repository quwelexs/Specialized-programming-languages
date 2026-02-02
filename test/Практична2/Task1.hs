factorial:: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    putStrLn "Перевірка рекурсивних функцій\n"

    putStrLn ("факторіал 0 = " ++ show (factorial 0))
    putStrLn ("факторіал 1 = " ++ show (factorial 1))
    putStrLn ("факторіал 5 = " ++ show (factorial 5))
    putStrLn ("факторіал 7 = " ++ show (factorial 7))
    putStrLn ("факторіал 10 = " ++ show (factorial 10))