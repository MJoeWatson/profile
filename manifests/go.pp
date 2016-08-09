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
  Class['common::files'] ->
  exec { 'install go code':
    command => '( cd $HOME/gocode/src/basic/ && go install)',
  } ->
  exec { 'run go code':
    command => '$HOME/gocode/src/basic/basic',
  }

}
