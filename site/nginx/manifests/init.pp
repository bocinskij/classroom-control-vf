class nginx {
package { 'nginx':
ensure => present,
}
file { 'default.conf':
ensure => file,
owner => 'root',
group => 'root',
mode => '0644',
source => 'puppet:///modules/nginx/default.conf',
}
file { 'nginx.conf':
ensure => file,
owner => 'root',
group => 'root',
mode => '0644',
source => 'puppet:///modules/nginx/nginx.conf',
}
service { 'nginx':
ensure => running,
enable => true,
# subscribe => File['/
}
}
