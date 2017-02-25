FROM oconnormi/ddf-base:edge
MAINTAINER oconnormi

ENV APP_VERSION=0.2
ENV APP_BASE=/opt
ENV APP_HOME=$APP_BASE/alliance
ENV APP_LOG=$APP_HOME/data/log/ddf.log

RUN apk add --no-cache curl unzip

RUN mkdir -p $APP_BASE/tmp \
    && mkdir -p $APP_HOME \
    && cd $APP_BASE/tmp \
    && curl -o alliance.zip "http://artifacts.codice.org/service/local/artifact/maven/content?g=org.codice.alliance.distribution&a=alliance&v=$APP_VERSION&r=releases&e=zip" \
    && unzip alliance.zip \
    && mv alliance-${APP_VERSION}/* $APP_HOME \
    && rm -rf $APP_BASE/tmp

VOLUME $APP_HOME/data $APP_HOME/deploy $APP_HOME/etc

EXPOSE 8101 8993 8181
