#!/bin/bash

echo "Installing java-1.8.0-openjdk"
sudo yum install java-1.8.0-openjdk.x86_64 -y

echo "Extracting tar files to /opt"
sudo tar -xvf /vagrant/nexus-3.39.0-01-unix.tar.gz -C /opt

cd /opt
sudo mv nexus-3* nexus

sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work


echo "Updating /opt/nexus/bin/nexus.rc"
echo "run_as_user="nexus"" | sudo tee /opt/nexus/bin/nexus.rc

echo "Updating /etc/systemd/system/nexus.service"
sudo tee /etc/systemd/system/nexus.service <<EOF
[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOF

sudo chkconfig nexus on
sudo systemctl enable nexus
sudo systemctl start nexus

echo "============================================================"
echo "Nexus starting!"
echo "Run vagrant ssh to logon the box"
echo "See logs in /opt/sonatype-work/nexus3/log/nexus.log"
echo "It takes loooooong time to complete startup. Wait around 20 mins. Open http://localhost:18081 in browser"
echo "Sign in with username: admin"
echo "See initial password in /opt/sonatype-work/nexus3/admin.password"
echo "============================================================"