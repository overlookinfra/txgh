FROM ruby:2.2-alpine
RUN apk update && apk upgrade && apk --no-cache add ruby-dev ruby-bundler make build-base
ENV RACK_ENV production
RUN mkdir -p /opt/transifex/txgh/
WORKDIR /opt/transifex/txgh/
COPY . /opt/transifex/txgh/
RUN bundle install

EXPOSE 9292
ENTRYPOINT ["bundle", "exec", "ruby", "-S", "rackup", "-w", "config.ru", "-o", "0.0.0.0"]
