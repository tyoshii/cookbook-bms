# cookbook-bms / httpd
default['cookbook-bms']['httpd']['app_configurations'] = [
  {
    'name' => 'bms',
    'server_name' => 'bms.local',
    'error_log_dir' => '~',
    'access_log_dir' => '~',
    'docroot' => '~'
  }
]
default['cookbook-bms']['httpd']['ssl'] = [
  {
    'file' => 'server.key',
    'path' => '/etc/pki/tls/certs',
    'checksum' => 'e479e24bdd68836e9b8f352008513d7d6fdd74842b297c11d8484394fd3f5e34'
  },
  {
      'file' => 'server.crt',
      'path' => '/etc/pki/tls/certs',
      'checksum' => 'ad231cc77692f8c04371ba6fa06b233c8218da2e5e13056d44345678c011d4d6'
  }
]


# cookbook-bms / yum
default['yum']['packages'] = %w{
  vim
  git
}

# cookbook-bms / php
default['cookbook-bms']['php']['pear']['packages'] = %w{
  xdebug
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
  --enable-opcache
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

