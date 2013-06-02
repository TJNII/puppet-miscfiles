class miscfiles {
  ## MOTD
  file { "/etc/motd":
    ensure => file,
    content => template("miscfiles/motd.erb"),
  }
}
