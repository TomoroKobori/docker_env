FROM node:11.10.0 as node
FROM ruby:2.7

ENV ENTRYKIT_VERSION 0.4.0

RUN apt-get update && apt-get install -y vim

RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
    && mv entrykit /bin/entrykit \
    && chmod +x /bin/entrykit \
    && entrykit --symlink

ENV YARN_VERSION 1.10.1

COPY --from=node /opt/yarn-v$YARN_VERSION /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/

RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg

WORKDIR /app

RUN bundle config build.nokogiri --use-system-libraries

ENTRYPOINT [ \
    "prehook", "bundle install -j3", "--", \
    "prehook", "yarn install", "--"]
