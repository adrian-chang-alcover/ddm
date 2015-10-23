today=$(date +"%Y-%m-%d")

echo 'backup datebase'
cp db/production.sqlite3 db/production_$today.sqlite3

echo 'backup repo'
cp -r public/repo/ /media/adrian/DATA/repo/$today

bundle
bundle exec rake railties:install:migrations RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production
bundle exec rake assets:clean RAILS_ENV=production