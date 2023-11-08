FROM python:3.8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /hackernews
WORKDIR /hackernews
COPY requirements.txt /hackernews/
RUN pip install -r requirements.txt
COPY . /hackernews/
RUN python manage.py makemigrations --setting=settings.production
RUN python manage.py migrate --setting=settings.production 
CMD python manage.py runserver --setting=settings.production 0.0.0.0:8080
