# Contacts 

This is an Api for Survivor could survive the zombie apocalypse.

### Installation

Follow the steps below

```sh
$ Clone the repo

$ cd contacts

$ docker-compose build

$ docker-compose run app bundle exec rails db:create

$ docker-compose run app bundle exec rails db:migrate

$ docker-compose run app bundle exec rails db:seed

$ docker-compose up
```

### Running Tests

Use the following commands to run the automated tests.

```sh
$ docker-compose run app bundle exec rspec
```

### Enter in Bash

Use the following commands to enter in bash

```sh
$ docker-compose run app bash
```