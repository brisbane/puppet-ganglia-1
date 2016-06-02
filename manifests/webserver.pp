# Class: ganglia::webserver
#
# This class installs the ganglia web server
#
# Parameters:
#
# Actions:
#   installs the ganglia web server
#
# Sample Usage:
#   include ganglia::server
#
class ganglia::webserver {

  $ganglia_webserver_pkg = $::osfamily ? {
    Debian => 'ganglia-webfrontend',
    RedHat => 'ganglia-web',
    default => fail("Module ${module_name} is not supported on
${::operatingsystem}")
  }

  package {$ganglia_webserver_pkg:
    ensure => present,
    alias  => 'ganglia_webserver',
  }

  $gangliaconffile = $::osfamily ? {
    Debian => '/etc/apache2/sites-enabled/ganglia',
    RedHat => '/etc/httpd/conf.d/ganglia.conf'
  }
 
  if $::osfamily == Debian { 
  file {"/etc/apache2/sites-enabled/ganglia":
    ensure  => link,
    target  => '/etc/apache2/sites-available/ganglia',
    require => File['/etc/apache2/sites-available/ganglia'],
  }
  }
  if $::osfamily == Redhat {
  file {"/usr/share/ganglia-webfrontend":
    ensure  => link,
    target  => '/usr/share/ganglia',
    require => Package[$ganglia_webserver_pkg],
  }
  }

  file {"$gangliaconffile":
    ensure  => present,
    require => Package['ganglia_webserver'],
    content => template('ganglia/ganglia');
  }
}
