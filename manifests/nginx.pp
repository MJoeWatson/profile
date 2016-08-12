# == Class: profile::nginx
#
#
class profile::nginx (
){

  include ::consul
  include ::consul_template
  include ::nginx
  include ::common
  Class['::common'] -> Class['::nginx']

  $nginx_hosts = hiera_hash('nginx_hosts', {})
  if $nginx_hosts != undef {
    validate_hash($nginx_hosts)
    create_resources(common::host,$nginx_hosts)
  }

  $consul_template_watches = hiera_hash('consul_templates::watches')

  if $consul_template_watches {
    create_resources('consul_template::watch', $consul_template_watches)
  }

}
