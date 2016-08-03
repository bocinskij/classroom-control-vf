class memcached {
  package { 'memcached':
  ensure => present,
  before => File['memcached']
  }
  file { 'memcached':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode => '0644',
  path => '/etc/sysconfig/memcached',
  source => 'puppet:///modules/memcached/memcached',
  notify => Service['memcached'],
  }
  service { 'memcached':
  ensure => running,
  enable => true,
  }
}
