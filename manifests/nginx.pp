# == Class: profile::nginx
#
#
class profile::nginx (
  $nginx_hosts = {},
){
    include ::nginx

    if $nginx_hosts != undef {
      validate_hash($nginx_hosts)
      create_resources(common::host,$nginx_hosts)
    }

}
