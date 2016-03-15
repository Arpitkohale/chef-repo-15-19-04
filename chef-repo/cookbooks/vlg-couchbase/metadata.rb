name             "vlg-couchbase"
maintainer       "Videology Inc."
maintainer_email "gio@videologygroup.com"
license          "MIT"
description      "Installs and configures Couchbase Server."
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "1.3.5"

%w{centos}.each do |os|
  supports os
end

%w{openssl yum}.each do |d|
  depends d
end

recipe "vlg-couchbase::server", "Installs couchbase-server"
recipe "vlg-couchbase::client", "Installs libcouchbase"
recipe "vlg-couchbase::moxi", "Installs moxi-server"
