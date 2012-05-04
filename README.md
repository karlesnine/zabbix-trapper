Zabbix-trapper
==============

Zabbix trapper disk
   Monitor disk utilisation with zabbix.
   Items, triggers, screen for :
	* space utilization
	* inode utilization
	* IO utilization

/! \ Caution : v0.2 Developed for zabbix 1.8.11 for Ubuntu LTS 12.04 hosted on AWS EC2


Using – UserParameter=custom.vfs.dev.io.ms
You can work out %Util by taking this field and setting the item for delta/sec then multiply by 0.1
In theory is if the /proc/diskstats shows it spends 1000ms doing IO during a second ( 1000ms ) then it’s at 100%.
This gives the same value that iostat gives for %Util, so I think my logic is sound.
