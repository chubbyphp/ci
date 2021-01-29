#!/bin/bash
set -e

php -v
composer update $COMPOSER_ARGS
composer test
vendor/bin/php-coveralls --coverage_clover=build/phpunit/clover.xml --json_path=build/coveralls.json -v
