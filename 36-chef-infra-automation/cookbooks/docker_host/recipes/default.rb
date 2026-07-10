include_recipe 'base::default'

package 'docker.io'

service 'docker' do
  action [:enable, :start]
end

template '/etc/docker/daemon.json' do
  source 'daemon.json.erb'
  variables(log_driver: node['docker_host']['log_driver'])
  mode '0644'
end
