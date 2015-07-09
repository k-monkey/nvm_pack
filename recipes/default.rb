#
# Cookbook Name:: nvm_pack
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#include_recipe 'bash'
#include_recipe 'curl'
#include_recipe 'git'

template '/tmp/install_nvm.sh' do
  source 'install_nvm.sh.erb'
  owner 'vagrant'
  group 'vagrant'
  mode '0744'
end

template '/tmp/install_nvm_pack.sh' do
  source 'install_nvm_pack.sh.erb'
  owner 'vagrant'
  group 'vagrant'
  mode '0744'
end

execute "install nvm, node and node libraries" do                                             
    cwd "/home/vagrant"                                                           
    user "vagrant"                                                                
    action :run   
    environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})                                                             
    command "/tmp/install_nvm_pack.sh"                  
end