%w{ruby1.9.1-full g++ libxml2 libxml2-dev libxslt1.1 libxslt1-dev sqlite3 libsqlite3-dev make}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{thin sinatra rack-accept rest-client sinatra-content-for nokogiri deltacloud-core require_relative}.each do |pkg|
  gem_package pkg do
    action :install
  end
end

service "deltacloud" do
  supports :restart => true, :start => true, :stop => true
end

template "deltacloud" do
  path "/etc/init.d/deltacloud"
  source "deltacloud.erb"
  owner "root"
  group "root"
  mode "0755"
  notifies :enable, "service[deltacloud]"
  notifies :start, "service[deltacloud]"
end
