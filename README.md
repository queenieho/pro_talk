# pro_talk

# Setup
1. clone source code
2. use bundle to install dependancies 
3. create database, run migrations, seed database, start server: 
  ```
  rake db:create
  rake db:migrate
  rake db:seed
  rails s
  ```

## Remove stored data and add seed data:
```
rake db:drop
rake db:create
rake db:migrate
rake db:seed
```
