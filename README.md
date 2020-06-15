# README

docker-compose run web rails new . --force --no-deps --database=mysql --skip-test --webpacker

database.ymlに下記を追加
url: <%= ENV['DATABASE_URL'] || 'mysql2://root@localhost' %>

database名を変更

docker-compose run web rake db:create
