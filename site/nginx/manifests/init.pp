class nginx {
  package { 'nginx':
   ensure => present,
  }
  file { '/var/www/':
    ensure => directory,
    owner => 'root',
    group => 'root',
  }
  file { '/var/www/index.html':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/index.html',
  }
  file { 'default.conf':
    path => '/etc/nginx/conf.d/default.conf',
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/default.conf',
  }
  file { 'nginx.conf':
    path => '/etc/nginx/nginx.conf',
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/nginx/nginx.conf',
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => [File['default.conf'],File['nginx.conf']],
  }
}
