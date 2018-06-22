# Install and configure ruby and rails environment

brew install rbenv
brew install ruby-build

# https://www.ruby-lang.org/en/downloads/

declare -a ruby_versions=(
    '2.2.9'
    '2.3.6'
    '2.4.3'
    '2.5.0'
)
for i in "${ruby_versions[@]}"; do
    eval "rbenv install $i"
    eval "rbenv global $i"
    gem install bundler
done

rbenv rehash
