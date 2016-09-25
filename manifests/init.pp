# Class: helloTravelers
# ===========================
#
# Full description of class helloTravelers here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class helloTravelers {
  $required_packages = ["git"]
  
  package { $required_packages :
    ensure => "installed",
  }

  require java
  
  class { 'ant' :
     version => '1.9.3',
  } ->
  tomcat::install {'/opt/tomcat' :
    source_url => 'http://mirror.fibergrid.in/apache/tomcat/tomcat-8/v8.0.37/bin/apache-tomcat-8.0.37.tar.gz'
  }->
  tomcat::instance { 'default':
    catalina_home => '/opt/tomcat',
  }
}
