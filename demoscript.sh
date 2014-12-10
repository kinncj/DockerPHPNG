#!/bin/bash
chmod 755 /var/www

wget https://getcomposer.org/download/1.0.0-alpha9/composer.phar

chmod +x composer.phar

php composer.phar create-project symfony/framework-standard-edition /var/www/symfony2 '~2.6'

chmod -R 777 /var/www/symfony2/app/{logs,cache}


cat <<EOT >/var/www/symfony2/web/index.php
<?php
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Debug\Debug;
// If you don't want to setup permissions the proper way, just uncomment the following PHP line
// read http://symfony.com/doc/current/book/installation.html#configuration-and-setup for more information
//umask(0000);
// This check prevents access to debug front controllers that are deployed by accident to production servers.
// Feel free to remove this, extend it, or make something more sophisticated.

$loader = require_once __DIR__.'/../app/bootstrap.php.cache';
Debug::enable();
require_once __DIR__.'/../app/AppKernel.php';
$kernel = new AppKernel('dev', true);
$kernel->loadClassCache();
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);

EOT
