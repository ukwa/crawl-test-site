FROM jekyll/jekyll as build-env
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./
RUN JEKYLL_ENV=production bundle exec jekyll build --verbose

FROM nginx:1.13.0-alpine
COPY --from=build-env /srv/jekyll/_site/ /usr/share/nginx/html/crawl-test-site/

