#!/bin/bash

rm -rf /var/run/rsyslogd.pid
service rsyslog start
cron
chown web:web -R /home/web
service ssh start
su -c "python /home/web/application.py" web >> /var/log/webpy.log
tail -f /var/log/webpy.log
