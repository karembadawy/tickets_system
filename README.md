# Tickets System

## Environment

* Ruby 2.7.4
* Rails 5.2.7
* PostgreSQL 13
* Redis server 6.2.6
* Sidekiq 6.4.1

## Getting started

1. Install `docker` and `docker-compose` if not installed
2. Make sure that `git` is installed and configured

    ```bash
    sudo apt-get install git
    git config --global user.email "your.email@some.domain"
    git config --global user.name "Your Name"
    ```

3. Clone the project branch:

    ```bash
    git clone git@github.com:karembadawy/tickets_system.git
    ```

4. Head to the project directory `cd tickets_system`

## Running Development Environment Using Docker

> **_NOTE:_**  For Windows users you will need to convert `entrypoint.sh` file line break type from CRLF to LF.

1. Copy `.env.example` to `.env`.

    ```bash
    cp .env.example .env
    ```

2. Replace `APP_USER_ID` value in `.env` with your `user ID`

    ```bash
    sed  -i "/APP_USER_ID=/c\APP_USER_ID=$(id -u)" .env
    ```

3. Run `docker-compose up`

    > **_NOTE:_**  If you faced `Cannot start service sidekiq: failed to create shim: OCI runtime create failed: container_linux.go:380: starting container process caused: exec: "/home/tickets_system/app/entrypoint.sh": permission denied: unknown` run `chmod +x entrypoint.sh`

4. Run migrations `docker-compose exec app rails db:migrate`
5. Run seeds `docker-compose exec app rails db:seed`
6. You can now visit `http://localhost:3000/`

## Alias setup (Optional step)

* To make commands easier, add an alias on your machine to map 'docker-compose exec' part. The following steps are tested on Ubuntu:

    ```bash
    # Open bash aliases file:
    nano ~/.bashrc # (or ~/.zshrc if you are using Z shell)
    # Add new alias:
    alias tickets_system='docker-compose exec app'
    # Source your bashrc file:
    source ~/.bashrc
    ```

* Now you can the same commands in this readme file by replacing 'docker-compose exec app' part with 'tickets_system'. For example:

    ```bash
    # Run migrations:
    tickets_system rails db:migrate
    # Run database seeds:
    tickets_system rails db:seed
    # Run RSpec command:
    tickets_system rspec
    ```

## Install overcommit

* Run it inside the docker

    ```bash
    tickets_system overcommit --install
    tickets_system overcommit --sign
    ```

> **_NOTE:_**  If you faced `Bad owner or permissions on /home/tickets_system/.ssh/config` enter to bash use `docker exec -it tickets_system_app_1 /bin/bash` then run `chmod 600 ~/.ssh/config`

## Running tests

* Outside the container apply the below commands

    ```bash
    tickets_system rspec spec
    ```

## Background Jobs

* Start Sidekiq from the Sidekiq container (but you don't need to do that it is running by default when you `docker-compose up`)

    ```bash
    docker-compose exec sidekiq sidekiq
    ```

* You can see Jobs from `http://localhost:3000/sidekiq`

## Redis server

* Redis is already running inside its container and listening on port 6379
* you can enter to `redis-cli` using this command

    ```bash
    docker-compose exec redis redis-cli
    ```

## Postgresql

* Postgresql in already running inside its container
