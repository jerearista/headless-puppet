# == Class: puppet
#
#  Initialisation and configuration class for Puppet.
#  Sets up hourly puppet run and default puppet directories.
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
# include puppet
#
# === Authors
#
# PeteMS
#
class puppet {

  $puppet_logfile = '/var/log/puppet/puppet.log'

  file { '/etc/puppet' :
    ensure  => 'directory',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  cron { 'hourly-puppet-run' :
    ensure  => present,
    user    => 'root',
    hour    => '*/2',
    command => "/bin/echo -e '\\n\\n### HOURLY PUPPET RUN ###\\n' >> /var/log/puppet/cron.log; /bin/echo `date` >> /var/log/puppet/cron.log; /bin/echo -e '\\n\\n';/usr/bin/puppet apply /etc/puppet/manifests/default.pp >> /var/log/puppet/cron.log",
    require => File[$puppet_logfile],
  }

  file { '/var/log/puppet' :
    ensure  => 'directory',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0750',
  }

  file { $puppet_logfile :
    ensure  => 'present',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0640',
    require => [
      File['/var/log/puppet'],
    ],
  }

}
