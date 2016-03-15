mysql_service "default" do
  notifies :run, "bash[create_schema]", :delayed
end

bash "create_schema" do
  root_password = node['vlg-all-in-one']['mysql_root_password']
  code <<-EOH
    nc -z -v -w 1 127.0.0.1 #{node["vlg-all-in-one"]["mysql_port"]} || exit 0
    mysql --user root --password="#{root_password}" --socket="/var/run/mysql-default/mysqld.sock" -e "CREATE SCHEMA dmp;"
  EOH
  action :nothing
end