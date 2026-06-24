FROM ruby:3.3-slim

ENV BUNDLE_WITHOUT=development:test

WORKDIR /app

COPY Gemfile .
RUN bundle install

COPY app.rb config.ru .

RUN useradd --uid 10001 --create-home appuser
USER appuser

EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
