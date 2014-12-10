#!/bin/bash
echo "Starting Apache2";
source /etc/apache2/envvars
exec apache2 -D FOREGROUND
