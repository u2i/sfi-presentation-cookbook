package "apache2"
package "git"

directory node["deploy_path"] do
  recursive true
  mode 00777
end

git node["deploy_path"] do
  repository node["git_repo"]
  user "www-data"
end

template "/etc/apache2/sites-available/default" do
  source "sprinkles.conf.erb"
  notifies :restart, "service[apache2]"
end

service "apache2" do
  action [:enable, :start]
end
