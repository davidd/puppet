
# Install various basic utilities

class utils {
  
  notify { 'utils_msg1':
    message => 'modules/utils/manifests/init.pp',
  }

  package { 'unzip': ensure => 'latest' }
  package { 'wget': ensure => 'latest' }
  package { 'screen': ensure => 'latest' }

}

