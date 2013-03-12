package "apache2"

cookbook_file "/var/www/index.html" do
  source "sprinkles.html"
  mode 00444
end

cookbook_file "/etc/apache2/sites-available/default" do
  source "sprinkles.conf"
  notifies :restart, "service[apache2]"
end

service "apache2" do
  action [:enable, :start]
end
