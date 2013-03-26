# encoding=utf-8
#
# Cookbook Name:: cookbooks-vmstart
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


template "修改udev文件" do
 source "70-persistent-net.rules.erb"
 path "/etc/udev/rules.d/70-persistent-net.rules"
end

template "修改hostname文件" do
 source "hostname.erb"
 path "/etc/hostname"
 variables(
	:ip => node[:vmstart][:ip],
	:hostname => node[:vmstart][:hostname]
 )
end

template "修改ip" do
 source "interfaces.erb"
 path "/etc/network/interfaces"
 variables(
        :ip => node[:vmstart][:ip],
        :hostname => node[:vmstart][:hostname]
 )

end

template "修改/etc/hosts ip--> hostname对应关系" do
 source "hosts.erb"
 path "/etc/hosts"
 variables(
        :ip => node[:vmstart][:ip],
        :hostname => node[:vmstart][:hostname]
 )

end

puts "------------------------------------------------"
puts "reboot~~~~~~~~~>3 < plz"
puts "------------------------------------------------"

#execute "重启网卡" do
# command "/etc/init.d/networking restart"
#end
