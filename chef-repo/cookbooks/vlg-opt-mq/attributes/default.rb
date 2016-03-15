# java
default['vlg-activemq']['jvm_heap'] = '5G'

default['vlg-opt-mq']['conf_dir'] = "/usr/local/activemq/conf"

# Monitor activemq
#
# Assuming you have 2 clusters "test" and "prod",
# one with and one without authentication
# you need to set up the following attributes
# node.datadog.activemq.instances = [
#                                     {
#                                       :host => "localhost",
#                                       :port => "1234",
#                                       :name => "prod",
#                                       :user => "username",
#                                       :password => "secret"
#                                     },
#                                     {
#                                       :host => "localhost",
#                                       :port => "3456",
#                                       :name => "test"
#                                     }
#                                    ]
## Let's try to set this up as the default in the vlg-activemq cookbook
##
###default['datadog']['activemq']['instances'] = [ { "host" => "localhost", "port" => 61616, "name" => "usvaopmqprd01.inf.videologygroup.com" } ]
