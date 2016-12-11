class dspam::params {

  $package_name = [ 'dspam-client', 'dspam' ]
  $service_name = 'dspam'

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^[5-7].*$/:
        {
          $include_epel=true
          # [root@centos7 ~]# yum search dspam
          # Loaded plugins: fastestmirror
          # Loading mirror speeds from cached hostfile
          #  * base: centos.cadt.com
          #  * epel: mirror.airenetworks.es
          #  * extras: centos.cadt.com
          #  * updates: mirror.airenetworks.es
          # ================================================================ N/S matched: dspam =================================================================
          # dspam-client.x86_64 : The DSPAM client program used to talk to dspam daemon
          # dspam-devel.x86_64 : Development library and header files for libdspam
          # dspam-hash.x86_64 : Hash storage driver for libdspam
          # dspam-libs.x86_64 : The DSPAM library core processing engines
          # dspam-mysql.x86_64 : MySQL storage driver for libdspam
          # dspam-pgsql.x86_64 : PostgreSQL storage driver for libdspam
          # dspam-sqlite3.x86_64 : SQLite v3.x storage driver for libdspam
          # dspam-web.x86_64 : Web-based interface for DSPAM
          # dspam.x86_64 : A library and Mail Delivery Agent for Bayesian SPAM filtering
          #
          #   Name and summary matches only, use "search all" for everything.
          # [root@centos7 ~]#

        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^14.*$/:
            {
              $include_epel=true
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
