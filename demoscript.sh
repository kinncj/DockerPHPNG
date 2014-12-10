#!/bin/bash
chmod 755 /var/www

echo '<?php phpinfo();' >> /var/www/index.php
