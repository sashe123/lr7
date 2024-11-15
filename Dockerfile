FROM python:3.10-slim

# Встановлюємо необхідні залежності
RUN apt-get update && apt-get install -y libpq-dev gcc

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файл requirements.txt та встановлюємо залежності
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо всі файли додатку
COPY . /app

# Запуск двох скриптів у правильній послідовності
CMD ["sh", "-c", "python /app/init_db.py && python /app/init_data.py"]
