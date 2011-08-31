class vim::core {
  package { 'vim': ensure => 'latest' }
  notify { 'zxc':
    message => 'zxc',
  }
}
