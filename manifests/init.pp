class miscfiles {
  case $operatingsystem {
    debian, ubuntu: {
      $motdflavor = $lsbdistdescription
      
      # Apt.conf
      file { "/etc/apt.conf":
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///modules/miscfiles/apt.conf",
      }
    }

    default: {
      $motdflavor = "$operatingsystem $operatingsystemrelease"
    }
  }

  ## MOTD
  file { "/etc/motd":
    ensure => file,
    content => template("miscfiles/motd.erb"),
  }

}
