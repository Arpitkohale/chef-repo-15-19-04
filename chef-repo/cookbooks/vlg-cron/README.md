vlg-cron Cookbook
====================
https://github.com/facebook/chef-utils/tree/master/cookbooks/fb_cron

This cookbook provides a simple data-based API for setting crons.

Requirements
------------

Attributes
----------
* node['vlg-cron']['jobs']

Usage
-----
### Adding Jobs
`node['vlg-cron']['jobs']` is a hash of crons. To add a job, simply do:

    node.default['vlg-cron']['jobs']['do_this_thing'] = {
      'time' => '4 5 * * *',
      'user' => 'serviceuser',
      'command' => '/usr/local/bin/foo.sh',
    }

### Please name your cronjob as follows:
* simple string
* no spaces
* underscores instead of dashes

This makes deleting it in other code easier if necessary. See 'Removing Jobs' for
details.

You can also specify `mailto` to direct mail for your job.

`user` is optional and will default to 'root', but `time` and `command`
are required.

### Removing Jobs
To remove a job you added, simply stop adding it to the hash.  This cookbook
makes cron idempotent *as a whole*, thus if you remove the lines adding a cron
job, it'll be removed from any systems it was on.

Default crons we want everywhere are set in the `vlg-base` cron attributes file. If
you need to exempt yourself from one, you can simply remove it from the hash:

    node['vlg-cron']['jobs'].delete('do_this_thing')

For this reason, cron jobs should be given simple names as described above
to make exempting systems easy.

### NOTE: These jobs will end up in /etc/cron.d/vlg
