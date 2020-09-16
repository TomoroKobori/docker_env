# README
## プロジェクトを作成
- 一般的なwebサイトの場合

`docker-compose run web rails new . --force --no-deps --database=mysql --skip-test --webpacker`
- 必要に応じてオプションを変更

## DBを作成
- database.ymlに下記を追加

  `url: <%= ENV['DATABASE_URL'] || 'mysql2://root@localhost' %>`
- DB名を設定
- DBのエンコーディングを設定
- DBを作成

  `docker-compose run web rake db:create`

## その他作業
- タイムゾーンの設定
- generateで不要なファイルが生成されないようにする
- 日本語化