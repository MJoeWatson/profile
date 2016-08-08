# == Class: profile::go
#
#
class profile::go (
  $version = latest,
){

  package { 'golang':
      ensure  => $version,
  }

}
