# user/group
default['vlg-tomcat']['user'] = "#{node['vlg-base']['app_user']}"
default['vlg-tomcat']['group'] = "#{node['vlg-base']['app_user']}"

# package
default['vlg-tomcat']['version'] = '7.0.56'
default['vlg-tomcat']['download_url'] = 'http://s3.amazonaws.com/videologypublic/repo/apache-tomcat-7.0.56.tar.gz'
default['vlg-tomcat']['install_dir'] = '/usr/local'
default['packages'] = node['packages'] + [ 'openssl-devel' ]

# catalina
default['vlg-tomcat']['catalina_home'] = "#{node['vlg-tomcat']['install_dir']}/tomcat"
default['vlg-tomcat']['catalina_base'] = "#{node['vlg-base']['app_user_home']}/tomcat"
default['vlg-tomcat']['catalina_pid'] = "#{node['vlg-tomcat']['catalina_base']}/logs/catalina.pid"
default['vlg-tomcat']['lib_dir'] = "#{node['vlg-tomcat']['catalina_home']}/lib"
default['vlg-tomcat']['conf_dir'] = "#{node['vlg-tomcat']['catalina_base']}/conf"
default['vlg-tomcat']['logs_dir'] = "#{node['vlg-tomcat']['catalina_base']}/logs"
default['vlg-tomcat']['temp_dir'] = "#{node['vlg-tomcat']['catalina_base']}/temp"
default['vlg-tomcat']['webapps_dir'] = "#{node['vlg-tomcat']['catalina_base']}/webapps"
default['vlg-tomcat']['work_dir'] = "#{node['vlg-tomcat']['catalina_base']}/work"
default['vlg-tomcat']['bin_dir'] = "#{node['vlg-tomcat']['catalina_base']}/bin"

# java
default["vlg-tomcat"]["jvm_heap"] = "128m"
default["vlg-tomcat"]["jvm_max_perm_size"] = "32m"
default["vlg-tomcat"]["jvm_thread_stack"] = "256k"
default['vlg-tomcat']['java_opts'] = '-d64 -server -Djava.awt.headless=true'
default['vlg-tomcat']['jvm_gc_log'] = "#{node['vlg-tomcat']['logs_dir']}/gc.log"
default['vlg-tomcat']['jvm_gc_algorithm'] = "UseConcMarkSweepGC"

# setenv.sh
default['vlg-tomcat']['app_deployment'] = "standard"
default['vlg-tomcat']['timezone'] = "US/Eastern"

# server.xml
default['vlg-tomcat']['shutdown_port'] = '8005'
default['vlg-tomcat']['max_threads'] = '100'
default['vlg-tomcat']['min_spare_threads'] = '10'
default['vlg-tomcat']['doc_base'] = 'ROOT.war'
default['vlg-tomcat']['connection_timeout'] = '5000'
default['vlg-tomcat']['enable_lookups'] = 'false'
default['vlg-tomcat']['max_http_header_size'] = '65534'
default['vlg-tomcat']['executor'] = 'tomcatThreadPool'
default['vlg-tomcat']['accept_count'] = '64'
default['vlg-tomcat']['max_keep_alive_requests'] = '1'
default['vlg-tomcat']['keep_alive_timeout'] = '1'

# server.xml: port 8080
default['vlg-tomcat']['port_8080']['enable'] = 'true'
default['vlg-tomcat']['port_8080']['protocol'] = 'org.apache.coyote.http11.Http11Protocol'

# server.xml: port 9030
default['vlg-tomcat']['port_9030']['enable'] = 'false'
default['vlg-tomcat']['port_9030']['protocol'] = 'org.apache.coyote.http11.Http11Protocol'

# server.xml: port 8443
default['vlg-tomcat']['port_8443']['enable'] = 'false'
default['vlg-tomcat']['port_8443']['protocol'] = 'org.apache.coyote.http11.Http11Protocol'
default['vlg-tomcat']['port_8443']['scheme'] = 'https'
default['vlg-tomcat']['port_8443']['secure'] = 'true'
default['vlg-tomcat']['port_8443']['ssl_protocol'] = 'TLS'
default['vlg-tomcat']['port_8443']['ssl_enabled'] = 'true'
default['vlg-tomcat']['port_8443']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.videologygroup.com.crt'
default['vlg-tomcat']['port_8443']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.videologygroup.com.key'
default['vlg-tomcat']['port_8443']['ssl_ca_certificate_file'] = '/etc/pki/CA/certs/godaddy_bundle.crt'

# server.xml: port 8444
default['vlg-tomcat']['port_8444']['enable'] = 'false'
default['vlg-tomcat']['port_8444']['protocol'] = 'org.apache.coyote.http11.Http11Protocol'
default['vlg-tomcat']['port_8444']['scheme'] = 'https'
default['vlg-tomcat']['port_8444']['secure'] = 'true'
default['vlg-tomcat']['port_8444']['ssl_protocol'] = 'TLS'
default['vlg-tomcat']['port_8444']['ssl_enabled'] = 'true'
default['vlg-tomcat']['port_8444']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.videologygroup.com.crt'
default['vlg-tomcat']['port_8444']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.videologygroup.com.key'
default['vlg-tomcat']['port_8444']['ssl_ca_certificate_file'] = '/etc/pki/CA/certs/godaddy_bundle.crt'

# server.xml: port 8445
default['vlg-tomcat']['port_8445']['enable'] = 'false'
default['vlg-tomcat']['port_8445']['protocol'] = 'org.apache.coyote.http11.Http11Protocol'
default['vlg-tomcat']['port_8445']['scheme'] = 'https'
default['vlg-tomcat']['port_8445']['secure'] = 'true'
default['vlg-tomcat']['port_8445']['ssl_protocol'] = 'TLS'
default['vlg-tomcat']['port_8445']['ssl_enabled'] = 'true'
default['vlg-tomcat']['port_8445']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.videologygroup.com.crt'
default['vlg-tomcat']['port_8445']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.videologygroup.com.key'
default['vlg-tomcat']['port_8445']['ssl_ca_certificate_file'] = '/etc/pki/CA/certs/godaddy_bundle.crt'

# server.xml: port 8447
default['vlg-tomcat']['port_8447']['enable'] = 'false'
default['vlg-tomcat']['port_8447']['protocol'] = 'org.apache.coyote.http11.Http11Protocol'
default['vlg-tomcat']['port_8447']['scheme'] = 'https'
default['vlg-tomcat']['port_8447']['secure'] = 'true'
default['vlg-tomcat']['port_8447']['ssl_protocol'] = 'TLS'
default['vlg-tomcat']['port_8447']['ssl_enabled'] = 'true'
default['vlg-tomcat']['port_8447']['ssl_certificate_file'] = '/etc/pki/tls/certs/star.lucidmedia.com.crt'
default['vlg-tomcat']['port_8447']['ssl_certificate_key_file'] = '/etc/pki/tls/private/star.lucidmedia.com.key'
default['vlg-tomcat']['port_8447']['ssl_ca_certificate_file'] = '/etc/pki/CA/certs/godaddy_bundle.crt'

# sudo
default['vlg-base']['sudoers']['app_user'] = node['vlg-base']['sudoers']['app_user'] + [ '/etc/init.d/tomcat stop', '/etc/init.d/tomcat force-stop', '/etc/init.d/tomcat start' ]
