class ganglia::params (
  $ensure                   = 'installed',
  $cluster                  = 'unspecified',
  $multicast_address        = '239.2.11.71',
  $owner                    = 'unspecified',
  $send_metadata_interval   = '5',
  $udp_port                 = '8649',
  $unicast_listen_port      = '8649',
  $unicast_targets          = [],
  $user                     = 'ganglia',
  $network_mode             = 'unicast',
  $gmetaduser               = 'nobody',
  $rungmetad                = false,  
  $gridname                 = ""
)
{
  
}
