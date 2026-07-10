class profile::base (
  Array[String] $packages = lookup('profile::base::packages', { default_value => ['curl', 'git'] }),
) {
  package { $packages:
    ensure => installed,
  }

  file { '/etc/motd':
    ensure  => file,
    mode    => '0644',
    content => "Managed by Puppet
",
  }
}
