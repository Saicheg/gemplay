## README

### Setup

- `rake db:create`
- Download dump from https://rubygems.org/pages/data
- Add hstore extension to created db `psql <db_name> -c 'create extension hstore;'`
- load dump to db
- `rake db:migrate`
- Create application on github and add keys to secrets.yml

### TODO
1. Optimistic Lock
2. Login logic(after submitting first answer or something else)
3. Design
