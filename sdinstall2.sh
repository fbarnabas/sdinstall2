#!/bin/bash
# https://stackoverflow.com/questions/58302378/run-bash-script-as-root-in-startup-on-ubuntu-18-04

cat > /etc/systemd/system/sd.sh <<EOF
#!/bin/bash
shutdown 2

EOF

cat > /etc/systemd/system/sd.service <<EOF

[Unit]
Description = sd.service

[Service]
WorkingDirectory= /etc/systemd/system/
ExecStart= /etc/systemd/system/sd.sh

[Install]
WantedBy=multi-user.target
EOF

chmod +x /etc/systemd/system/sd.sh
systemctl enable sd.service
systemctl start sd.service
