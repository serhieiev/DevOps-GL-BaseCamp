#!/bin/bash

install_dir="/var/www/html"

# Creating random WordPress DB credenitals
db_name="wp`date +%s`"
db_user=$db_name
db_password=`date |md5sum |cut -c '1-12'`
sleep 1
mysqlrootpass=`date |md5sum |cut -c '1-12'`
sleep 1


# Install packages for https and mysql
sudo apt -y update 
sudo apt -y upgrade
sudo apt -y install apache2
sudo apt -y install mysql-server


# Start apache
sudo rm /var/www/html/index.html
sudo systemctl enable apache2
sudo systemctl start apache2

# Start mysql and set root password

sudo systemctl enable mysql
sudo systemctl start mysql

sudo /usr/bin/mysql -e "USE mysql;"
sudo /usr/bin/mysql -e "UPDATE user SET Password=PASSWORD($mysqlrootpass) WHERE user='root';"
sudo /usr/bin/mysql -e "FLUSH PRIVILEGES;"
sudo touch /root/.my.cnf
sudo chmod 640 /root/.my.cnf
sudo echo "[client]">>/root/.my.cnf
sudo echo "user=root">>/root/.my.cnf
sudo echo "password="$mysqlrootpass>>/root/.my.cnf

# Install PHP
sudo apt -y install php php-bz2 php-mysqli php-curl php-gd php-intl php-common php-mbstring php-xml

sudo sed -i '0,/AllowOverride\ None/! {0,/AllowOverride\ None/ s/AllowOverride\ None/AllowOverride\ All/}' /etc/apache2/apache2.conf #Allow htaccess usage

sudo systemctl restart apache2

# Download and extract latest WordPress package
if test -f /tmp/latest.tar.gz
then
echo "WP is already downloaded."
else
echo "Downloading WordPress"
cd /tmp/ && wget "http://wordpress.org/latest.tar.gz";
fi

sudo /bin/tar -C $install_dir -zxf /tmp/latest.tar.gz --strip-components=1
sudo chown www-data: $install_dir -R

# Create WP-config and set DB credentials
sudo /bin/mv $install_dir/wp-config-sample.php $install_dir/wp-config.php

sudo /bin/sed -i "s/database_name_here/$db_name/g" $install_dir/wp-config.php
sudo /bin/sed -i "s/username_here/$db_user/g" $install_dir/wp-config.php
sudo /bin/sed -i "s/password_here/$db_password/g" $install_dir/wp-config.php

cat << EOF >> $install_dir/wp-config.php
define('FS_METHOD', 'direct');
EOF

cat << EOF >> $install_dir/.htaccess
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index.php$ – [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
EOF

sudo chown www-data: $install_dir -R

# Set WordPress salts
sudo grep -A50 'table_prefix' $install_dir/wp-config.php > /tmp/wp-tmp-config
sudo /bin/sed -i '/**#@/,/$p/d' $install_dir/wp-config.php
sudo /usr/bin/lynx --dump -width 200 https://api.wordpress.org/secret-key/1.1/salt/ >> $install_dir/wp-config.php
sudo /bin/cat /tmp/wp-tmp-config >> $install_dir/wp-config.php && rm /tmp/wp-tmp-config -f
sudo /usr/bin/mysql -u root -e "CREATE DATABASE $db_name"
sudo /usr/bin/mysql -u root -e "CREATE USER '$db_name'@'localhost' IDENTIFIED WITH mysql_native_password BY '$db_password';"
sudo /usr/bin/mysql -u root -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost';"
 
# Save generated passwords to log file.
echo "Database Name: " $db_name >> creds.txt
echo "Database User: " $db_user >> creds.txt
echo "Database Password: " $db_password >> creds.txt
echo "Mysql root password: " $mysqlrootpass >> creds.txt