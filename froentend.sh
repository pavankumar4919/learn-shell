copy_dir=$(pwd)
log_file=/tmp/out
rm -f ${log_file}
echo -e "\e[32m installing nginx \e[0m"
dnf install nginx -y &>>${log_file}
echo -e "\e[32m removing content \e[0m"
rm -rf /usr/share/nginx/html/* &>>${log_file}
echo -e "\e[32m Downloading the content from internet \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log_file}
echo -e "\e[32m unzipping the file \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[32m transferring the repo \e[0m"
cp ${copy_dir}/configs/frontend.repo /etc/nginx/default.d/roboshop.conf &>>${log_file}
echo -e "\e[32m restarting nginx \e[0m"
systemctl enable nginx &>>${log_file}
systemctl restart nginx &>>${log_file}
