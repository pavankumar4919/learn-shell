copy_dir=$(pwd)
log_file=/tmp/out
rm -f ${log_file}
print_head(){
echo -e "\e[32m $1 \e[0m"
}