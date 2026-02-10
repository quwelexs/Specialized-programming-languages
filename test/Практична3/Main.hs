module Main where

import LibraryDomain
import Data.List (intercalate) --для об'єднання назв через кому

--допоміжна функція для зручного друку
printBooks :: [Book] -> IO ()
printBooks [] = putStrLn "  (список порожній)"
printBooks books = mapM_ (\b -> putStrLn $ "  - " ++ title b ++ " (" ++ author b ++ ")") books

main :: IO ()
main = do
    putStrLn "\nСИСТЕМА УПРАВЛІННЯ БІБЛІОТЕКОЮ"
    
    putStrLn "\n1. всі доступні книжки:"
    let available = getAvailableBooks libraryCatalog
    printBooks available

    putStrLn "\n2. книжки жанру 'Programming':"
    let progBooks = getBooksByGenre Programming libraryCatalog
    printBooks progBooks

    putStrLn "\n3. пошук за автором 'George Orwell':"
    let orwellBooks = getBooksByAuthor "George Orwell" libraryCatalog
    printBooks orwellBooks

    putStrLn "\n3.1. пошук за автором 'Robert C. Martin':"
    printBooks (getBooksByAuthor "Robert C. Martin" libraryCatalog)

    putStrLn "\n4. Список назв усіх книжок:"
    let titles = getAllTitles libraryCatalog
    putStrLn $ intercalate ", " titles

    putStrLn "\n5. агрегація: сторінки в 'Science':"
    let sciencePages = totalPagesByGenre Science libraryCatalog
    putStrLn $ "  загалом сторінок: " ++ show sciencePages

    putStrLn "\n5.1. агрегація: сторнки в 'Programming':"
    let progPages = totalPagesByGenre Programming libraryCatalog
    putStrLn $ "  загалом сторінок: " ++ show progPages

    putStrLn "\n6. агрегація: середня кільість сторінок у каталозі:"
    case averagePageCount libraryCatalog of
        Nothing -> putStrLn "  каталог порожній, неможливо обчислити середнє."
        Just avg -> putStrLn $ "  Середнє значення: " ++ show avg