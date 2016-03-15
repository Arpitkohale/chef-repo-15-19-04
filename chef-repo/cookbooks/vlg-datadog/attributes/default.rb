# datadog
case node.chef_environment
when "production", "staging", "sandbox"
  data = Chef::EncryptedDataBagItem.load("datadog", "api")
  datadog_api_key = data["key"]
  default['datadog']['api_key'] = "#{datadog_api_key}"
end

