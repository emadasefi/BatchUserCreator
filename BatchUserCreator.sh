#!/bin/bash

OUTPUT_FILE="users.list"
rm -f "$OUTPUT_FILE"
#--------------------------------------------------------------
#تولید پسورد رندوم با طول بین 8 تا 16
generate_random_password() {
  local length=$(( RANDOM % 9 + 8 ))  # طول بین 8 تا 16
  local chars='A-Za-z0-9!@#$%&*()-_=+'	# کاراکترهای قابل استفاده در پسورد
  tr -dc "$chars" < /dev/urandom | head -c $length	# تولید رشته رندوم
}
#--------------------------------------------------------------
#دریافت نام پیشفرض
read -p "Enter base username: " base_username
#--------------------------------------------------------------
#تعداد کاربر
read -p "Enter number of users to create: " user_count
while ! [[ "$user_count" =~ ^[0-9]+$ ]] || [ "$user_count" -le 0 ]; do
  echo "Please enter a valid positive number"
  read -p "Enter number of users to create: " user_count
done
#--------------------------------------------------------------
#دریافت پسورد پیشفرض
read -s -p "Enter password to use (or leave blank to generate random passwords): " input_password
echo
#--------------------------------------------------------------
#پیشفرض یا رندوم
if [[ -z "$input_password" ]]; then
  use_same_password=false
  echo "Random passwords will be generated for each user."
else
  read -p "Apply this password to all users? (yes/no): " apply_all
  if [[ "$apply_all" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    use_same_password=true
    PASSWORD="$input_password"
  else
    use_same_password=false
    echo "Random passwords will be generated for each user."
  fi
fi
#--------------------------------------------------------------
# دایرکتوری home
read -p "Create home directory for users? (yes/no): " create_home
if [[ "$create_home" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  create_home_flag="-m"
else
  create_home_flag=""
fi
#--------------------------------------------------------------
echo "Starting user creation..."
#--------------------------------------------------------------
for (( i=1; i<=user_count; i++ )); do
  username="${base_username}${i}"
  sudo useradd $create_home_flag "$username"

  if [ "$use_same_password" = true ]; then
    passwd_to_set="$PASSWORD"
  else
    passwd_to_set=$(generate_random_password)
  fi

  echo "$username:$passwd_to_set" | sudo chpasswd

  #خروجی
  echo "User: $username, Password: $passwd_to_set" >> "$OUTPUT_FILE"
  echo "Created user $username with password: $passwd_to_set"
done

echo "User creation complete. Credentials saved in $OUTPUT_FILE"
