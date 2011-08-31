
class users::core {

  notify { 'zxc3':
    message => "users-core", 
  }

  user { 'davidd':
    ensure     => 'present',
    home       => '/home/davidd',
    managehome => true,
    shell      => '/bin/bash',
  }

  file { 'davidd_vimrc':
    ensure => 'present',
    path => '/home/davidd/.vimrc',
    source => 'puppet:///modules/users/davidd_vimrc',
    owner => 'davidd',
    group => 'davidd',
    mode => '0644',
  }

}
