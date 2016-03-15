#
# Cookbook Name:: vlg-all-in-one
# Recipe:: default
#
# Copyright 2015, Videology Group, Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe "vlg-all-in-one::dirs"
include_recipe "vlg-java::default"
include_recipe "vlg-clicksense::default"
include_recipe "vlg-all-in-one::maven"
include_recipe "redisio::default"
include_recipe "redisio::enable"
include_recipe "vlg-all-in-one::mysql"
include_recipe "vlg-all-in-one::activemq"
include_recipe "memcached::default"
include_recipe "vlg-gams::default"
include_recipe "vlg-all-in-one::couchbase"
include_recipe "vlg-all-in-one::storm"
include_recipe "vlg-zookeeper::default"
include_recipe "vlg-all-in-one::kafka"
include_recipe "vlg-all-in-one::solr"