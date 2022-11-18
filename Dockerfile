FROM ruby:3.0

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES 1

RUN gem install bundler

WORKDIR /srv/jekyll

COPY Gemfile* ./
RUN bundle install

COPY . /srv/jekyll

VOLUME /srv/jekyll

EXPOSE 4000

# -H 0.0.0.0 allows access to external networking
# force_polling makes linux watch for any changes to files, and then regenerate
# livereload automatically refreshes the browser when changes occur on files
CMD bundle exec jekyll serve -H 0.0.0.0 --force_polling --livereload
