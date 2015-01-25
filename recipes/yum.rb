#
# Cookbook Name:: cookbook-bms
# Recipe:: yum
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

node['cookbook-bms']['yum']['packages'].each do |name|
  yum_package "install #{name}" do
    package_name name
    action :install
  end
end
