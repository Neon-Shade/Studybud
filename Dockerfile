FROM python:3.11-slim

# Muhit o'zgaruvchilari
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT 8000

WORKDIR /app

# Kutubxonalarni o'rnatish
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Barcha fayllarni nusxalash
COPY . .

# Statik fayllarni yig'ish
RUN python manage.py collectstatic --noinput

# Portni ochish
EXPOSE 8000

# ISHGA TUSHIRISH (Bu qatorni diqqat bilan tekshiring)
CMD ["gunicorn", "StudyBud.Studybud.wsgi:application", "--bind", "0.0.0.0:8000"]