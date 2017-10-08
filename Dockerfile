FROM jekyll/jekyll as builder
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./
RUN JEKYLL_ENV=production bundle exec jekyll build --verbose
RUN ls /srv/jekyll/_site

FROM nginx:1.13.0-alpine
COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html/crawl-test-site/

