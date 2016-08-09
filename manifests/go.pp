# == Class: profile::go
#
#
class profile::go (
  $version = latest,
){

  include common::files

  package { 'golang':
      ensure  => $version,
  }

}
