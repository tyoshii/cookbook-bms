#
# Cookbook Name:: cookbook-bms
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'cookbook-bms::yum'
include_recipe 'cookbook-bms::httpd'
include_recipe 'cookbook-bms::php'
