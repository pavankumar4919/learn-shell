copy_dir=$(pwd)
log_file=/tmp/out
rm -f ${log_file}
print_head(){
echo -e "\e[32m $1 \e[0m"
}
print_head "installing nginx"
dnf install nginx -y &>>${log_file}
print_head "removing HTML contnent"
rm -rf /usr/share/nginx/html/* &>>${log_file}
print_head "Browsing content from internet"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log_file}
print_head "unzipping the file"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
print_head "copying the file"
cp ${copy_dir}/configs/frontend.repo /etc/nginx/default.d/roboshop.conf &>>${log_file}
print_head "enabling the Nginx"
systemctl enable nginx &>>${log_file}
print_head "restarting the Nginx"
systemctl restart nginx &>>${log_file}
