case $::os['family'] {
    'redhat', 'debian' : {
      $owner    = 'root'
      $group    = 'root'
      $package  = 'nginx'
      $docroot  = '/var/www'
      $confdir  = '/etc/nginx'
      $blockdir = "${confdir}/conf.d"
      $logdir   = '/var/log/nginx'
    }
    'windows' : {
      $owner    = 'Administrator'
      $group    = 'Administrators'
      $package  = 'nginx'
      $docroot  = 'C:/ProgramData/nginx/html'
      $confdir  = 'C:/ProgramData/nginx'
      $blockdir = "${confdir}/conf.d"
      $logdir   = "${confdir}/nginx"
    }
    default : {
    fail("Module ${module_name} is not supported on ${::os['family']}")
    }
  }
  $user = $::os['family'] ? {
  'redhat' => 'nginx',
  'debian' => 'nobody',
  'windows' => 'nobody',
  default => 'nobody',
  }
