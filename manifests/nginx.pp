# == Class: profile::nginx
#
#
class profile::nginx (
){

  include ::consul
  include ::consul_template
  include ::nginx
  include ::common
  Class['::common'] -> Class['::nginx'] -> Class['::consul_template']

  $nginx_hosts = hiera_hash('nginx_hosts', {})
  if $nginx_hosts != undef {
    validate_hash($nginx_hosts)
    create_resources(common::host,$nginx_hosts)
  }

}
