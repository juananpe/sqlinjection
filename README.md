# Dockerized SQLi Lab

Based on:
- SQLi Simulation Lab http://www.sqlinjection.net/simulation/ 
- Alpine-based LAP Server with PHP extensions https://github.com/EvilFreelancer/alpine-apache-php5 


## Where do I put my files?

- MySQL Dump -> dump/
- vulnerable php app -> html/public

Note: the database volume will be stored in ./database

### How to start?

login, pass and db name are hardcoded:

```
$ vi docker-compose.yml
$ vi html/public/includes/config.inc
$ docker-compose up -d

```

Wait a minute before trying to connect to  http://localhost:8888


### How to stop?
```
$ docker compose down
```



