
class base::python {

  notify {'zxc_python':
    message => 'python zxc',
  }  

  package { 'python': ensure => 'latest' }
  
}

