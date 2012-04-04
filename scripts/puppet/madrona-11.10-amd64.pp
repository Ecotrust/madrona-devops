Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to your madrona virtual machine!\n"
}

# ### install the packages
package { "git-core":
    ensure => "latest"
}

package { "subversion":
    ensure => "latest"
}

package { "mercurial":
    ensure => "latest"
}

package { "csstidy":
    ensure => "latest"
}

package { "python-gdal":
    ensure => "latest"
}

package { "python-mapnik":
    ensure => "latest"
}

package { "python-imaging":
    ensure => "latest"
}

package { "python-numpy":
    ensure => "latest"
}

package { "python-psycopg2":
    ensure => "latest"
}

# libblas-dev
# libatlas-dev
# liblapack-dev

### database config

class { "postgresql::server": version => "9.1",
    listen_addresses => 'localhost',
    max_connections => 100,
    shared_buffers => '24MB',
}

postgresql::database { "lot":
  owner => "vagrant",
}

### install the app
class { "webapp::python": owner => "vagrant",
  group => "vagrant",
  src_root => "/vagrant",
  monit_admin => "eknuth@ecotrust.org",

}
webapp::python::instance { "lot":
  domain => "lot.ecotrust.org",
  django => true,
  requirements => "../requirements.txt",
}
