# Docker setup for the PHP/Laravell development
### How To Run
Generate new Laravell app

**docker-compose run --rm composer create-project --prefer-dist laravel/laravel .**

Change in the new generated app env vars for the DB connection according to the env/mysql.env

Run nginx/php/mysql setup 

**docker-compose up -d --build server**

Migrate app to the DB with artisan

**docker-compose run --rm artisan migrate**