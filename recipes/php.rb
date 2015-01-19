#
# Cookbook Name:: cookbook-bms
# Recipe:: php
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/tmp/icu4c-49_1_2-src.tgz" do
  mode 00644
  checksum "cce83cc88a2ff79d65c05426facbf30530bbe13a1cfda04b3ab81b55414cf5a3"
end

bash "install icu-config" do
  cwd '/tmp'
  not_if 'which icu-config '
  code <<-EOC
    tar zxfv icu4c-49_1_2-src.tgz
    cd icu/source
    ./configure CC=gcc
    make
    sudo make install
  EOC
end

include_recipe 'php'
