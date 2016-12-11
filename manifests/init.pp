class dspam(
                            $manage_package        = true,
                            $package_ensure        = 'installed',
                            $manage_service        = true,
                            $manage_docker_service = true,
                            $service_ensure        = 'running',
                            $service_enable        = true,
                            $backend               = 'mysql',
                          ) inherits dspam::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  validate_re($backend, [ '^hash$', '^mysql$', '^pgsql$', '^sqlite3$' ], "${backend} is not a supported backend: hash/mysql/pgsql/sqlite3")

  class { '::dspam::install': } ->
  class { '::dspam::config': } ~>
  class { '::dspam::service': } ->
  Class['::dspam']

}
