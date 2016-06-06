FROM erlang:latest

RUN mkdir /code
WORKDIR /code

COPY . /code
CMD ["erl"]

