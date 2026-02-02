--main :: IO ()
--main = putStrLn "Привіт! Це моя перша програма на функціональній мові."
--точка входу програми
module Main where

--імпорт модуля з рекурсивними функціями
import RecursionFunctions

main :: IO ()
main = do
    putStrLn "Перевірка рекурсивних функцій\n"

    putStrLn ("факторіал 5 = "++ show (factorial 5))
    putStrLn ("факторіал 0 = "++ show (factorial 0))

    putStrLn ("сума спику [1,2,3] = "++ show (sumList [1,2,3]))
    putStrLn ("сума спику [10,-5,7] = "++ show (sumList [10, -5, 7]))
    putStrLn ("сума спик [] = "++ show (sumList []))
