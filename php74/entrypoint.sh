#!/bin/bash
set -e

git config --global --add safe.directory $PWD

php -v
echo "composer update ${COMPOSER_ARGS}"
composer update $COMPOSER_ARGS
echo "composer test"
composer test
echo "vendor/bin/php-coveralls --coverage_clover=build/phpunit/clover.xml --json_path=build/coveralls.json -v"
vendor/bin/php-coveralls --coverage_clover=build/phpunit/clover.xml --json_path=build/coveralls.json -v
