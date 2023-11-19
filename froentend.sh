echo -e "\e[32m installing nginx \e[0m"
dnf install nginx -y
echo -e "\e[32m removing content \e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[32m Downloading the content from internet \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[32m unzipping the file \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[32m transferring the repo \e[0m"
cp configs/frontend.repo /etc/nginx/default.d/roboshop.conf
echo -e "\e[32m restarting nginx \e[0m"
systemctl enable nginx
systemctl restart nginx
