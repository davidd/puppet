
class users::core {

  notify { 'users_core_msg1':
    message => "modules/users/manifests/core.pp", 
  }

  user { 'davidd':
    ensure     => 'present',
    home       => '/home/davidd',
    managehome => true,
    shell      => '/bin/bash',
  }

  file { 'davidd_vimrc':
    ensure => 'present',
    path   => '/home/davidd/.vimrc',
    source => 'puppet:///modules/users/davidd_vimrc',
    owner  => 'davidd',
    group  => 'davidd',
    mode   => '0644',
  }

  file { '/home/davidd/.vim':
    ensure => 'directory',
    owner  => 'davidd',
    group  => 'davidd',
    mode   => 0644,
  }

  exec { 'davidd download bufexplorer.zip':
    command => 'wget http://www.vim.org/scripts/download_script.php?src_id=14208 -O /home/davidd/.vim/bufexplorer.zip',
    creates => '/home/davidd/.vim/bufexplorer.zip',
    user    => 'davidd',
    group   => 'davidd',
    require => File['/home/davidd/.vim'],
  }

  exec { 'davidd unzip bufexplorer.zip':
    command  => 'unzip /home/davidd/.vim/bufexplorer.zip -d /home/davidd/.vim',
    creates  => '/home/davidd/.vim/plugin/bufexplorer.vim',
    user     => 'davidd',
    group    => 'davidd',
    require  => [Package['unzip'],Exec['davidd download bufexplorer.zip']],
  }

}
