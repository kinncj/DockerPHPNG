#!/bin/bash
chmod 755 /var/www

wget https://getcomposer.org/download/1.0.0-alpha9/composer.phar

chmod +x composer.phar

php composer.phar create-project symfony/framework-standard-edition /var/www/symfony2 '~2.6'

chmod -R 777 /var/www/symfony2/app/{logs,cache}
