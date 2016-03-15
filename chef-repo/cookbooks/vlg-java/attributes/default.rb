default['java']['oracle']['accept_oracle_download_terms'] = 'yes'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['vlg-java']['unlimited_jce_policy_url'] = 'http://s3.amazonaws.com/videologypublic/repo/UnlimitedJCEPolicyJDK8'
case node['java']['jdk_version']
when '7'
  default['vlg-java']['unlimited_jce_policy']['US_export_policy_checksum'] = '3bb2e88a915b3cb003ca185357a92c16'
  default['vlg-java']['unlimited_jce_policy']['local_policy_checksum'] = '9dd69bcc7637d872121880c35437788d'
when '8'
  default['vlg-java']['unlimited_jce_policy']['US_export_policy_checksum'] = 'ef6e8eae7d1876d7f05d765d2c2e0529'
  default['vlg-java']['unlimited_jce_policy']['local_policy_checksum'] = 'dabfcb23d7bf9bf5a201c3f6ea9bfb2c'
end
