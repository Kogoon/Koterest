FROM python:3.9.7

WORKDIR /home/

RUN git clone https://github.com/Kogoon/Koterest.git

WORKDIR /home/Koterest

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY=" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]