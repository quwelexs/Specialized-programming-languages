--main :: IO ()
--main = putStrLn "Привіт! Це моя перша програма на функціональній мові."
--точка входу програми
module Main where

--імпорт модуля з чистими функціями
import MathFunctions

main :: IO ()
main = do
    --1
    putStrLn "Перевірка чистих функцій\n"

    putStrLn ("квадрат 5 = "++ show (square 5))
    putStrLn ("квадрат 10 = "++ show (square 10))

    putStrLn ("модуль (-7) = "++ show (absValue (-7)))
    putStrLn ("модуль 4 = "++ show (absValue 4))

    putStrLn ("більше з 3 і 8 = "++ show (maxOfTwo 3 8))
    putStrLn ("більше з 10 і 2 = "++ show (maxOfTwo 10 2))

