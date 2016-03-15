# pd2jira_credentials
data = Chef::EncryptedDataBagItem.load("pd2jira", "jira_cred", "pd_api")
jira_username = data["username"]
jira_passsword = data["password"]
pd_api=data["api"]

default['vlg-pd2jira']['jira_username'] = "#{jira_username}"
default['vlg-pd2jira']['jira_password'] = "#{jira_passsword}"
default['vlg-pd2jira']['api_key'] = "#{pd_api}"
default['vlg-pd2jira']['base_dir']='/var/www/pd2jira'
default['vlg-pd2jira']['owner']='vlg'
default['vlg-pd2jira']['group']='vlg'