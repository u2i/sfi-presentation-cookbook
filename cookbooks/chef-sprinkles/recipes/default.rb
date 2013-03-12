package "apache2"

directory node["deploy_path"] do
  recursive true
  mode 00777
end

cookbook_file node["deploy_path"] + "index.html" do
  source "sprinkles.html"
  mode 00444
end

template "/etc/apache2/sites-available/default" do
  source "sprinkles.conf.erb"
  notifies :restart, "service[apache2]"
end

service "apache2" do
  action [:enable, :start]
end
