# Security Group Scripts

This repo contains several scripts that wrap the aws command line commands for you. These scripts specifically allow you to control security groups and add/remove rules for them.

# create_public_access_group.sh

This script allows you to create a new security group called `add-public-access` that allows pings to your server. You should only need to run this once and from there you can add rules to it using the next few scripts.

To run:

```
./create_public_access_group.sh
```

# add_new_rule.sh

This script allows you to add a rule to a given security group. You can run it like so:

```
./add_new_rule.sh security-group-id portNumber
```

So to open port 80 on security group:

```
./add_new_rule.sh sg-0ed7adab0169a69d5 80
```

# fetch_security_group_id.sh

This script allows you to fetch the security group details for a given security group name. Use it to fetch the id if you forget it.

```
./fetch_security_group_id.sh security-group-name
```

To fetch the data for `add-public-access`, run:

```
./fetch_security_group_id add-public-access
```