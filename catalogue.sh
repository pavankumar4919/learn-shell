curl -sL https://rpm.nodesource.com/setup_lts.x | bash
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
cp configs/catalogue.service /etc/systemd/system/catalogue.service
systemctl daemon-reload
cp configs/catalogue.service /etc/yum.repos.d/mongo.repo
dnf install mongodb-org-shell -y
mongo --host MONGODB-SERVER-IPADDRESS </app/schema/catalogue.js
