#
# Keeping parts of the original file for reference
#
# ENV RACK_ENV production
# ENV GITHUB_PUSH_SOURCE_TO Transifex Project Name
# ENV GITHUB_USERNAME Your github username
# ENV GITHUB_TOKEN Transifex API Token
# ENV GITHUB_WEBHOOK_SECRET Auth for Github Webhook
# ENV GITHUB_BRANCH master
# ENV TX_CONFIG_PATH config/tx.config
# ENV TX_USERNAME Transifex Username
# ENV TX_PASSWORD Transifex Password
# ENV TX_PUSH_TRANSLATIONS_TO Github Repo Name
# ENV TX_WEBHOOK_SECRET Auth for Transifex Webhook

FROM ruby:2.2-alpine
RUN apk update && apk upgrade && apk --no-cache add ruby-dev ruby-bundler make build-base
ENV RACK_ENV production
RUN mkdir -p /opt/transifex/txgh/
WORKDIR /opt/transifex/txgh/
COPY . /opt/transifex/txgh/
RUN bundle install

EXPOSE 9292
ENTRYPOINT ["bundle", "exec", "ruby", "-S", "rackup", "-w", "config.ru", "-o", "0.0.0.0"]


