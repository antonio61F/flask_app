FROM python:3.11.3-slim-bullseye

MAINTAINER Antonio <antonio.akrapovic@racunarstvo.hr>

LABEL description="Creating tempconverter image"
WORKDIR "/home/tux/Desktop/docker/tempconverter"

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apt update -y
RUN pip install --upgrade pip

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python"]
CMD ["app.py"]
