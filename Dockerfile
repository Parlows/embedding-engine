FROM pytorch/pytorch:latest
WORKDIR /app

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

COPY warmup.py /app
RUN python warmup.py

COPY . /app

RUN rm rebuild.sh

ENV FLASK_APP=main.py
ENV FLASK_ENV=development
ENV FLASK_RUN_PORT=1809
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 1809

CMD ["flask", "run"]