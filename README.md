# Monitoring script 

this script check your url every 180 sec and if the url get bad status code(not 200), print your server is down and call your sms webhook. And do this every 10 min till your url get back up.

## how to use

- to use this script follow this steps
```
1. git clone https://github.com/meysamb222/monitoring-script.git

2. edit script.sh file and put your url to monitor

3. chmod +x script.sh

4. mv script.sh /usr/bin/

```
## Run the script as a service in ubuntu

```
1. vim /etc/systemd/system/monitor.service

2. put following lines in 'monitoring.service' 
 
[Unit]
Description=My Script

[Service]
ExecStart=/usr/bin/myscript.sh

[Install]
WantedBy=multi-user.target

3. reload daemon by execute this command : 'systemctl daemon-reload'

4. enable & start your service : 'systemctl enable monitor && systemctl start monitor'


