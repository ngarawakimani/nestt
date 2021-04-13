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
$ git clone git@gitlab.com:dej-rs-projects/testprojects/2021-04-nestjs-dancan-kimani.git
```

## Running the app

```bash
# development
$ docker-compose up -d
$ docker logs -f time_entries_ap
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

## Developers

- Author - Dancan Kimani
