module Main where

square :: Int -> Int
square x = x * x

main :: IO ()
main = do
    --4.1 створення списку без циклів
    let numbers = [1..10]
    --4.2 функції вищого порядку
    let squares = map square numbers
    let evens = filter even numbers
    let totalSum = foldl (+) 0 numbers

    --4.3 вивід результатів
    putStrLn "Робота зі списками та вищими функціями\n"

    putStrLn ("Початковий список: "++ show numbers)
    putStrLn ("Квадрати чисел: "++ show squares)
    putStrLn ("Парні числа: "++ show evens)
    putStrLn ("Сума елементів списку: "++ show totalSum)
