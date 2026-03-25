#!/bin/bash
#шлях до директорії, де лежить сам check.sh
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#run_tests.sh з жорстко зашитими параметрами
bash "$SCRIPT_DIR/run_tests.sh" \
    --cmd "python -m pytest -q sample_py/" \
    --format html \
    --project "My_Test_Project"

#код завершення run_tests.sh
exit $?