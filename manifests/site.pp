notify { 'site_msg1':
  message => 'manifests/site.pp',
}

Exec { path => '/usr/bin:/usr/sbin:/bin:/sbin' }

import 'nodes'
