#node
#notify { 'msg':
#  message => "This message gets logged",
#}
#
#notify { $operatingsystem: }
#
#package { 'vim':
#  ensure => latest
#}
#
#file { '/home/davidd2/z123':
#  require => User['davidd2'],
#  ensure  => 'present',
#}
#
#user { 'davidd':
#  ensure => 'present',
#  home   => '/home/davidd',
#  shell  => '/bin/bash',
#}
#
#user { 'davidd2':
#  ensure     => 'present',
#  home       => '/home/davidd2',
#  managehome => true,
#  shell      => '/bin/bash',
#}
#
#
#node base {
#  require => User['davidd2'],
#
#}

#node default {
#}
#
#node base {
#  require vim::core
#}
#
#node n2 inherits base {
#}

#require utils
#require vim::core
#require users::core

#notify { 'nodes_msg1':
#  require => Notify['site_msg1'],
#  message => 'manifests/nodes.pp',
#}

node base {
  # This is my littel scheme to enable you to go 
  # puppet apply /etc/puppet/modules/nodes/manifests/base.pp -v --test
  require utils
  require vim::core
  require users::core
}

node puppetclient, puppetmaster inherits base {
#node puppetclient {
  #require => Notify['nodes_msg1'],
  notify { 'zxc3':
    message => 'zxc puppetclient / master',
  }
  #notify { 'zxc3xx':
  #  message => 'zxc puppetclient',
  #}
  #require utils
  #import 'basex'
}

node zz inherits base {
#  #require => Notify['nodes_msg1'],
  notify { 'zz':
    message => 'zz',
  }

#  
#  notify { 'zz23':
#    message => 'zz2',
#  }
#  
#  file { '/home/davidd/z123x':
#    #require => User['davidd'],
#    ensure  => 'present',
#  }
}
