#!/bin/bash

knife ec2 server create -I ami-f0091d91 --bootstrap-version 11.16.4 --security-group-ids sg-a62807c2 --subnet subnet-b162ddc6 --associate-public-ip --ssh-key test-machine -f t2.micro --ssh-user ec2-user --identity-file ../keypair/test-machine.pem -N node_test2  --run-list recipe[e3gblntwrk] --region=us-west-2 --environment production  --tags Platform=Linus,Owner=e3gblntwrk,Name=node_test1,Environment=production


knife bootstrap 52.34.23.4 --bootstrap-version 11.16.4 --ssh-user ec2-user --sudo --identity-file ../keypair/test-machine.pem -N node_test1 --run-list recipe[e3gblntwrk] --environment Sending 