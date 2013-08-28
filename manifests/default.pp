# == Class: default
#
#  Defines the default node
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
# include default
#
# === Authors
#
# PeteMS
#
node default {

  class { 'hostname': hostname  => 'default'}

  class { 'cron': }

  class { 'puppet': }

}



