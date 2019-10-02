#!/bin/sh
yum install -y httpd
service start httpd
chkonfig httpd on
echo "<html><h1>Hello VPC how are you, using Terrafrom  ^^</h2></html>" > /var/www/html/index.html
