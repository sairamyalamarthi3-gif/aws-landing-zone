#!/bin/bash

yum update -y

yum install -y httpd

systemctl enable httpd

systemctl start httpd

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

echo "<h1>AWS Landing Zone</h1>" > /var/www/html/index.html

echo "<h2>Instance: $INSTANCE_ID</h2>" >> /var/www/html/index.html
