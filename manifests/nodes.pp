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

require sudo
require utils
require vim::core
require users::core

notify { 'msg':
  require => Notify['site_msg1'],
  message => "This message gets logged",
}
