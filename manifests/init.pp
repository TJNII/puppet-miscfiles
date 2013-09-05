class miscfiles {
  case $operatingsystem {
    debian, ubuntu: {
      $motdflavor = $lsbdistdescription
    }

    default: {
      $motdflavor = "$operatingsystem/$operatingsystemrelease"
    }
  }

  ## MOTD
  file { "/etc/motd":
    ensure => file,
    content => template("miscfiles/motd.erb"),
  }

}
