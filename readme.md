# PRTG Zpool Health Monitoring
PRTG Script to monitor ZPool health.

![PRTG Probes](https://i.ibb.co/5YBMvR8/Capture-d-cran-2020-12-09-174701.png)

# USE:
# On the device side:
Put script in /var/prtg/scriptsxml/ - if folder does not exist, create it
chmod +x the script to make it executable

# Server:
Copy .OVL file in prtg_install_folder\lookups\custom
On the server, Reload the OVL Files in "setup - administrative tools - Load Lookups and File Lists
Add advanced ssh script sensor on the target host
Name sensor and select the script - adjust Scan interval in case of need
Add sensor
Edit channel limits as needed
