FROM python:3.9.1-buster

RUN apt-get update -qq && apt-get -y install ffmpeg
RUN apt update && apt upgrade -y

RUN apt install git curl python3-pip ffmpeg -y

RUN pip3 install -U pip

RUN cd /

RUN git clone https://github.com/Skystapper/thickass

RUN cd thickass

WORKDIR /thickass

RUN pip3 install -U -r requirements.txt

CMD python3 bot.py

WORKDIR /usr/src/app

COPY . .

RUN pip install -U -r requirements.txt

CMD [ "python", "-m", "bot", "bash", "start.sh" ]
