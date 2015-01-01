#
# Cookbook Name:: my-sonar-runner
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

sonar_runner_zipfile_destination = ::File.join(Chef::Config[:file_cache_path], "sonar-runner-dist-2.4.zip")

remote_file sonar_runner_zipfile_destination do
  source "http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip"
  mode 644
end

package 'unzip'

bash 'unzip installation' do
  code <<-EOF
    unzip #{sonar_runner_zipfile_destination} -d /opt/
  EOF
  not_if { ::File.directory?("/opt/sonar-runner-2.4/") }
end
