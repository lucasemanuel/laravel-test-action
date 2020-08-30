#!/bin/sh -l

composer i --prefer-dist

apt-get update && apt-get -y install php7.4-gd

cp .env.example .env

php artisan key:generate

php artisan test --process-isolation


