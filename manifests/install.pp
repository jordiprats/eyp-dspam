class dspam::install inherits dspam {

  if($dspam::manage_package)
  {
    package { $dspam::params::package_name:
      ensure => $dspam::package_ensure,
    }
  }

}
