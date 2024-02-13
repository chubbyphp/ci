#!/bin/bash
set -e

php -v
php -i | grep memory_limit

echo "composer update ${COMPOSER_ARGS}"
composer update $COMPOSER_ARGS
echo "composer test"
composer test
echo "vendor/bin/php-coveralls --coverage_clover=build/phpunit/clover.xml --json_path=build/coveralls.json -v"
vendor/bin/php-coveralls --coverage_clover=build/phpunit/clover.xml --json_path=build/coveralls.json -v
