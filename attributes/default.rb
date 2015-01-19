# cookbook-bms / httpd
default['cookbook-bms']['app_configurations'] = [
  {
    'name' => 'bms',
    'server_name' => 'bms.local',
    'error_log_dir' => '~',
    'access_log_dir' => '~',
    'docroot' => '~'
  }
]

# cookbook-bms / yum
default['yum']['packages'] = %w{
  vim
  git
}

# opscode / cookbook-php
default['php']['install_method'] = 'source'
default['php']['version'] = '5.6.4'
default['php']['prefix_dir'] = '/usr/local'
default['php']['configure_options'] = %W{
  --prefix=#{php['prefix_dir']}
  --with-libdir=lib64
  --with-config-file-path=#{php['conf_dir']}
  --with-config-file-scan-dir=#{php['ext_conf_dir']}
  --with-pear
  --enable-fpm
  --with-zlib
  --with-openssl
  --with-kerberos
  --with-bz2
  --with-curl
  --enable-ftp
  --enable-zip
  --enable-exif
  --with-gd
  --enable-gd-native-ttf
  --with-gettext
  --with-gmp
  --with-mhash
  --with-iconv
  --with-imap
  --with-imap-ssl
  --enable-sockets
  --enable-soap
  --with-xmlrpc
  --with-mcrypt
  --enable-mbstring
  --with-mysql
  --with-mysqli=/usr/bin/mysql_config
  --with-mysql-sock
  --with-pdo-mysql
  --disable-fileinfo}

