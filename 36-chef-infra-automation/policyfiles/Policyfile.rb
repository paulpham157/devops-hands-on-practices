name 'docker-host'

default_source :supermarket

run_list 'base::default', 'docker_host::default'

cookbook 'base', path: '../cookbooks/base'
cookbook 'docker_host', path: '../cookbooks/docker_host'
