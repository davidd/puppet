#node
notify { "This message gets logged": }

notify { $operatingsystem: }

package { 'vim':
    ensure => latest
}
