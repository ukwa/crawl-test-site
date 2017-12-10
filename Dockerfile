FROM jekyll/jekyll as builder
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./
# Note: the COPY FROM fails if you user the default /srv/jekyll/_site target, preseumably because it's a VOLUME and so keeps resetting (?)
RUN JEKYLL_ENV=production bundle exec jekyll build --verbose --destination /_site

FROM nginx:1.13.0-alpine
COPY --from=builder /_site /usr/share/nginx/html

EXPOSE 80
