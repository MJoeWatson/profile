# == Class: profile::go
#
#
class profile::go (
  $version = latest,
){

  include common::files
  include ::consul

  #Install Golang Package
  package { 'golang':
      ensure  => $version,
  }
  Class['common::files'] ->
  exec { 'install go code':
    environment => ["GOPATH=/root/gocode"],
    command     => 'go install',
    cwd         => '/root/gocode/src/basic/'
  } ->
  exec { 'run go code':
    environment => ["GOPATH=/root/gocode"],
    command     => '/root/gocode/bin/basic &',
  }
}
