FROM python:stretch

RUN mkdir -p /var/app

COPY main.py /var/app/

RUN pip install --upgrade pip==20.2.3

COPY requirements.txt /var/app/

WORKDIR /var/app

RUN pip install -r requirements.txt

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]
