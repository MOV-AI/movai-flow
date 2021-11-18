# ce-project-misc
Community Edition - Project miscellaneous resources

#!/bin/bash
# Create a systemd service that autostarts & manages a docker-compose instance in the current directory
# by Uli Köhler - https://techoverflow.net
# Licensed as CC0 1.0 Universal
SERVICENAME=$(basename $(pwd))

echo "Creating systemd service... /etc/systemd/system/${SERVICENAME}.service"
# Create systemd service file
sudo cat >/etc/systemd/system/$SERVICENAME.service <<EOF
[Unit]
Description=$SERVICENAME
Requires=docker.service
After=docker.service

[Service]
Restart=always
User=root
Group=docker
WorkingDirectory=$(pwd)
# Shutdown container (if running) when unit is started
ExecStartPre=$(which docker-compose) -f docker-compose.yml down
# Start container when unit is started
ExecStart=$(which docker-compose) -f docker-compose.yml up
# Stop container when unit is stopped
ExecStop=$(which docker-compose) -f docker-compose.yml down

[Install]
WantedBy=multi-user.target
EOF

echo "Enabling & starting $SERVICENAME"
# Autostart systemd service
sudo systemctl enable $SERVICENAME.service
# Start systemd service now
sudo systemctl start $SERVICENAME.service
The service name is the directory name:

SERVICENAME=$(basename $(pwd))
Now we will create the service file in /etc/systemd/system/${SERVICENAME}.service using the template embedded in the script

The script will automatically determine the location of docker-composeusing $(which docker-compose) and finally enable and start the systemd service:

# Autostart systemd service
sudo systemctl enable $SERVICENAME.service
# Start systemd service now
sudo systemctl start $SERVICENAME.service
 
