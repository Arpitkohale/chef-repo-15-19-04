case node.chef_environment
  when "production"
    case node['vlg-base']['location']
      when "usva"
        default['vlg-storm']['zookeeper_quorum'] = true
        default['vlg-storm']['zookeeper']['server']['1'] = 'usvalzkzprd01.inf.videologygroup.com'
        default['vlg-storm']['zookeeper']['server']['2'] = 'usvalzkzprd02.inf.videologygroup.com'
        default['vlg-storm']['zookeeper']['server']['3'] = 'usvalzkzprd03.inf.videologygroup.com'
        default['vlg-storm']['aws_datacenter'] = 'datacenter.aws.dmp.us.virginia'
        default['vlg-storm']['nimbus']['server'] = 'usvalzsmprd01.inf.videologygroup.com'
      when "usor"
        default['vlg-storm']['zookeeper_quorum'] = true
        default['vlg-storm']['zookeeper']['server']['1'] = 'usorlzzkprd01.inf.videologygroup.com'
        default['vlg-storm']['zookeeper']['server']['2'] = 'usorlzzkprd02.inf.videologygroup.com'
        default['vlg-storm']['zookeeper']['server']['3'] = 'usorlzzkprd03.inf.videologygroup.com'
        default['vlg-storm']['aws_datacenter'] = 'datacenter.aws.dmp.us.oregon'
        default['vlg-storm']['nimbus']['server'] = 'usorlzsmprd01.inf.videologygroup.com'
      when "euir"
        default['vlg-storm']['zookeeper_quorum'] = true
        default['vlg-storm']['zookeeper']['server']['1'] = 'euirlzzkprd01.inf.videologygroup.com'
        default['vlg-storm']['zookeeper']['server']['2'] = 'euirlzzkprd02.inf.videologygroup.com'
        default['vlg-storm']['zookeeper']['server']['3'] = 'euirlzzkprd03.inf.videologygroup.com'
        default['vlg-storm']['aws_datacenter'] = 'datacenter.aws.dmp.eu.ireland'
        default['vlg-storm']['nimbus']['server'] = 'euirlzsmprd01.inf.videologygroup.com'
      when "apsg"
        default['vlg-storm']['zookeeper_quorum'] = true
        default['vlg-storm']['zookeeper']['server']['1'] = 'apsglzzkprd01.inf.videologygroup.com'
        default['vlg-storm']['zookeeper']['server']['2'] = 'apsglzzkprd02.inf.videologygroup.com'
        default['vlg-storm']['zookeeper']['server']['3'] = 'apsglzzkprd03.inf.videologygroup.com'
        default['vlg-storm']['aws_datacenter'] = 'datacenter.aws.dmp.ap.singapore'
        default['vlg-storm']['nimbus']['server'] = 'apsglzsmprd01.inf.videologygroup.com'
    end
  when "staging"
    default['vlg-storm']['zookeeper_quorum'] = true
    default['vlg-storm']['zookeeper']['server']['1'] = 'usvalzzkstg01.inf.videologygroup.com' 
    default['vlg-storm']['zookeeper']['server']['2'] = 'usvalzzkstg02.inf.videologygroup.com'
    default['vlg-storm']['zookeeper']['server']['3'] = 'usvalzzkstg03.inf.videologygroup.com'
    default['vlg-storm']['aws_datacenter'] = 'datacenter.aws.dmp.staging'
    default['vlg-storm']['nimbus']['server'] = 'usvalzsmstg01.inf.videologygroup.com'
  when "sandbox"
    default['vlg-storm']['zookeeper_quorum'] = true
    default['vlg-storm']['zookeeper']['server']['1'] = 'usvalzkzsbx01.inf.videologygroup.com'
    default['vlg-storm']['zookeeper']['server']['2'] = 'usvalzkzsbx02.inf.videologygroup.com'
    default['vlg-storm']['zookeeper']['server']['3'] = 'usvalzkzsbx03.inf.videologygroup.com'
    default['vlg-storm']['aws_datacenter'] = 'datacenter.aws.dmp.sandbox'
    default['vlg-storm']['nimbus']['server'] = 'usvalzsmsbx01.inf.videologygroup.com'
  when "endtoend"
    default['vlg-storm']['zookeeper_quorum'] = true
    default['vlg-storm']['zookeeper']['server']['1'] = 'usvalzzkete01.inf.videologygroup.com'
    default['vlg-storm']['zookeeper']['server']['2'] = 'usvalzzkete02.inf.videologygroup.com'
    default['vlg-storm']['zookeeper']['server']['3'] = 'usvalzzkete03.inf.videologygroup.com'
    default['vlg-storm']['aws_datacenter'] = 'datacenter.aws.dmp.endtoend'
    default['vlg-storm']['nimbus']['server'] = 'usvalzsmete01.inf.videologygroup.com'
  else #vagrant
    default['vlg-storm']['zookeeper_quorum'] = false
    default['vlg-storm']['aws_datacenter'] = 'datacenter.dmp.localhost'
    default['vlg-storm']['nimbus']['server'] = 'localhost'
end

#swap
unless Chef::Config[:solo]
  default['vlg-swap']['size'] = 8192
end

# sudo
default['authorization']['sudo']['groups'] = node['authorization']['sudo']['groups'] + [ 'eliza' ]
