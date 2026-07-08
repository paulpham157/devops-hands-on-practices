class role::docker_host {
  include profile::base

  package { 'docker.io':
    ensure => installed,
  }

  service { 'docker':
    ensure => running,
    enable => true,
  }
}
