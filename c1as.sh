#!/bin/bash

curl https://files.trendmicro.com/products/CloudOne/ApplicationSecurity/1.0.2/agent-php/trend_app_protect-x86_64-Linux-gnu-4.1.11-20151012.so > trend_app_protect-x86_64-Linux-gnu-4.1.11-20151012.so
cp trend_app_protect-x86_64-Linux-gnu-4.1.11-20151012.so "$(php -r 'echo ini_get ("extension_dir");')"/trend_app_protect.so

echo "; Enable the extension" >> /etc/php/7.0/apache2/php.ini
echo "extension = trend_app_protect.so" >> /etc/php/7.0/apache2/php.ini
echo "; Add key and secret from the Application Protection dashboard" >> /etc/php/7.0/apache2/php.ini
echo "trend_app_protect.key = $C1ASKey" >> /etc/php/7.0/apache2/php.ini
echo "trend_app_protect.secret = $C1ASSecret" >> /etc/php/7.0/apache2/php.ini

service apache2 restart

