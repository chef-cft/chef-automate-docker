#!/bin/bash
FILE=/usr/lib/systemd/system/chef-automate.service
if [ -f "$FILE" ]; then
    /chef-automate start
else
    filename=($(ls /*.aib))
    /chef-automate deploy --airgap-bundle ${filename} --accept-terms-and-mlsa --skip-preflight
    /chef-automate config patch fqdn.toml
    /chef-automate config patch lbport.toml
    /chef-automate iam admin-access restore Cod3Can!
fi


