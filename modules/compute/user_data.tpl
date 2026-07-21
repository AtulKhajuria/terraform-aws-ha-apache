#!/bin/bash
set -euxo pipefail
apt-get -y update
apt-get install -y apache2
systemctl enable apache2
systemctl start apache2

cat <<EOF >/var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${project_name}</title>
</head>
<body>
<h1> Terraform AWS HA Apache</h1>
<h2> Project: ${project_name}</h2>
<h2> Environment: ${environment}</h2>
<h2> Hostname: $(hostname)</h2>
</body>
</html>
EOF