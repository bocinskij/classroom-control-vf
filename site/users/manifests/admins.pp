class users::admins {
  
  users::managed_user { 'jose': }
  users::managed_user { 'alice':
    group => 'superusers',
  }
  users::managed_user { 'chen': }
  
  group { 'superusers':
    ensure => present,
  }
  
}
