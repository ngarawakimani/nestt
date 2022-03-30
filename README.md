## Title

Time Entries API

### Description

A REST API built using nestjs against redmine, that delivers

time entries of a user (single and multiple projects) in a period
time entries of all users in a project in a period

#### Main requirements

use framework nestjs

provide a script to fill redmine with example data
write e2e tests for your API endpoints
document everything (reviewer will check out the project and it needs to run on their system according to the documentation)

## Installation

Clone the repo from you gitlab account:

```bash
$ git clone git@github.com:ngarawakimani/nest-test.git
```

## Running the app

```bash
# build db and redmine server containers
$ docker-compose up -d

# Restore backup
$ cat backup/dumpbackup.sql | docker exec -i time_entries_api_db psql -U postgres
```

```bash
# install nestjs dependencies
$ npm install
# copy .env file
$ cp -r .env.example .env
# run the nestjs server
$ npm run start:dev
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Helpers

```bash
# to know the db's server IP from the container's network
# this will help with setup to pgadmin or any db manager tool
$ docker inspect time_entries_api_db

```

## API documentation

Swagger UI URL : http://localhost:3030/docs/#/

Postman collection : time.postman_collection.json

## Developers

- Author - Dancan Kimani
