# Create an dnsmasq stub zone for caching upstream name resolvers.
define dnsmasq::cname (
  $target,
) {
  include dnsmasq::params

  $dnsmasq_conffile = $dnsmasq::params::dnsmasq_conffile

  concat::fragment { "dnsmasq-cname-${name}":
    order   => '04',
    target  => $dnsmasq_conffile,
    content => template('dnsmasq/cname.erb'),
  }

}
