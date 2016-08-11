# == Class: profile::nginx
#
#
class profile::nginx (
  $nginx_hosts   = {},
  $nginx_service = running,
){

  include ::consul
  include ::consul_template

  Class['::consul'] ->
  Class['::consul_template'] ->
  class { '::nginx':
    service_ensure => $nginx_service,
  }

  if $nginx_hosts != undef {
    validate_hash($nginx_hosts)
    create_resources(common::host,$nginx_hosts)
  }

}
