#!/bin/bash

if sudo service mysql status | grep -Fq 'running'; then
echo 'Looks Like mysql is installed already'
exit
else
        echo '------------2-----------'
        echo 'mysql-server-5.6 mysql-server/root_password password ready2go' | sudo debconf-set-selections
        echo 'mysql-server-5.6 mysql-server/root_password_again password ready2go' | sudo debconf-set-selections
        sudo apt-get -y install mysql-server
	# Code Reference from https://gist.github.com/sheikhwaqas/9088872
	# Run the MySQL Secure Installation wizard
        mysql_secure_installation

        sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
        mysql -uroot -p -e 'USE mysql; UPDATE `user` SET `Host`="%" WHERE `User`="root" AND `Host`="localhost"; DELETE FROM `user` WHERE `Host` != "%" AND `User`="root"; FLUSH PRIVILEGES;'
        service mysql restart
fi
