FROM jekyll/jekyll as builder
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./
RUN JEKYLL_ENV=production bundle exec jekyll build --verbose
RUN ls
RUN pwd
RUN ls /srv/jekyll

FROM nginx:1.13.0-alpine
COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html/crawl-test-site/

