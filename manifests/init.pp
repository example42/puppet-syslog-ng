# = Class: syslog-ng
#
# This is the main syslog-ng class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, syslog-ng class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $syslog-ng_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, syslog-ng main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $syslog-ng_source
#
# [*source_dir*]
#   If defined, the whole syslog-ng configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $syslog-ng_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $syslog-ng_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, syslog-ng main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $syslog-ng_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $syslog-ng_options
#
# [*service_autorestart*]
#   Automatically restarts the syslog-ng service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $syslog-ng_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $syslog-ng_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $syslog-ng_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $syslog-ng_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for syslog-ng checks
#   Can be defined also by the (top scope) variables $syslog-ng_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $syslog-ng_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $syslog-ng_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $syslog-ng_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $syslog-ng_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for syslog-ng port(s)
#   Can be defined also by the (top scope) variables $syslog-ng_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling syslog-ng. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $syslog-ng_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $syslog-ng_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $syslog-ng_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $syslog-ng_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in syslog-ng::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of syslog-ng package
#
# [*service*]
#   The name of syslog-ng service
#
# [*service_status*]
#   If the syslog-ng service init script supports status argument
#
# [*process*]
#   The name of syslog-ng process
#
# [*process_args*]
#   The name of syslog-ng arguments. Used by puppi and monitor.
#   Used only in case the syslog-ng process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user syslog-ng runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $syslog-ng_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $syslog-ng_protocol
#
#
# See README for usage patterns.
#
class syslog-ng (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits syslog-ng::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $syslog-ng::bool_absent ? {
    true  => 'absent',
    false => $syslog-ng::version,
  }

  $manage_service_enable = $syslog-ng::bool_disableboot ? {
    true    => false,
    default => $syslog-ng::bool_disable ? {
      true    => false,
      default => $syslog-ng::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $syslog-ng::bool_disable ? {
    true    => 'stopped',
    default =>  $syslog-ng::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $syslog-ng::bool_service_autorestart ? {
    true    => Service[syslog-ng],
    false   => undef,
  }

  $manage_file = $syslog-ng::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $syslog-ng::bool_absent == true
  or $syslog-ng::bool_disable == true
  or $syslog-ng::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $syslog-ng::bool_absent == true
  or $syslog-ng::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $syslog-ng::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $syslog-ng::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $syslog-ng::source ? {
    ''        => undef,
    default   => $syslog-ng::source,
  }

  $manage_file_content = $syslog-ng::template ? {
    ''        => undef,
    default   => template($syslog-ng::template),
  }

  ### Managed resources
  package { $syslog-ng::package:
    ensure  => $syslog-ng::manage_package,
    noop    => $syslog-ng::bool_noops,
  }

  service { 'syslog-ng':
    ensure     => $syslog-ng::manage_service_ensure,
    name       => $syslog-ng::service,
    enable     => $syslog-ng::manage_service_enable,
    hasstatus  => $syslog-ng::service_status,
    pattern    => $syslog-ng::process,
    require    => Package[$syslog-ng::package],
    noop       => $syslog-ng::bool_noops,
  }

  file { 'syslog-ng.conf':
    ensure  => $syslog-ng::manage_file,
    path    => $syslog-ng::config_file,
    mode    => $syslog-ng::config_file_mode,
    owner   => $syslog-ng::config_file_owner,
    group   => $syslog-ng::config_file_group,
    require => Package[$syslog-ng::package],
    notify  => $syslog-ng::manage_service_autorestart,
    source  => $syslog-ng::manage_file_source,
    content => $syslog-ng::manage_file_content,
    replace => $syslog-ng::manage_file_replace,
    audit   => $syslog-ng::manage_audit,
    noop    => $syslog-ng::bool_noops,
  }

  # The whole syslog-ng configuration directory can be recursively overriden
  if $syslog-ng::source_dir {
    file { 'syslog-ng.dir':
      ensure  => directory,
      path    => $syslog-ng::config_dir,
      require => Package[$syslog-ng::package],
      notify  => $syslog-ng::manage_service_autorestart,
      source  => $syslog-ng::source_dir,
      recurse => true,
      purge   => $syslog-ng::bool_source_dir_purge,
      force   => $syslog-ng::bool_source_dir_purge,
      replace => $syslog-ng::manage_file_replace,
      audit   => $syslog-ng::manage_audit,
      noop    => $syslog-ng::bool_noops,
    }
  }


  ### Include custom class if $my_class is set
  if $syslog-ng::my_class {
    include $syslog-ng::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $syslog-ng::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'syslog-ng':
      ensure    => $syslog-ng::manage_file,
      variables => $classvars,
      helper    => $syslog-ng::puppi_helper,
      noop      => $syslog-ng::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $syslog-ng::bool_monitor == true {
    if $syslog-ng::port != '' {
      monitor::port { "syslog-ng_${syslog-ng::protocol}_${syslog-ng::port}":
        protocol => $syslog-ng::protocol,
        port     => $syslog-ng::port,
        target   => $syslog-ng::monitor_target,
        tool     => $syslog-ng::monitor_tool,
        enable   => $syslog-ng::manage_monitor,
        noop     => $syslog-ng::bool_noops,
      }
    }
    if $syslog-ng::service != '' {
      monitor::process { 'syslog-ng_process':
        process  => $syslog-ng::process,
        service  => $syslog-ng::service,
        pidfile  => $syslog-ng::pid_file,
        user     => $syslog-ng::process_user,
        argument => $syslog-ng::process_args,
        tool     => $syslog-ng::monitor_tool,
        enable   => $syslog-ng::manage_monitor,
        noop     => $syslog-ng::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $syslog-ng::bool_firewall == true and $syslog-ng::port != '' {
    firewall { "syslog-ng_${syslog-ng::protocol}_${syslog-ng::port}":
      source      => $syslog-ng::firewall_src,
      destination => $syslog-ng::firewall_dst,
      protocol    => $syslog-ng::protocol,
      port        => $syslog-ng::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $syslog-ng::firewall_tool,
      enable      => $syslog-ng::manage_firewall,
      noop        => $syslog-ng::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $syslog-ng::bool_debug == true {
    file { 'debug_syslog-ng':
      ensure  => $syslog-ng::manage_file,
      path    => "${settings::vardir}/debug-syslog-ng",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $syslog-ng::bool_noops,
    }
  }

}
