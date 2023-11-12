echo -e "\e[32m installing nginx \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[32m installing nginx \e[0m"
dnf install nodejs -y
echo -e "\e[32m installing nginx \e[0m"
useradd roboshop
echo -e "\e[32m installing nginx \e[0m"
mkdir /app
echo -e "\e[32m installing nginx \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install
echo -e "\e[32m installing nginx \e[0m"
cp configs/catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[32m installing nginx \e[0m"
systemctl daemon-reload
echo -e "\e[32m installing nginx \e[0m"
cp configs/catalogue.service /etc/yum.repos.d/mongo.repo
echo -e "\e[32m installing nginx \e[0m"
dnf install mongodb-org-shell -y
echo -e "\e[32m installing nginx \e[0m"
mongo --host mongodb-dev.pavandevops.com </app/schema/catalogue.js

