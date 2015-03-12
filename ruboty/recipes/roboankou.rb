git "/home/ubuntu/roboankou" do
  repository "https://github.com/meganemura/roboankou.git"
  revision "master"
  user "ubuntu"
  group "ubuntu"
  action :sync
  notifies :run, "execute[bundle]"
end

execute "bundle" do
  cwd "/home/ubuntu/roboankou"
  command <<-EOF
    bundle install --jobs=4 --deployment
  EOF
  action :nothing
end

template "/home/ubuntu/roboankou/.env" do
  owner 'ubuntu'
  group 'ubuntu'
  mode '0440'
  source 'ruboty.env.erb'
  action :create
end
