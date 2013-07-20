class miscfiles {
  ## MOTD
  file { "/etc/motd":
    ensure => file,
    content => template("miscfiles/motd.erb"),
  }

  case $operatingsystem {
    debian, ubuntu: {
      # Apt.conf
      file { "/etc/apt.conf":
        ensure  => file,
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///modules/miscfiles/apt.conf",
      }
    }
  }
}
