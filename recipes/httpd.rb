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

node['cookbook-bms']['httpd']['app_configurations'].each do | conf |
  file "/etc/httpd/sites-available/#{conf[:name]}.conf" do
    action :delete
  end

  file "/etc/httpd/sites-enabled/#{conf[:name]}.conf" do
    action :delete
  end

  web_app conf[:name] do
    server_name conf[:server_name]
    server_aliases [ conf[:name] ]
    allow_override 'All'
    error_log_dir conf[:error_log_dir]
    access_log_dir conf[:access_log_dir]
    docroot conf[:docroot]
    template 'web_app.conf.erb'
  end
end
