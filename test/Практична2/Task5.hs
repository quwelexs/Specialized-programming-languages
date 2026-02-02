normalizeGrades :: [Int] -> [Float]
normalizeGrades list = 
    let 
        maxVal = maximum list--знаходження максимуму
        maxFloat = fromIntegral maxVal--перетворення на float
    in 
        --оцінка/максимум * 100
        map (\x -> (fromIntegral x / maxFloat) * 100.0) list

filterGrades :: Int -> [Int] -> [Int]
filterGrades threshold list = filter (>= threshold) list

average :: [Float] -> Float
average list = 
    let 
        totalSum = foldl (+) 0.0 list      
        
        count = length list--кількіть int
        countFloat = fromIntegral count--кількість float
    in 
        if count == 0 then 0.0--чи не поділено на нуль
        else totalSum / countFloat

--перетворює цілі оцінки у дробові
--функція average працює з float
intToFloat :: [Int] -> [Float]
intToFloat list = map fromIntegral list

main :: IO ()
main = do
    putStrLn "обробка оцінок"

    let grades = [60, 75, 90, 100, 45, 82, 73]
    let threshold = 70
    --вихідний список
    putStrLn $ "вихідний список: " ++ show grades
    --нормалізований список
    let normalized = normalizeGrades grades
    putStrLn $ "нормалізований список: " ++ show normalized
    --список оцінок, що пройшли фільтр
    let passed = filterGrades threshold grades
    putStrLn $ "пройшли фільтр (>= 70): " ++ show passed
    --середнє значення
    let avgBefore = average (intToFloat grades)
    putStrLn $ "середнє до фільтрації: " ++ show avgBefore

    --відфільирований список
    let avgAfter = average (intToFloat passed)
    putStrLn $ "середнє після фільтрації: " ++ show avgAfter