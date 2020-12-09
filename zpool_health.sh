#!/bin/bash

# Async IT Sàrl - Switzerland - 2020
# Jonas Sauge

# USE:
# Server:
#  Copy .OVL file in prtg_install_folder\lookups\custom On the server, Reload the OVL Files in "setup - administrative tools - Load Lookups and File Lists
# On the device side:
# 	Put script in /var/prtg/scriptsxml/ - if folder does not exist, create it
# 	chmod +x the script to make it executable
# 	Add advanced ssh script sensor
# 	Name sensor and select the script - adjust Scan interval in case of need
# 	Add sensor

# Version:
# Version 1.0 - Initial release


echo "<prtg>"

for zfs_pool in `zpool list | tail -n +2  | awk '{print $1}'`; do
# ----------------------- Result for Zpool Health  ----------------------------------

zpool_health=$(zpool status $zfs_pool)

if echo $zpool_health | egrep -wqi 'DEGRADED|FAULTED|OFFLINE|UNAVAIL|REMOVED|FAIL|DESTROYED|corrupt|cannot|unrecover' ; then
		zpool_status=1
		else 
	    zpool_status=0
		fi
			echo "<result>"
			echo "<value>$zpool_status</value>"
			echo "<channel>$zfs_pool pool health</channel>"
			echo "<ValueLookup>oid.status.okerror</ValueLookup>"
			echo "<unit>Custom</unit>"
			echo "</result>"
done
echo "</prtg>"
