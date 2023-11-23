source common.sh
print_head "copying repo"
cp ${pwd}/configs/mango repo /etc/yum.repos.d/mongo.repo >>&${log_file}
print_head "installing mangodb"
dnf install mongodb-org -y >>&${log_file}
print_head "enabling mangodb"
systemctl enable mongod >>&${log_file}
print_head "restarting mangodb"
systemctl restart mongod >>&${log_file}

