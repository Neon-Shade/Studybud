# # Python versiyasi
# FROM python:3.12

# # Ish papkasi
# WORKDIR /app

# # requirements.txt ni ko‘chiramiz
# COPY requirements.txt .

# # Kutubxonalarni o‘rnatamiz
# RUN pip install -r requirements.txt

# # Barcha fayllarni ko‘chiramiz
# COPY . .

# # Serverni ishga tushiramiz
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python manage.py collectstatic --noinput
CMD ["gunicorn", "StudyBud.wsgi:application", "--bind", "0.0.0.0:8000"]