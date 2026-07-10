node /^docker-host-/ {
  include role::docker_host
}

node default {
  include profile::base
}
