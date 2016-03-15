#
# Cookbook Name:: vlg-s3fs
# Recipe:: setup
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#

remote_file "/tmp/fuse-2.9.3.tar.gz" do
  source "http://s3.amazonaws.com/videologypublic/repo/fuse-2.9.3.tar.gz"
  checksum "33cae22ca50311446400daf8a6255c6a"
  not_if "test -f /usr/bin/fusermount"
  notifies :run, "bash[install_fuse]", :immediately
end

bash "install_fuse" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -zxf fuse-2.9.3.tar.gz
    (cd fuse-2.9.3; ./configure --prefix=/usr; make; make install; modprobe fuse; ldconfig; rm -rf /tmp/fuse-2.9.3.tar.gz; rm -rf /tmp/fuse-2.9.3)
  EOH
  action :nothing
end

remote_file "/tmp/s3fs-1.78.tar.gz" do
  source "http://s3.amazonaws.com/videologypublic/repo/s3fs-1.78.tar.gz"
  checksum "d27ea5527689b787bd121cd3629f9b1e"
  not_if "test -f /usr/bin/s3fs"
  notifies :run, "bash[install_s3fs]", :immediately
end

bash "install_s3fs" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -zxf s3fs-1.78.tar.gz
    (cd s3fs-fuse-1.78; export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/lib64/pkgconfig; ./autogen.sh; ./configure --prefix=/usr; make; make install; rm -rf /tmp/s3fs-1.78.tar.gz; rm -rf /tmp/s3fs-fuse-1.78)
  EOH
  action :nothing
end
