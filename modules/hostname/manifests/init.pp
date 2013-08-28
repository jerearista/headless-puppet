# == Class: hostname
#
#  Sets hostname
#
# === Parameters
#
#
#
# === Variables
#
#
# === Examples
#
# class { 'hostname': hostname  => 'foo'}
#
# === Authors
#
# PeteMS
#
class hostname ($hostname='default') {

  file { '/etc/hostname':
    ensure  => present,
    content => $hostname,
  }

  exec { "set-host-name":
    command => "/bin/hostname $hostname || /usr/bin/test `hostname` -ne $hostname",
  }

}


