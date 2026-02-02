fibbonacci :: Int -> Int
fibbonacci 0 = 0
fibbonacci 1 = 1
fibbonacci n = fibbonacci (n - 1) + fibbonacci (n - 2)

fibList :: Int -> [Int]
fibList n = fibHelper 0 1 n

fibHelper :: Int -> Int -> Int -> [Int]
fibHelper _ _  0 = []  --якщо count = 0, список закінився
fibHelper a b count = a : fibHelper b (a + b) (count - 1) -- виніс а на прешу паозиції списку, потім b, потім сума і зменшення лічильника

main :: IO ()
main = do
    putStrLn "Фібоначчі"
    let list = fibList 10
    putStrLn ("Список перших 10 чисел: " ++ show list)