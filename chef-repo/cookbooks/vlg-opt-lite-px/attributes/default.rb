# ephemeral
default['vlg-ephemeral']['configuration'] = 'striped'

# haproxy
case node.chef_environment
when "production"
  if node['hostname'][0...13] == 'usvaolpxprd01' || node['hostname'][0...13] == 'usvaolpxprd02'
    default['vlg-opt-lite-px']['fc_backend'] = [ 'usvaolgwprd01.inf.videologygroup.com', 'usvaolgwprd02.inf.videologygroup.com' ]
    default['vlg-opt-lite-px']['ce_backend'] = [ 'usvaoldaprd01.inf.videologygroup.com', 'usvaoldaprd02.inf.videologygroup.com' ]
  else
    default['vlg-opt-lite-px']['http_auth_header'] = 'acl has_auth_header hdr(Authorization) -m found'
    default['vlg-opt-lite-px']['http_Authorization'] = 'reqadd Authorization:\ Basic\ YXV0aHRva2VuOmUxMGRiOWNkOTg2ODEwODBlOTk2YzkzMjA3NjBmY2ViYzc0OGFlYjQyMzMzNGU0MzE1ZTlmMGU1YTg1NjZmNDA2NmY1Zjk4MjMzZDQwMGUzOGYxNmFiYzQwYWJlNWUzNDI3Zjc3Y2I3NmI3M2Q4M2Y1YzQ5MThhY2QxYzc3ZmU0 if !has_auth_header'
    default['vlg-opt-lite-px']['fc_backend'] = [ 'usvaolgwprd03.inf.videologygroup.com', 'usvaolgwprd04.inf.videologygroup.com' ]
    default['vlg-opt-lite-px']['ce_backend'] = [ 'usvaoldaprd03.inf.videologygroup.com', 'usvaoldaprd04.inf.videologygroup.com' ] 
  end
when "staging"
  default['vlg-opt-lite-px']['fc_backend'] = [ 'usvaolgwstg01.inf.videologygroup.com' ]
  default['vlg-opt-lite-px']['ce_backend'] = [ 'usvaoldastg01.inf.videologygroup.com' ]
when "sandbox"
  default['vlg-opt-lite-px']['fc_backend'] = [ 'usvaolgwsbx01.inf.videologygroup.com' ]
  default['vlg-opt-lite-px']['ce_backend'] = [ 'usvaoldasbx01.inf.videologygroup.com' ]
else
  default['vlg-opt-lite-px']['fc_backend'] = [ 'localhost' ]
  default['vlg-opt-lite-px']['ce_backend'] = [ 'localhost' ]
end

