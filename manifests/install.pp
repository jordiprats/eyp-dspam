class dspam::install inherits dspam {

  if($dspam::manage_package)
  {
    if($include_epel)
    {
      ::include epel

      Package[$dspam::params::package_name] {
        require => Class['::epel'],
      }
    }

    package { $dspam::params::package_name:
      ensure => $dspam::package_ensure,
    }
  }

}
