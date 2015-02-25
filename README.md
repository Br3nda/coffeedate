## Installing

Make sure you have PostgreSQL installed and create the necessary databases and users.

```
su - postgres
psql
create database coffeedate_dev;
create role coffeedate with createdb login password 'coffeedate';
\q
```
