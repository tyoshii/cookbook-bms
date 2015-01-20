#
# Cookbook Name:: cookbook-bms
# Recipe:: httpd
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_ssl'

node['cookbook-bms']['httpd']['ssl'].each do | ssl_conf |
  cookbook_file "#{ssl_conf['path']}/#{ssl_conf['file']}" do
    mode 00600
    checksum ssl_conf['checksum']
  end
end

node['cookbook-bms']['httpd']['app_configurations'].each do | conf |
  %w{sites-available sites-enable}.each do | sites_dir |
    %w{conf ssl-conf}.each do | conf_suffix |
      file "/etc/httpd/#{sites_dir}/#{conf[:name]}.#{conf_suffix}" do
        action :delete
      end
    end
  end

  conf_suffix = ''
  %w{web_app.conf.erb web_app.secure.conf.erb}.each do | template |
    web_app "#{conf[:name]}#{conf_suffix}" do
      server_name conf[:server_name]
      server_aliases [ conf[:name] ]
      allow_override 'All'
      error_log_dir conf[:error_log_dir]
      access_log_dir conf[:access_log_dir]
      docroot conf[:docroot]
      template template
    end
    conf_suffix = '-ssl'
  end
end
