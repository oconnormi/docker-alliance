FROM alpine
ENV GROUP_ID=org.codice.alliance.distribution
ENV ARTIFACT_ID=alliance
ENV VERSION=0.3.5
ENV REPO=releases
RUN apk add --no-cache curl unzip
RUN curl -o $ARTIFACT_ID.zip \
  "http://artifacts.codice.org/service/local/artifact/maven/content?g=$GROUP_ID&a=$ARTIFACT_ID&v=$VERSION&r=$REPO&e=zip"
RUN unzip $ARTIFACT_ID.zip
RUN mv ${ARTIFACT_ID}-${VERSION} /$ARTIFACT_ID

FROM codice/ddf-base:2.11-alpine
LABEL maintainer=oconnormi

ENV APP_NAME=alliance
ENV APP_HOME=/app
ENV APP_LOG=$APP_HOME/data/log/$APP_NAME.log
ENV INSTALL_PROFILE=alliance

COPY --from=0 /alliance $APP_HOME

VOLUME $APP_HOME/data $APP_HOME/deploy $APP_HOME/etc

EXPOSE 8101 8993 8181
