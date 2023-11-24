FROM openjdk:11 as init

COPY . /app 
WORKDIR /app

USER root

RUN apt update
RUN apt install gradle -y
RUN gradle -v
RUN java -version

COPY ./minecraft /root/.gradle/caches/minecraft
RUN ls /root/.gradle/caches/minecraft

RUN rm -rf minecraft
RUN gradle clean build --debug
RUN ls /root/.gradle/caches/
RUN ls

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD [ "ls" ]

