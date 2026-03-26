set -e

echo "Setup: Встановлення залежностей"
#пакети з requirements.txt (там має бути pytest)
python -m pip install --upgrade pip
python -m pip install -r requirements.txt

echo "Залежності успішно встановлено"