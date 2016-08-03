class memcached {
  package { 'memcached':
  
  }
  file { '/etc/sysconfig/memcached':
  source => 'puppet:///site/memcached/memcached',
  }
  service { 'memcached':
  
  }
}
