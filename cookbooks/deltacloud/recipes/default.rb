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

# TODO: Proper service procedures
# TODO: Parametric IP address
execute "start" do
  command "deltacloudd -i mock -r 33.33.33.10 &"
end
