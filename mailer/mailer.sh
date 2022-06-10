yum install openssh-client glibc.i686 pam.i686 pam nano rsync wget xinetd.x86_64 gcc httpd perl mod_ssl.x86_64 zip unzip sudo


#cd /tmp
#wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
#yum install epel-release-7.noarch.rpm



wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
yum repolist


yum-config-manager --enable remi-php70

yum install -y php php-pgsql php-common php-pdo php-opcache php-mycrypt php-imap php-mbstring php-soap php-xmlrpc cronie php-pecl-ssh2 ca-certificates

systemctl enable httpd.service
systemctl start httpd.service

wget  https://getcomposer.org/download/1.10.26/composer.phar
chmod +x composer.phar
mv composer.phar /usr/local/bin/composer

#wget https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7.9-x86_64/postgresql96-9.6.24-1PGDG.rhel7.x86_64.rpm
#sudo yum install pgdg-centos96-9.6-3.noarch.rpm epel-release

#yum install  https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm -y

rpm -ivh https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum update

https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7.12-x86_64/postgresql96-server-9.6.24-1PGDG.rhel7.x86_64.rpm


systemctl enable httpd.service
systemctl start httpd.service