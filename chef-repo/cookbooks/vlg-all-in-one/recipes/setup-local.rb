# couchbase
bash "setup_couchbase_server" do
  code <<-EOH
    while ! nc -vz localhost 8091; do sleep 1; done
    /opt/couchbase/bin/couchbase-cli cluster-init -c 127.0.0.1 -u admin -p default --cluster-init-username=admin --cluster-init-password=default --cluster-init-port=8091 --cluster-init-ramsize=275
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1 -u admin -p default --bucket=userprofiles --bucket-type=couchbase --bucket-replica=1 --enable-flush=1 --bucket-ramsize=100 --bucket-password=lucidmedia
    /opt/couchbase/bin/couchbase-cli bucket-create -c 127.0.0.1 -u admin -p default --bucket=idmappings --bucket-type=couchbase --bucket-replica=1 --enable-flush=1 --bucket-ramsize=100 --bucket-password=lucidmedia
    curl -X PUT -H'content-type:application/json' -d '{ "views":{ "all_keys":{ "map":"function(doc, meta) {emit(meta.id, null);}" } } }' http://userprofiles:lucidmedia@127.0.0.1:8092/userprofiles/_design/all_keys
  EOH
  action :run
  not_if "find /opt/couchbase/var/lib/couchbase/stats | egrep -q '(userprofiles|idmappings)'"
end

# solr
bash 'setup_solr' do
  code <<-EOH
    while ! nc -z -v -w 1 localhost 2181; do sleep 1; done
    function createOrUpdateCollection()
    {
        local name="$1"

        # Collections API sometimes hangs listing collections
        if curl -s -m 5 --retry 10 "http://127.0.0.1:9080/solr/admin/collections?action=LIST" | grep $name; then
            echo "Collection $name exists, reloading config"
            curl "http://127.0.0.1:9080/solr/admin/collections?action=RELOAD&name=$name"
        else
            echo "Collection $name not found, creating it"
            curl "http://127.0.0.1:9080/solr/admin/collections?action=CREATE&name=$name&numShards=1"
        fi
    }
    cd #{node['vlg-all-in-one']['solr']['config_dir']}
    if [ ! -d "#{node['vlg-solr']['home_dir']}/dmpusers_sampled1000_shard1_replica1" ]
    then
      java -classpath "zkcli-lib-41/*" org.apache.solr.cloud.ZkCLI -cmd upconfig -zkhost "127.0.0.1:2181" -confdir dmpusers -confname dmpusers_sampled1000
      createOrUpdateCollection "dmpusers_sampled1000"
    fi
    if [ ! -d "#{node['vlg-solr']['home_dir']}/dmpaudiences_shard1_replica1" ]
    then
      java -classpath "zkcli-lib-41/*" org.apache.solr.cloud.ZkCLI -cmd upconfig -zkhost "127.0.0.1:2181" -confdir dmpaudiences -confname dmpaudiences
      createOrUpdateCollection "dmpaudiences"
    fi
    if [ ! -d "#{node['vlg-solr']['home_dir']}/dmpattributes_shard1_replica1" ]
    then
      java -classpath "zkcli-lib-41/*" org.apache.solr.cloud.ZkCLI -cmd upconfig -zkhost "127.0.0.1:2181" -confdir dmpattributes -confname dmpattributes
      createOrUpdateCollection "dmpattributes"
    fi
  EOH
  action :run
end
