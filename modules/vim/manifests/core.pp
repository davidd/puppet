
class vim::core {

  notify { 'vim_msg1':
    message => 'modules/vim/manifests/core.pp',
  }

  package { 'vim': ensure => 'latest' }
  
}

