# coding: UTF-8
# user/group
default['vlg-zookeeper']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-zookeeper']['group'] = "#{node['vlg-base']['app_user']}"

# package
default['vlg-zookeeper']['version'] = '3.4.6'
default['vlg-zookeeper']['download_url'] = 'http://videologypublic.s3.amazonaws.com/repo/zookeeper-3.4.6.tar.gz'
default['vlg-zookeeper']['install_dir'] = '/usr/local'
default['packages'] = node['packages'] + [ 'openssl-devel' ]

# zookeeper
default['vlg-zookeeper']['data_dir'] = "/data/zookeeper"
default['vlg-zookeeper']['zookeeper_base'] = "/usr/local/zookeeper"
default['vlg-zookeeper']['conf_dir'] = "/usr/local/zookeeper/conf"
default['vlg-zookeeper']['logs_dir'] = "/var/log/zookeeper"
#default['vlg-zookeeper']['id'] = "#{node['hostname'].tr(-d a-z,A-Z,0)}"
default['vlg-zookeeper']['zookeeper_pid'] = "/var/log/zookeeper/zookeeper.pid"

default["zookeeper"]["open_file_limit"] = 32768
default["zookeeper"]["max_processes"] = 1024

default["zookeeper"]["env_vars"]["ZOO_LOG4J_PROP"] = "INFO,ROLLINGFILE"

default["zookeeper"]["servers"] = []
default["zookeeper"]["follower_port"] = 2888
default["zookeeper"]["election_port"] = 3888

default["zookeeper"]["base_directory"] = "/usr/local/zookeeper"

default["zookeeper"]["zoo.cfg"]["clientPort"] = 2181
default["zookeeper"]["zoo.cfg"]["dataDir"] = "/data/zookeeper"
default["zookeeper"]["zoo.cfg"]["dataLogDir"] = "/var/log/zookeeper"
default["zookeeper"]["zoo.cfg"]["tickTime"] = 2000
default["zookeeper"]["zoo.cfg"]["autopurge.purgeInterval"] = 24
default["zookeeper"]["zoo.cfg"]["initLimit"] = 5
default["zookeeper"]["zoo.cfg"]["syncLimit"] = 2
default["zookeeper"]["zoo.cfg"]["maxClientCnxns"] = 256

# Settings from default zookeeper installation
default["zookeeper"]["log4j.properties"]["zookeeper.root.logger"] = "CONSOLE,ROLLINGFILE"
default["zookeeper"]["log4j.properties"]["zookeeper.console.threshold"] = "INFO"
default["zookeeper"]["log4j.properties"]["zookeeper.log.dir"] = "/var/log/zookeeper"
default["zookeeper"]["log4j.properties"]["zookeeper.log.file"] = "zookeeper.log"
default["zookeeper"]["log4j.properties"]["zookeeper.log.threshold"] = "INFO"
default["zookeeper"]["log4j.properties"]["zookeeper.tracelog.file"] = "zookeeper_trace.log"
default["zookeeper"]["log4j.properties"]["log4j.rootLogger"] = "${zookeeper.root.logger}"
default["zookeeper"]["log4j.properties"]["log4j.appender.CONSOLE"] = "org.apache.log4j.ConsoleAppender"
default["zookeeper"]["log4j.properties"]["log4j.appender.CONSOLE.Threshold"] = "${zookeeper.console.threshold}"
default["zookeeper"]["log4j.properties"]["log4j.appender.CONSOLE.layout"] = "org.apache.log4j.PatternLayout"
default["zookeeper"]["log4j.properties"]["log4j.appender.CONSOLE.layout.ConversionPattern"] = "%d{ISO8601} [myid:%X{myid}] - %-5p [%t:%C{1}@%L] - %m%n"
default["zookeeper"]["log4j.properties"]["log4j.appender.ROLLINGFILE"] = "org.apache.log4j.RollingFileAppender"
default["zookeeper"]["log4j.properties"]["log4j.appender.ROLLINGFILE.Threshold"] = "${zookeeper.log.threshold}"
default["zookeeper"]["log4j.properties"]["log4j.appender.ROLLINGFILE.File"] = "${zookeeper.log.dir}/${zookeeper.log.file}"
default["zookeeper"]["log4j.properties"]["log4j.appender.ROLLINGFILE.MaxFileSize"] = "10MB"
default["zookeeper"]["log4j.properties"]["log4j.appender.ROLLINGFILE.MaxBackupIndex"] = "10"
default["zookeeper"]["log4j.properties"]["log4j.appender.ROLLINGFILE.layout"] = "org.apache.log4j.PatternLayout"
default["zookeeper"]["log4j.properties"]["log4j.appender.ROLLINGFILE.layout.ConversionPattern"] = "%d{ISO8601} [myid:%X{myid}] - %-5p [%t:%C{1}@%L] - %m%n"
default["zookeeper"]["log4j.properties"]["log4j.appender.TRACEFILE"] = "org.apache.log4j.FileAppender"
default["zookeeper"]["log4j.properties"]["log4j.appender.TRACEFILE.Threshold"] = "TRACE"
default["zookeeper"]["log4j.properties"]["log4j.appender.TRACEFILE.File"] = "${zookeeper.log.dir}/${zookeeper.tracelog.file}"
default["zookeeper"]["log4j.properties"]["log4j.appender.TRACEFILE.layout"] = "org.apache.log4j.PatternLayout"
default["zookeeper"]["log4j.properties"]["log4j.appender.TRACEFILE.layout.ConversionPattern"] = "%d{ISO8601} [myid:%X{myid}] - %-5p [%t:%C{1}@%L][%x] - %m%n"
