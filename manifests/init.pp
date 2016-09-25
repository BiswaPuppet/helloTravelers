# Class: helloTravelers
# ===========================
class hellotravelers {
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
