#!/bin/bash
yum -y update
yum -y install httpd


myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="black">
  <h2><font color="gold">Build by Power of Terraform <span color="red"> v0.12</span></h2>
  <div color="green">Server PrivateIP: <span color="aqua">$myip</span></div>
  <div color="magenta"></div>
  <!-- <b>Version 1.0</b> -->
  <!-- <b>Version 2.0</b> -->
  <b>Version 3.0</b>
</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on
