--1 моделювання типів
--алгебраїчний тип даних
module LibraryDomain where
data Genre = Fiction | NonFiction | Science | Historical | Programming | Other --можна друкувати та порівнювати
           deriving (Show, Eq)                        

--алгебраїчний тип даних длястатусу
data Status = Available | CheckedOut | Archived
            deriving (Show, Eq)

--тип запису для книг
data Book = Book {
    bookId :: Int,
    title :: String,
    author :: String,
    year :: Int,
    genre :: Genre,
    pageCount :: Int,
    status :: Status
} deriving (Show, Eq)

--2 тестовий набір даних
libraryCatalog :: [Book]
libraryCatalog = [
    Book 1 "Кобзар" "Тарас Шевченко" 1840 Fiction 320 Available,
    Book 2 "Мистецтво програмування" "Дональд Кнут" 1968 Science 650 CheckedOut,
    Book 3 "Чистий код" "Robert C. Martin" 2008 Programming 450 Available,
    Book 4 "1984" "George Orwell" 1949 Fiction 328 Available,
    Book 5 "Sapiens: Людина розумна" "Yuval Noah Harari" 2011 NonFiction 512 CheckedOut,
    Book 6 "Домашнє кондитерство" "Unknown Author" 2015 NonFiction 220 Available,
    Book 7 "Історія України" "Unknown Author" 2003 Historical 300 Archived,
    Book 8 "Алгоритми. Побудова та аналіз" "Cormen et al." 1990 Science 1312 Available
    ]

--3 фільтрація й пошук
--1 доступні книжки
getAvailableBooks :: [Book] -> [Book]
getAvailableBooks books = filter (\b -> status b == Available) books
--2 жанр
getBooksByGenre :: Genre -> [Book] -> [Book]
getBooksByGenre targetGenre books = filter (\b -> genre b == targetGenre) books
--3 автор
getBooksByAuthor :: String -> [Book] -> [Book]
getBooksByAuthor targetAuthor books = filter (\b -> author b == targetAuthor) books
--4 трансформаії та агрегація
-- 1)список назв усіх книжок
getAllTitles :: [Book] -> [String]
getAllTitles books = map title books

-- 2)загальна кількість сторінок у книжках певного жанру
totalPagesByGenre :: Genre -> [Book] -> Int
totalPagesByGenre targetGenre books = foldl (+) 0 (map pageCount (filter (\b -> genre b == targetGenre) books))

-- 3)середня кількість сторінок
--повертає maybe double, щоб безпечно обробити ситуацію ділення на нуль
averagePageCount :: [Book] -> Maybe Double
averagePageCount [] = Nothing--якщо список порожній, не можна ділити на 0, тоиу просто nothing
averagePageCount books = Just (fromIntegral totalPages / fromIntegral count)-- якщо є, просто рахуємо сер значення
  where
    totalPages = sum (map pageCount books)
    count = length books