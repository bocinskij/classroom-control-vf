class nginx (

)  inherets nginx::params {
  package { 'nginx':
   ensure => present,
  }
  File { 
    ensure => file,
    owner => $owner,
    group => $group,
    mode => '0644',
  }
  file { $docroot:
    ensure => directory,
  }
  file { "${docroot}/index.html":
    source => 'puppet:///modules/nginx/index.html',
  }
  file { 'default.conf':
    path => "${blockdir}/default.conf",
    source => 'puppet:///modules/nginx/default.conf',
  }
  file { 'nginx.conf':
    path => "${confdir}/nginx.conf",
    source => 'puppet:///modules/nginx/nginx.conf',
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => [File['default.conf'],File['nginx.conf']],
  }
  }
