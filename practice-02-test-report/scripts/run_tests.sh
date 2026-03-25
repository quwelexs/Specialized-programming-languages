#!/bin/bash
CMD=""
OUT_DIR="reports"
FORMAT="text"
RUN_ID=$(date +"%Y%m%d_%H%M%S")
#якщов в ядрі реп, бере поточну папку
PROJECT_NAME=$(basename "$PWD")

#парсінг арг
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --cmd) CMD="$2"; shift ;;
        --out) OUT_DIR="$2"; shift ;;
        --format) FORMAT="$2"; shift ;;
        --run-id) RUN_ID="$2"; shift ;;
        --project) PROJECT_NAME="$2"; shift ;;
        *) echo "Невідомий параметр: $1"; exit 1 ;;
    esac
    shift
done

#валідація
if [ -z "$CMD" ]; then
    echo "Помилка: параметр --cmd є обов'язковим."
    echo "Приклад запуску: ./scripts/run_tests.sh --cmd \"python -m pytest -q\""
    exit 1
fi

#створення структури каталогів
RUN_DIR="$OUT_DIR/runs/$RUN_ID"
mkdir -p "$RUN_DIR/raw" "$RUN_DIR/summary"

if [ "$FORMAT" = "html" ]; then
    mkdir -p "$RUN_DIR/html"
fi

RAW_LOG="$RUN_DIR/raw/test_output.txt"
START_TIME=$(date +"%Y-%m-%d %H:%M:%S")

#запуск тестів
echo "Запуск тестів: $CMD ..."
eval "$CMD" > "$RAW_LOG" 2>&1
EXIT_CODE=$?

#визначення статусу
if [ $EXIT_CODE -eq 0 ]; then
    STATUS="SUCCESS"
else
    STATUS="FAIL"
fi

#збір артефактів для summary
echo "$STATUS" > "$RUN_DIR/summary/status.txt"
echo -e "Command: $CMD\nTime: $START_TIME\nRun ID: $RUN_ID\nProject: $PROJECT_NAME" > "$RUN_DIR/summary/meta.txt"

#ERROR та FAILED
ERROR_COUNT=$(grep -c "ERROR" "$RAW_LOG")
FAILED_COUNT=$(grep -c "FAILED" "$RAW_LOG")

echo -e "ERROR: $ERROR_COUNT\nFAILED: $FAILED_COUNT" > "$RUN_DIR/summary/stats.txt"

# Формування текстового звіту (Завдання 3)
REPORT_FILE="$RUN_DIR/report.txt"
{
    echo "Назва проєкту: $PROJECT_NAME"
    echo "Дата і час запуску: $START_TIME"
    echo "Команда запуску тестів: $CMD"
    echo "Статус: $STATUS"
    echo "Шлях до raw-логу: $RAW_LOG"
    echo "-----------------------------------"
    echo "Статистика:"
    echo "Кількість рядків з ERROR: $ERROR_COUNT"
    echo "Кількість рядків з FAILED: $FAILED_COUNT"
    
    if [ "$ERROR_COUNT" -gt 0 ] || [ "$FAILED_COUNT" -gt 0 ]; then
        echo "--- Перші 5 рядків (ERROR/FAILED) ---"
        grep -E "ERROR|FAILED" "$RAW_LOG" | head -n 5
        echo "--- Останні 5 рядків (ERROR/FAILED) ---"
        grep -E "ERROR|FAILED" "$RAW_LOG" | tail -n 5
    else
        echo "Маркери ERROR і FAILED не знайдено."
    fi
} > "$REPORT_FILE"

#формування html
if [ "$FORMAT" = "html" ]; then
    HTML_FILE="$RUN_DIR/html/report.html"
    cat <<EOF > "$HTML_FILE"
<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Test Report - $PROJECT_NAME</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .success { color: green; }
        .fail { color: red; }
    </style>
</head>
<body>
    <h1>Підсумковий звіт: $PROJECT_NAME</h1>
    <p><strong>Статус:</strong> <span class="$(echo $STATUS | tr '[:upper:]' '[:lower:]')">$STATUS</span></p>
    <p><strong>Команда:</strong> <code>$CMD</code></p>
    <p><strong>Дата та час:</strong> $START_TIME</p>
    <p><strong>Raw-лог:</strong> <a href="../../raw/test_output.txt">test_output.txt</a></p>
    <h3>Статистика:</h3>
    <ul>
        <li>ERROR: $ERROR_COUNT</li>
        <li>FAILED: $FAILED_COUNT</li>
    </ul>
</body>
</html>
EOF
fi

echo "Звіт згенеровано: $REPORT_FILE"
exit $EXIT_CODE