FROM ruby:3.1 AS build

WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle install

COPY . /app

RUN bundle exec jekyll build

FROM nginx:stable-alpine

COPY --from=build /app/_site/ /usr/share/nginx/html
COPY docker/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]