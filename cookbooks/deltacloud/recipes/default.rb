%w{ruby1.9.1-full g++ libxml2 libxml2-dev libxslt1.1 libxslt1-dev sqlite3 libsqlite3-dev make patch}.each do |pkg|
  package pkg do
    action :install
  end
end

%w{thin sinatra rack-accept rest-client sinatra-content-for nokogiri}.each do |pkg|
  gem_package pkg do
    action :install
  end
end

$DC_VER = '1.1.2'
$dc_src_url = "http://archive.apache.org/dist/deltacloud/#{$DC_VER}/deltacloud-core-#{$DC_VER}.tgz"
$CWD = "/home/vagrant"
$dc_tgz = "#{$CWD}/dc.tar.gz"

remote_file $dc_tgz do
    source  $dc_src_url
    mode 00644
    not_if { ::File.exists? $dc_tgz }
end

bash "patch and install deltacloud" do
    user "root"
    cwd ::File.dirname($dc_tgz)
    code <<-EOF
        tar xzf #{$dc_tgz}
        cd deltacloud-core-#{$DC_VER}/
        patch </vagrant/deltacloud-core.gemspec.diff
        gem build deltacloud-core.gemspec
        gem install --no-rdoc --no-ri deltacloud-core-#{$DC_VER}.gem
    EOF
    not_if "which deltacloudd >/dev/null 2>&1"
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
