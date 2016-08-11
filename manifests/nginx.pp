# == Class: profile::nginx
#
#
class profile::nginx (
  $nginx_hosts   = {},
  $nginx_service = stopped,
  $consul_template_service = stopped
){

  include ::consul

  Class['::consul'] ->
  class { '::nginx':
    service_ensure => $nginx_service,
  } ->
  class { '::consul_template':
    service_ensure => $consul_template_service,
    notify         => Nginx::Service[$name],
  }

  if $nginx_hosts != undef {
    validate_hash($nginx_hosts)
    create_resources(common::host,$nginx_hosts)
  }

}
