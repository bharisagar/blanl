#!/bin/bash

# Initialize counter
counter=1

# While loop to print numbers 1 to 5
while [ $counter -le 5 ]
do
    echo "$counter"
    ((counter++))  # Increment counter
done

----------------------------------------
#!/bin/bash
directories=("dir1" "dir2" "dir3")


for dir in "${directories[@]}"; do
    echo "Checking directory: $dir"
   
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            echo " list file: $file"
        fi
    done
----------------------------------------
#!/bin/bash
mkdir -p dir1

for i in {1..5}; do
    touch "dir1/file$i.txt"
done

echo "Created 5 files in dir1"
-----------------------------------------
how do we check script is running in background or not
#!/bin/bash
# Check if the script is running in the background
if [[ $- == *i* ]]; then
    echo "Script is running in the foreground"
else
    echo "Script is running in the background"
fi
-----------------------------------------
how do we run script in background

#!/bin/bash
# Run the script in the background
./script.sh & 
-----------------------
i have two servers, server1 and server2 i need to get .txt files from server1 and copy to server2
# Use scp to copy files from server1 to server2
scp user@server1:/path/to/*.txt user@server2:/path/to/destination/
# Replace user, server1, server2, and paths with actual values
before scp command, you need to make sure that SSH keys are set up for passwordless authentication between the servers.
# This can be done using ssh-keygen and ssh-copy-id commands.
# Example:
ssh-keygen -t rsa
ssh-copy-id user@server1
ssh-copy-id user@server2
# After setting up SSH keys, you can run the scp command without being prompted for a password.
# This will securely copy all .txt files from server1 to server2.
--------------------------------------------    
diffrence between and if, or if
# The difference between "and" and "or" in conditional statements is as follows:
# 1. "and" (&&):
#    - The "and" operator is used to combine two or more conditions.
#    - All conditions must be true for the overall expression to be true.
#    - If any condition is false, the entire expression evaluates to false.
#    - Example:
#      if [ condition1 ] && [ condition2 ]; then
#          echo "Both conditions are true"
#      fi
#
# 2. "or" (||): 
#    - The "or" operator is used to combine two or more conditions.

#    - At least one condition must be true for the overall expression to be true.
#    - If all conditions are false, the entire expression evaluates to false.
#    - Example:
#      if [ condition1 ] || [ condition2 ]; then
#          echo "At least one condition is true"
#      fi
--------------------------------------------------------------------------------------
i have file i need to run for long time and store it in another file
# Use the following command to run a script for a long time and store the output in another file
nohup ./long_running_script.sh > output.log 2>&1 &
# This command does the following:
# 1. nohup: Runs the command immune to hangups, with output to a non-tty.
# 2. ./long_running_script.sh: The script you want to run.

# 3. > output.log: Redirects standard output to output.log.
------------------------------------------------------------------
why do we use security group
# Security groups are used in cloud computing environments (like AWS, Azure, etc.) to control inbound and outbound traffic to resources such as virtual machines (VMs) or instances.
# They act as virtual firewalls that define rules for allowing or denying traffic based on various criteria, such as IP addresses, protocols, and ports.
------------------------------------------------------------------
what is ec2
# Amazon EC2 (Elastic Compute Cloud) is a web service that provides resizable compute capacity in the cloud.
# It allows users to launch and manage virtual servers (instances) in the Amazon Web Services (AWS) cloud.
------------------------------------------------------------------------------------------------------
why do we use blob storage
# Blob storage is used to store large amounts of unstructured data, such as text or binary data, in the cloud.
# It is commonly used for scenarios like:
# 1. Storing images, videos, and audio files.
----------------------------------------------------------------    
what is ebs?
# Amazon EBS (Elastic Block Store) is a block storage service designed for use with Amazon EC2 instances.
# It provides persistent storage that can be attached to EC2 instances, allowing users to store data that needs to persist beyond the lifecycle of the instance.
# EBS volumes can be used for various purposes, such as:
# 1. Storing data for databases.
# 2. Providing file systems for applications.
# 3. Storing application data.
# 4. Creating backups and snapshots.
# EBS volumes are highly available and durable, and they can be easily scaled up or down based on the needs of the application.
# EBS volumes can be encrypted for security and can be backed up using snapshots, which are stored in Amazon S3.
# EBS volumes can be attached to multiple EC2 instances, allowing for high availability and redundancy.
# EBS volumes can be resized and modified without downtime, making them flexible for changing storage needs.
-----------------------------------------------------------------
i have string production_file remove _file
# To remove "_file" from the string "production_file", you can use the following command in a shell script:
string="production_file"
modified_string=${string//_file/} #/ Remove "_file" from the string
echo "$modified_string"
# This will output:
# production
# The `${string//_file/}` syntax uses parameter expansion to replace all occurrences of "_file" with an empty string, effectively removing it.
------------------------------------------
curl command
# The curl command is a command-line tool used to transfer data to or from a server using various protocols, including HTTP, HTTPS, FTP, and more.
# It is commonly used for testing APIs, downloading files, and sending data to web servers.
# Here are some common examples of using the curl command:
# 1. Basic GET request:
curl http://example.com
# This command retrieves the content of the specified URL and displays it in the terminal.
# 2. Download a file:
wget http://example.com/file.txt
# This command downloads the specified file from the URL and saves it to the current directory.
# 3. Send a POST request with data:
-------------------------------------------
i have a build file in could as soon as i download file which format it will download   
# The format of the downloaded file depends on the type of build file and the method used to download it.
# Common formats include:
# 1. .zip: Compressed archive file format.
# 2. .tar.gz: Compressed tarball file format.
how to unzip tar.gz file
# To unzip a .tar.gz file, you can use the following command:
tar -xzf file.tar.gz
# This command does the following:
# -x: Extract files from the archive.
# -z: Decompress the archive using gzip.
# -f: Specifies the name of the archive file.
# Replace "file.tar.gz" with the actual name of your file.
--------------------------------------------
how we get 3rd column from file
# To extract the 3rd column from a file, you can use the `awk` command:
awk '{print $3}' filename
# Replace "filename" with the actual name of your file.
awk is used to cut the file in rows and columns.
--------------------------------------------
how do we get all file expect .txt
# To get all files except .txt files in a directory, you can use the following command:
ls | grep -v '\.txt$'
------------------------------------------
why we use operator in script
# Operators in scripts are used to perform various operations, such as:
# 1. Arithmetic operations: Perform calculations (e.g., +, -, *, /).
# 2. Comparison operations: Compare values (e.g., ==, !=, <, >).
# 3. Logical operations: Combine conditions (e.g., &&, ||).
# 4. Assignment operations: Assign values to variables (e.g., =, +=).
# 5. String operations: Manipulate strings (e.g., concatenation, substring).
# 6. File operations: Perform actions on files (e.g., -f, -d, -e).
# Operators are essential for controlling the flow of the script and making decisions based on conditions.
-------------------------------------------
why do we use corntab
# Cron jobs are used to schedule tasks to run automatically at specified intervals.
# They are commonly used for:
# 1. Automating repetitive tasks: Running scripts or commands at regular intervals.
# 2. System maintenance: Performing backups, updates, and cleanup tasks.
---------------------------
there is process running in server and i should have backup of file and copy to another server and restart the process
first stop the process
# To stop a running process, you can use the following command:
# kill <PID> or sudo server stop <process_name>
# To create a backup of a running process's file, copy it to another server, and restart the process, you can use the following steps:
# 1. Create a backup of the file:
cp /path/to/running_process_file /path/to/backup_file
# 2. Copy the backup file to another server using scp:
scp /path/to/backup_file user@remote_server:/path/to/destination/
# 3. Restart the process:
systemctl restart process_name
# Replace "/path/to/running_process_file", "/path/to/backup_file", "user@remote_server", and "process_name" with actual values.
--------------------------------------------
sum of two numbers
# To calculate the sum of two numbers in a shell script, you can use the following code:
!/bin/bash
num1=5
num2=10
sum=$((num1 + num2))
echo "The sum of $num1 and $num2 is: $sum"
--------------------------------------------
allow to give input in script for sum of two numbers
#!/bin/bash
# Read two numbers from user input
read -p "Enter first number: " num1
read -p "Enter second number: " num2
# Calculate the sum
sum=$((num1 + num2))
# Display the result
echo "The sum of $num1 and $num2 is: $sum"
--------------------------------------------
how do we take backup of file
# To take a backup of a file, you can use the `cp` command to copy the file to a backup location.
# For example:
cp /path/to/original_file /path/to/backup_file
# Replace "/path/to/original_file" with the path to the file you want to back up and "/path/to/backup_file" with the desired backup location.
# You can also use the `tar` command to create a compressed archive of the file:
tar -czvf backup_file.tar.gz /path/to/original_file
# This command creates a compressed tarball named "backup_file.tar.gz" containing the original file.
# Replace "/path/to/original_file" with the path to the file you want to back up.
#czvf here c is for create, z is for compress, v is for verbose, f is for file
--------------------------------------------
what is redirect >  and append >>
# The `>` operator  It redirects the output of a command to a file, overwriting the file if it already exists.
# The `>>` operator is used for appending output to a file. It adds the output of a command to the end of the file without overwriting its existing content.

-------------------------
what is ami
# An Amazon Machine Image (AMI) is a pre-configured virtual machine image used to create instances in Amazon EC2.
# It contains the operating system, application server, and applications required to launch an instance.
# AMIs can be used to create multiple instances with the same configuration, making it easy to scale applications.
# AMIs can be public or private, and users can create custom AMIs based on their specific requirements.
# AMIs can be shared with other AWS accounts or made available to the public.
--------------------------------------------
how to check system memory
# To check system memory usage, you can use the `free` command:
free -h
---------------------------------------------
how do we check default shell
# To check the default shell for a user, you can use the following command:
echo $SHELL
--------------------------------------
print 1to5 lines in script
#!/bin/bash
# Print numbers from 1 to 5
for i in {1..5}
do
    echo "$i"
done
--------------------------------------
how to set alias in script
# To set an alias in a shell script, you can use the following syntax:
alias alias_name='command'
# For example:
alias ll='ls -la'
# This creates an alias `ll` that runs the command `ls -la`.
-------------------------------------------
for i in 1 2 3 4 5
do
    echo " $i" # $i is the variable 
done 
-------------------------------------------
may 7th

nohup
# This command runs the script in the background and redirects output to a file.
-----------------------
when we use while loop and for loop
# While Loop:
# - Used when the number of iterations is not known in advance.
# - Continues until a specific condition is met.
# - Example:
count=1
while [ $count -le 5 ]; do
    echo "$count"
    ((count++))
done
# For Loop:
# - Used when the number of iterations is known or fixed.
# - Iterates over a list of items or a range of numbers.
# - Example:
for i in {1..5}; do
    echo "$i"
done
---------------------------------------
awk command
# The `awk` command is a powerful text processing tool used for pattern scanning and processing.
# It is commonly used for extracting and manipulating data from text files or command output.
----------  ----------------------
security group
# Security groups are virtual firewalls that control inbound and outbound traffic to AWS resources, such as EC2 instances.
# They allow users to define rules based on IP addresses, protocols, and ports to secure their resources.
# Security groups are stateful, meaning that if an incoming request is allowed, the response is automatically allowed regardless of outbound rules.
---------------------------------------
sticky session - ASK QUESTION 
latentcy in network
# Latency in a network refers to the time it takes for data to travel from the source to the destination.
# Sticky sessions, also known as session affinity, is a technique used in load balancing to ensure that a user's requests are consistently directed to the same backend server.
# This is useful for applications that maintain session state, as it allows the server to remember the user's session information.
-------------------------------------
what are os layers
# OS layers refer to the different levels of abstraction in an operating system that manage hardware and software resources.
# Common layers include:
# 1. Hardware Layer: The physical components of the computer.
# 2. Kernel Layer: The core part of the OS that manages hardware resources and provides services to applications.
# 3. User Space Layer: The environment where user applications run, interacting with the kernel through system calls.
# 4. Application Layer: The top layer where user applications and services operate.
# Each layer has its own responsibilities and interacts with the layers above and below it to provide a complete operating system experience.
---------------------------------------
# what is load balancer
# A load balancer is a device or software that distributes network or application traffic across multiple servers to ensure high availability, reliability, and performance.
# It helps prevent server overload, improves response times, and provides fault tolerance by redirecting traffic to healthy servers.
----------------------------------------
until loop
# The `until` loop is a control flow statement that executes a block of code repeatedly until a specified condition becomes true.
# It is the opposite of the `while` loop, which continues as long as a condition is true.
# Example:
count=1
until [ $count -gt 5 ]; do
    echo "$count"
    ((count++))
done
----------------------------------------
what is blob storage
# Blob storage is a type of cloud storage designed to store large amounts of unstructured data, such as text, images, videos, and binary data.
# It is commonly used for scenarios like:
# 1. Storing media files, backups, and archives.
# 2. Serving static content for web applications.
# 3. Storing data for big data analytics and machine learning.
------------------------------------------------
Amazon EBS (Elastic Block Store)
# Amazon EBS (Elastic Block Store) is a block storage service designed for use with Amazon EC2 instances.
# It provides persistent storage that can be attached to EC2 instances, allowing users to store data that needs to persist beyond the lifecycle of the instance.
# EBS volumes can be used for various purposes, such as:
# 1. Storing data for databases.
# 2. Providing file systems for applications.
# 3. Storing application data.
# 4. Creating backups and snapshots.
# EBS volumes are highly available and durable, and they can be easily scaled up or down based on the needs of the application.
----------------------------------------
how to create elastic block store
# To create an Amazon EBS volume, you can use the AWS Management Console, AWS CLI, or SDKs. Here are the steps using the AWS Management Console:
# 1. Sign in to the AWS Management Console.
# 2. Navigate to the EC2 Dashboard.
# 3. In the left navigation pane, click on "Volumes" under "Elastic Block Store."
# 4. Click on the "Create Volume" button.
# 5. Specify the volume type, size, availability zone, and other options.      
# 6. Click on the "Create Volume" button to create the EBS volume.
# 7. Once created, you can attach the volume to an EC2 instance.
----------------------------------------

if i want to explose to internet from my machine to other machinewhich port i need to open
# To expose a service running on your machine to the internet, you typically need to open the following ports:
# 1. HTTP: Port 80 (for web traffic)
# 2. HTTPS: Port 443 (for secure web traffic)
-----------------------------------------------------
how do we configure load balancer
---------------------------------
how to delete load balancer
# To delete a load balancer in AWS, you can use the AWS Management Console, AWS CLI, or SDKs. Here are the steps using the AWS Management Console:
# 1. Sign in to the AWS Management Console.
# 2. Navigate to the EC2 Dashboard.
# 3. In the left navigation pane, click on "Load Balancers" under "Load Balancing."
# 4. Select the load balancer you want to delete.
# 5. Click on the "Actions" button and select "Delete."
# 6. Confirm the deletion by clicking "Yes, Delete."
---------------------------------------

elastic ip #elastic ip is a static ip address designed for dynamic cloud computing.
# It is associated with your AWS account and can be remapped to different instances as needed.
# Elastic IPs are used to maintain a consistent IP address for your resources, even if the underlying instance changes.
--------------------------------------------------------------------------------------
scalability
# Scalability refers to the ability of a system to handle increased load or demand by adding resources.
# In cloud computing, scalability can be achieved through horizontal scaling (adding more instances) or vertical scaling (increasing the resources of existing instances).
# It allows applications to grow and adapt to changing workloads without significant downtime or performance degradation.
---------------------------------------
what are t2micro 
# T2 Micro is an Amazon EC2 instance type that provides a low-cost option for running applications in the cloud.
# It is designed for workloads that require a baseline level of CPU performance with the ability to burst to higher levels when needed.
# T2 Micro instances are suitable for small applications, development environments, and low-traffic websites.
----------------------------------------
how do we check current running process
# To check the current running processes on a Linux system, you can use the following command:
ps aux
# This command displays a list of all running processes along with their details, such as user, CPU usage, memory usage, and command.
# You can also use the `top` command for a real-time view of running processes:
top
# This command provides an interactive interface to monitor system processes, CPU usage, memory usage, and other system statistics.
----------------------------------------
why we use | 
# The `|` (pipe) operator is used to pass the output of one command as input to another command in a shell script or command line.
# It allows you to chain commands together, enabling complex data processing and manipulation.
# For example:
# ls -l | grep ".txt"
# This command lists all files in long format and then filters the output to show only files with a `.txt` extension.
-----------------------------------------
passwordless authentication
# Passwordless authentication allows users to access remote servers or services without entering a password.
# It is typically achieved using SSH keys, which consist of a public key and a private key.
# The public key is placed on the remote server, while the private key remains on the user's machine.   
------------------------------------------  
where i run keygen command
# The `ssh-keygen` command is run in the terminal or command prompt of your local machine (the machine from which you want to connect to a remote server).
# It generates a public-private key pair for SSH authentication.
# Example command:     
ssh-keygen -t rsa -b 2048
# This command generates a 2048-bit RSA key pair.
# The public key can then be copied to the remote server using the `ssh-copy-id` command.
ssh-copy-id user@remote_server
# Replace "user" and "remote_server" with the actual username and hostname or IP address of the remote server.
# This command copies the public key to the remote server's authorized keys file, allowing passwordless SSH access.
------------------------------------------
what is security group
# A security group is a virtual firewall that controls inbound and outbound traffic to AWS resources, such as EC2 instances.
# It allows users to define rules based on IP addresses, protocols, and ports to secure their resources.
# Security groups are stateful, meaning that if an incoming request is allowed, the response is automatically allowed regardless of outbound rules.
-------------------------------------------
i = 1 #i is a variable
# while loop
while [ $i -le 10 ] # Loop from 1 to 10
mv "file$i.txt" "file_$i.txt" # Rename file
# Increment the variable
((i++))
done   
# This script renames files from "file1.txt" to "file10.txt" to "file_1.txt" to "file_10.txt".
-------------------------------------------
how do we update package manager in linux
# To update the package manager in Linux, you can use the following commands based on the distribution:
# 1. For Debian-based distributions (e.g., Ubuntu):
sudo apt update
#apt is used to install packages
sudo apt upgrade
# 2. For Red Hat-based distributions (e.g., CentOS, Fedora):
sudo yum update
# 3. For Arch-based distributions:
sudo pacman -Syu
# 4. For openSUSE:
sudo zypper refresh
# These commands will update the package lists and upgrade installed packages to their latest versions.
----------------------------------------------  
how do we copy all the data from working server to another server when doing data migration
# To copy all data from a working server to another server during data migration, you can use the `rsync` command:
rsync -avz /path/to/source/ user@destination_server:/path/to/destination/
# Replace "/path/to/source/" with the source directory, "user" with the username, "destination_server" with the target server's hostname or IP address, and "/path/to/destination/" with the target directory.
# The `-a` option preserves file permissions and timestamps, `-v` enables verbose output, and `-z` compresses data during transfer.
# This command will securely copy all files and directories from the source server to the destination server.
# Make sure SSH keys are set up for passwordless authentication between the servers to avoid being prompted for a password.
----------------------------------------------
what is rsync
# `rsync` is a command-line utility for efficiently transferring and synchronizing files and directories between two locations, either on the same machine or over a network.
----------------------------------------------
use for loop which script is working in current sever and copy to another server
# To use a for loop to check which scripts are running on the current server and copy them to another server, you can use the following script:
#!/bin/bash 
# Define the destination server and directory
destination_server="user@destination_server"
destination_directory="/path/to/destination/"
# Get the list of running scripts
running_scripts=$(ps -ef | grep -v grep | grep ".sh" | awk '{print $8}')
# Loop through each running script
for script in $running_scripts; do
    # Copy the script to the destination server
    scp "$script" "$destination_server:$destination_directory"
done
# Replace "user@destination_server" and "/path/to/destination/" with the actual username, server address, and destination directory.                                                            
------------------------------------------------------
there are some users and groups in server one  and each groups or user can have differenct acees and now how do we move to another server
# To move users and groups from one server to another while preserving their access permissions, you can follow these steps:
# 1. Export the user and group information from the source server:
getent passwd > users.txt
getent group > groups.txt
# 2. Transfer the exported files to the destination server:
scp users.txt groups.txt user@destination_server:/path/to/destination/
# 3. On the destination server, create users and groups based on the exported files:
--------------------------------------------------------------------------
i stored user list and user acees permission list in file and now i need to copy file to another server
# To copy a file containing a list of users and their access permissions to another server, you can use the following command:
scp /path/to/user_access_list.txt user@destination_server:/path/to/destination/
# Replace "/path/to/user_access_list.txt" with the actual path to your file, "user" with the username, "destination_server" with the target server's hostname or IP address, and "/path/to/destination/" with the target directory.
# This command securely copies the file to the specified destination on the remote server.
---------------------------------------------------------------
there 10 process running in server, how do we nedd process in script
# To check if a specific process is running on the server and take action based on that, you can use the following script:
#!/bin/bash
# Define the process name
process_name="your_process_name"
# Check if the process is running
if pgrep "$process_name" > /dev/null; then
    echo "$process_name is running."
else
    echo "$process_name is not running."