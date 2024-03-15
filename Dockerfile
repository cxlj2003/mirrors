FROM nginx:latest
MAINTAINER GeorgeChu<304251350@qq.com>
COPY ./init.sh /init.sh
RUN sh /init.sh \
    && rm -rf /init.sh
EXPOSE 80
