class dspam::service inherits dspam {

  #
  validate_bool($dspam::manage_docker_service)
  validate_bool($dspam::manage_service)
  validate_bool($dspam::service_enable)

  validate_re($dspam::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${dspam::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $dspam::manage_docker_service)
  {
    if($dspam::manage_service)
    {
      service { $dspam::params::service_name:
        ensure => $dspam::service_ensure,
        enable => $dspam::service_enable,
      }
    }
  }
}
