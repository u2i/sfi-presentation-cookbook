include_recipe "apache2"
package "git"

directory node["deploy_path"] do
  recursive true
  mode 00777
end

git node["deploy_path"] do
  repository node["git_repo"]
  user "www-data"
end

web_app "sprinkles" do
  template "sprinkles.conf.erb"
end
