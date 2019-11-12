# Dockerized SQLi Lab

Based on:
- SQLi Simulation Lab http://www.sqlinjection.net/simulation/ 
- Alpine-based LAP Server with PHP extensions https://github.com/EvilFreelancer/alpine-apache-php5 


## Where do I put my files?

- MySQL Dump -> dump/
- database -> database/
- vulnerable php app -> html/public

### How to start?

```
$ cp docker-compose.yml.example docker-compose.yml
$ vi docker-compose.yml
$ vi html/public/includes/config.inc
$ docker-compose up -d

```


