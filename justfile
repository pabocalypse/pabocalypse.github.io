# Default command to list options
_default:
    @just --list

# bundle install
install:
    bundle install

# serve the site for dev use
serve: clean
    bundle exec jekyll serve

# remove the site that is used for dev
clean:
    rm -rvf _site
