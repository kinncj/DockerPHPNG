#!/bin/bash
chmod 755 /var/www

wget https://getcomposer.org/download/1.0.0-alpha9/composer.phar

chmod +x composer.phar

php composer.phar create-project symfony/framework-standard-edition /var/www/symfony2 '~2.6'

chmod -R 777 /var/www/symfony2/app/{logs,cache}


echo '<?php' >> /var/www/symfony2/web/app_dev.php
echo 'use Symfony\Component\HttpFoundation\Request;' >> /var/www/symfony2/web/app_dev.php
echo 'use Symfony\Component\Debug\Debug;' >> /var/www/symfony2/web/app_dev.php
echo '$loader = require_once __DIR__."/../app/bootstrap.php.cache";' >> /var/www/symfony2/web/app_dev.php
echo 'Debug::enable();' >> /var/www/symfony2/web/app_dev.php
echo 'require_once __DIR__."/../app/AppKernel.php";' >> /var/www/symfony2/web/app_dev.php
echo '$kernel = new AppKernel("dev", true);' >> /var/www/symfony2/web/app_dev.php
echo '$kernel->loadClassCache();' >> /var/www/symfony2/web/app_dev.php
echo '$request = Request::createFromGlobals();' >> /var/www/symfony2/web/app_dev.php
echo '$response = $kernel->handle($request);' >> /var/www/symfony2/web/app_dev.php
echo '$response->send();' >> /var/www/symfony2/web/app_dev.php
echo '$kernel->terminate($request, $response);' >> /var/www/symfony2/web/app_dev.php
echo '<?php header("location: app_dev.php");'> /var/www/symfony2/web/index.php
