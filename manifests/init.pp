# Class: quagga 
#
# This class installs quagga daemon
#
# Parameters:
#
# Actions:
# - Install quagga
# - Manage quagga services
#
# Requires:
#
# Sample usage:
# - include quagga
#
class quagga {
	include quagga::params
	package { 'quagga':
		name		=> $quagga::params::quagga_name,
		ensure		=> installed,
	}
	service { 'quagga':
		name		=> $quagga::params::quagga_name,
		ensure		=> running,
		enable		=> true,
		subscribe	=> Package['quagga'],
	}

	if defined(${quagga_daemons_conf}) {
		file { 'quagga_daemons_conf':
			name	=> ${quagga::params::quagga_daemons_conf},
			content	=> template(quagga_daemons.conf.erb),
			owner 	=> root,
			group 	=> root,
			mode	=> 644,
		}
	}
	if defined(${quagga_zebra_conf}) {
		file { 'quagga_zebra_conf':
			name	=> ${quagga::params::quagga_zebra_conf},
			content	=> template(quagga_zebra.conf.erb),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if defined(${quagga_debian_conf}) {
		file {'quagga_debian_conf':
			name	=> ${quagga:params::quagga_debian_conf},
			content	=> template(quagga_debian.conf.erb),
			owner 	=> root,
			group	=> root,
			mode	=> 644,
		}
	}
	if (${quagga::params::vtysh} = 'yes') {
		file { 'quagga_vtysh_conf':
			name	=> ${quagga::params::quagga_vtysh_conf},
			content	=> template(quagga_vtysh.conf.erb),
			owner	=> ${quagga::params::user},
			group	=> ${quagga::params::group},
			mode	=> 660,
		}
	}
	if (${quagga::params::bgpd} = 'yes') {
		file { 'quagga_bgpd_conf':
			name	=> ${quagga::params::quagga_bgpd_conf},
			content	=> template(quagga_bgpd.conf.erb),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if (${quagga::params::ospfd} = 'yes') {
		file { 'quagga_ospfd_conf':
			name	=> ${quagga::params::quagga_ospfd_conf},
			content	=> template(quagga_ospfd.conf.erb),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if (${quagga::params::ospf6d} = 'yes') {
		file { 'quagga_ospf6d_conf':
			name	=> ${quagga::params::quagga_ospf6d_conf},
			content	=> template(quagga_ospf6d.conf.erb),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if (${quagga::params::ripd}) {
		file { 'quagga_ripd_conf':
			name	=> ${quagga::params::quagga_ripd_conf},
			content	=> template(quagga_ripd.conf.erb),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if (${quagga::params::ripngd} = 'yes') {
		file { 'quagga_ripngd_conf':
			name	=> ${quagga::params::quagga_ripngd_conf},
			content	=> template(quagga_ripngd.conf.erb),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
	if (${quagga::params::isisd} = 'yes') {
		file { 'quagga_isisd_conf':
			name	=> ${quagga::params::quagga_isisd_conf},
			content	=> template(quagga_isisd.conf.erb),
			owner	=> ${quagga::params::owner},
			group	=> ${quagga::params::group},
			mode	=> 640,
		}
	}
}
