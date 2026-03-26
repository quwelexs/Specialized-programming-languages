#!/bin/bash

echo "Етап Test: Запуск тестів"
mkdir -p reports

#запуск pytest і перенаправлення всього виводу у файл
python -m pytest -q > reports/test_output.txt 2>&1
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
    echo "Помилка: Тести не пройшли! Деталі у reports/test_output.txt"
    exit $EXIT_CODE
fi

echo "Тести успішно пройдено!"
exit 