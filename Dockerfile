FROM jekyll/jekyll as builder
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./
RUN JEKYLL_ENV=production bundle exec jekyll build --verbose --destination /_site
RUN ls
RUN pwd
RUN ls /_site

FROM nginx:1.13.0-alpine
COPY --from=builder /_site /usr/share/nginx/html/crawl-test-site/

