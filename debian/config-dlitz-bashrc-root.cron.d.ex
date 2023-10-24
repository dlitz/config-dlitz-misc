#
# Regular cron jobs for the config-dlitz-bashrc-root package.
#
0 4	* * *	root	[ -x /usr/bin/config-dlitz-bashrc-root_maintenance ] && /usr/bin/config-dlitz-bashrc-root_maintenance
