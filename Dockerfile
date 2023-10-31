FROM openjdk:8-slim

ENV LANG=C.UTF-8 \
    PATH_TO_EMBULK=/opt/embulk \
    PATH=${PATH}:/opt/embulk

# Change timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update && apt-get install -y curl

# Embulk install
RUN mkdir -p ${PATH_TO_EMBULK} \
    && curl --create-dirs -o ${PATH_TO_EMBULK}/embulk -L "https://dl.embulk.org/embulk-0.9.24.jar" \
    && chmod +x ${PATH_TO_EMBULK}/embulk

WORKDIR /work

ENTRYPOINT java -jar ${PATH_TO_EMBULK}/embulk
