FROM python:3.9.7

WORKDIR /home/

RUN echo "Start"

RUN git clone https://github.com/Kogoon/Koterest.git

WORKDIR /home/Koterest

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=" > .env

RUN python manage.py collectstatic

EXPOSE 8000

# CMD ["gunicorn", "koterest.wsgi", "--bind", "0.0.0.0:8000"]
CMD ["bash", "-c", "python manage.py migrate --settings=koterest.settings.deploy && gunicorn koterest.wsgi --env DJANGO_SETTINGS_MODULE=koterest.settings.deploy --bind 0.0.0.0:8000"]