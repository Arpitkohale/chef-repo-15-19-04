execute 'load keys' do
  command ". /home/bamboo/.s3cfg"
end

cron 'MRC certification' do
  command "#{node['bamboo']['cron']['command']} #{node['bamboo']['cron']['command_opt']} #{node['bamboo']['cron']['source_path']} #{node['bamboo']['cron']['dest_path']}"
  hour '#{node['bamboo']['cron']['hour']}'
  minute '#{node['bamboo']['cron']['minute']}'
  day '#{node['bamboo']['cron']['day']}'
  month '#{node['bamboo']['cron']['month']}'
  weekday '#{node['bamboo']['cron']['weekday']}'
  only_if do File.exist?('/home/bamboo/.s3cfg') end
end