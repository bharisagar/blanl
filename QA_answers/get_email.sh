# 3. ⁠write a shell script to get the server disk size details, if the disk size is more than 80% it should send e mail. 

#!/bin/bash

# size=80
# mail_addr="sagarbhari06@gmail.com"
# Disk_check=$(df -h / | awk 'NR==2 {print $5}')

# if [ "$Disk_check" -gt "$size" ];then
# echo " Disk size is more than ${size}%, email sent to $mail_addr "
# else
# echo " disk size is $Disk_check "
# fi
---------------------------------------------------------------------------
#!/bin/bash

size=20
mail_addr="sagarbhari06@gmail.com"

# Get disk usage and remove the '%' sign
Disk_check=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$Disk_check" -gt "$size" ]; then
    echo "Disk size is more than ${size}%, email sent to $mail_addr"
    echo "Disk usage is at ${Disk_check}%" | mail -s "Disk Alert on EC2" $mail_addr
else
    echo "Disk size is ${Disk_check}%"
fi

# df -h / | awk 'NR==2 {print $5}' → gets the usage column like 22%

# sed 's/%//' → removes %, so you get 22 (as a number)

# Then comparison [ "$Disk_check" -gt "$size" ] works fine
-------------------------------------------------------------------
Install Required Packages
#First, install ssmtp and mailx to send emails: 
sudo yum install -y ssmtp mailx

2. Enable App Password in Gmail
Visit: https://myaccount.google.com/security

Under "Signing in to Google" → Click App Passwords

Select App: Mail, Device: Other

Generate the password (you'll get something like: sfsf sfsf sfss asxi)

Copy it and remove the spaces → sfsfsfsfaya

3. Configure ssmtp
sudo nano /etc/ssmtp/ssmtp.conf

root=postmaster
mailhub=smtp.gmail.com:587
AuthUser=sagarbhari06@gmail.com
AuthPass=jsgfjhsgf
UseSTARTTLS=YES

then test the configuration by sending a test email:
 echo "Test email from EC2" | mail -s "Test Subject" sagarbhari06@gmail.com

