#
# Cookbook Name:: my-sonarqube
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt'
include_recipe 'java'

# Monkey Patching
class Chef::Util::FileEdit
  def file_edited?
    @changes
  end
end

include_recipe 'sonarqube'
