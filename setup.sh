today=$(date +"%Y-%m-%d")

echo 'backup datebase'
cp db/production.sqlite3 db/production_$today.sqlite3

echo 'backup repo'
sudo mv public/repo/ /media/adrian/DATA/repo/$today

echo 'updating repo'
scp -r adrian@10.6.37.107:~/Documents/ddm/public/repo public/
sudo chmod -R +rwx public/repo

echo 'git pull origin master'
git pull origin master

bundle
bundle exec rake railties:install:migrations RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production
bundle exec rake assets:clean RAILS_ENV=production

sudo service apache2 restart
