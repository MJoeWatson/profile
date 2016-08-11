# == Class: profile::nginx
#
#
class profile::nginx (
  $nginx_hosts   = {},
){

  include ::consul
  include ::consul_template
  include ::nginx

  if $nginx_hosts != undef {
    validate_hash($nginx_hosts)
    create_resources(common::host,$nginx_hosts)
  }

  $consul_template_watches = hiera_hash('consul_templates::watches')

  if $consul_template_watches {
    create_resources('consul_template::watch', $consul_template_watches)
  }

}
