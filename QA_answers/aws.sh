how to create password less connection from one server to another server
#step 1: create ssh key
ssh-keygen -t rsa
#this will create a public key and private key
#this key will be created in /home/ec2-user/.ssh/id_rsa.pub
step 2: copy the public key and paste into server two
cd /home/ec2-user/.ssh/authorized_keys
ssh-copy-id -i ~/.ssh/id_rsa.pub ec2-user@<remote-server-ip>
we check the connection 
ssh ec2-user@<server2-ip>
-------------------------------------------------------------------------
how to copy files from one server to another server
scp ec2-user@server1:/home/ec2-user/test.txt ec2-user@server2:/home/ec2-user/
or we can use rsync command
rsync -avz ec2-user@server1:/home/ec2-user/test.txt ec2-user@server2:/home/ec2-user/
#-avz : archive mode, verbose mode, compress mode
------------------------------------------------------------------------
differen between scp and rsync
scp: it is used to copy files from one server to another server
rsync: it is used to synchronize files from one server to another server
#synchronize means it will copy only the changed files from one server to another server.
#rsync is faster than scp
#progress display is avalable in rsync
#file permission and ownership is preserved in rsync
----------------------------------------------------------------------
how to compress files
tar -czvf test.tar.gz test.txt
#-c : create a tar file
#-z : compress the tar file
#-v : verbose mode
#-f : file name
to extract the tar file
tar -xzvf test.tar.gz
#-x : extract the tar file
#-z : decompress the tar file
#-v : verbose mode
#-f : file name
#to extract the tar file
tar -xvf test.tar
---------------------------------------------------------
what is AMI ( Amazon Machine Image)
#it is used to create a backup of the ec2 instance & used to create a virtual servers (ec2 instances) in aws.
#it contains the operating system, application server, and applications.
#it contains permission and security settings. (IAM roles, security groups, etc)
USE CASES:
#1. create a backup of the ec2 instance.
#2. create a new ec2 instance with the same configuration.
#3. restore the ec2 instance from the AMI backup.
----------------------------------------------------------
How to create coustome AMI?
#1. login to the AWS console
#2. go to EC2 dashboard ---> Instance
#3. select the instance want to create an AMI from
#4. click on actions ---> image and templates ---> create image
#5. enter the image name and description
#6. click on create image
#7. go to AMI section in the EC2 dashboard
#8. select the coustome AMI and click on launch instance from image
#9. configure only ec2 instance details and click on launch instance(security group and key pair)
#10. select the existing security group and key pair
#11. click on launch instance
-------------------------------------------------------------
what is EBS (Elastic Block Store)
#it is a block level storage used to store data in AWS.
#it is used to store data for EC2 instances., RDS, and other AWS services.
#it is just like virtual hard disk that we attach to the EC2 instance.
#data remains same even if the instance is stopped or terminated.
#ebs volumes are easily scalable and can be resized as per the requirement.
--------------------------------------------------------------
Attaching EBS volume to EC2 instance
#1. create an EBS volume in same availability zone as the EC2 instance.
#2. go to EC2 dashboard ---> volumes
#3. select the EBS volume and click on actions ---> attach volume
#4. select the instance to attach the volume
#5. click on attach volume
#6. login to the EC2 instance
#7. check the attached volume using lsblk command
#8. create a file system on the attached volume using mkfs command
sudo mkfs -t ext4 /dev/xvdf
#9. mount the volume to the instance using mount command
mount /dev/xvdf /mnt
#10. check the mounted volume using df -h command
#11. to unmount the volume use umount command
#12. to detach the volume use umount command
#13. to delete the volume use delete command
#14. to create a snapshot of the volume use create snapshot command
#15. to create a backup of the volume use create backup command
----------------------------------------------------------------------
what is snapshot?
#it is a backup of the EBS volume.
#it is used to create a backup of the EBS volume.
#it is used to create a new EBS volume from the snapshot.
-----------------------------------------------------------------------
what is security group?
#it is a virtual firewall used to control the inbound and outbound traffic to the EC2 instance.
inbound ( what is coming to the instance ssh-22, http-80 ) 
outbound ( what is going out from the instance hhtps-443, http-80)
-----------------------------------------------------------
what is elastic IP?
#it is a static IP address used to connect to the EC2 instance.
#it keeps the same IP address even if the instance is stopped or terminated.
--------------------------------------------------------
what is load balancer?
#it is used to distribute the incoming traffic to multiple EC2 instances.
1. to improve the performance and availability of the application.
2. to ensure scalability
3. prevent overloading of a single instance

Types of load balancer:
1. Application load balancer (ALB):
layer 7 load balancer
# it is used to distribute the incoming traffic to multiple EC2 instances based on the application layer (HTTP/HTTPS).
#supports round robin, load based algorithm, and sticky sessions.
Health checks : it sends request to the target group and checks their status.

2. Network load balancer (NLB):
# it is used to distribute the incoming traffic to multiple EC2 instances based on the network layer (TCP/UDP).
fourth layer load balancer

3. Gateway load balancer (GWLB):
3rd layer load balancer
Network layer (third party application)
-----------------------------------------------------------------------------
sticky sessions:
# it is used to bind the user session to a specific instance.
example:
# when a user logs in to the application, the load balancer binds the user session to a specific instance.
# when the user logs out, the load balancer unbinds the user session from the instance.
-----------------------------------------------------------
how to config load balancer? using Application load balancer (ALB)
i will create a file index.html in the /var/www/html/ directory
in security group i will allow http 80
#1. login to the AWS console
#2. go to EC2 dashboard ---> create target group
#3. select the target type as instance
#4. select the protocol as http
#5. select the port as 80
#6. select the ec2 instance
Click “Include as pending below”
#10. create the target group
after creating the target group, we will create a load balancer
#11. go to EC2 dashboard ---> load balancer
#12. fill - name --> sagar
scheme --> internet facing
ip address type --> ipv4
listener --> http
select 2 or 3 availability zones

step3: configure security groups
allow http 80
step4: attach target group to listener
#13. select the target group created earlier
in list configurations ---> select the target group
#14. click on create load balancer
#15. go to load balancer and select the load balancer created
#16. copy the DNS name and paste it in the browser or curl http://localhost
#17. check the health status of the target group
-----------------------------------------------------------
how to config load balancer? using network load balancer (NLB)
#1. login to the AWS console
#2. go to EC2 dashboard ---> create target group
#3. select the target type as instance
#4. select the protocol as tcp
#5. select the port as 80
#6. select the ec2 instance
#7. select the health check protocol as tcp
#8. select the health check port as 80
#9. create the target group
#10. go to EC2 dashboard ---> load balancer
#11. fill - name --> sagar
scheme --> internet facing
ip address type --> ipv4
listener --> tcp
select 2 or 3 availability zones
step3: configure security groups
allow http 80
step4: attach target group to listener
#12. select the target group created earlier
in list configurations ---> select the target group
#13. click on create load balancer
#14. go to load balancer and select the load balancer created
#15. copy the DNS name and paste it in the browser or curl http://localhost
#16. check the health status of the target group
-----------------------------------------------------------
types of ec2 inwtances
general purpose #we use this instance for all purpose example: web server, database server, application server
#1. t2.micro
#2. t2.small
#3. t2.medium
compute optimized #we use this instance for compute purpose example: web server
#1. c5.large
#2. c5.xlarge
memory optimized #we use this instance for memory purpose example: database server
#1. r5.large
#2. r5.xlarge
storage optimized #we use this instance for storage purpose example: data warehouse, big data
#1. i3.large
#2. i3.xlarge
accelerated computing #we use this instance for machine learning, deep learning, and graphics processing
#1. p3.2xlarge
#2. p3.8xlarge
-----------------------------------------------------------
Types of EC2 Purchase Options
1. On-Demand Instances
# pay for the compute capacity by the hour or second (depending on which instances you run) with no long-term contracts or complex licensing.
# you pay for what you use when you use it.
2. Reserved Instances
# reserve capacity for a one-year or three-year term and save up to 75% over equivalent on-demand capacity.
3. Spot Instances
# purchase spare compute capacity at reduced rates (up to 90% off the on-demand price).
4. Savings Plans
# flexible pricing model that provides significant savings on specified usage (measured in $/hr) in exchange for a commitment to use a specific amount of compute power for a one- or three-year term.
5. Dedicated Hosts
# physical servers dedicated for your use.
-------------------------------------------------------------
how to server backup?
how to take ebs volume backup?
#1. login to the AWS console
#2. go to EC2 dashboard ---> volumes
#3. select the ebs volume to take backup
#4. click on actions ---> create snapshot
#5. enter the snapshot name and description
#6. click on create snapshot
#7. go to snapshots section in the EC2 dashboard
#8. select the snapshot and click on create volume
#9. select the availability zone and click on create volume
#10. go to volumes section in the EC2 dashboard
#11. select the volume and click on attach volume
#12. select the instance to attach the volume
#13. click on attach volume 
#14. login to the EC2 instance
#15. check the attached volume using lsblk command
-----------------------------------------------------------------------------
i want to install when server is creating
#1. login to the AWS console
#2. go to EC2 dashboard ---> launch instance
#3. select the AMI and instance type
#4. configure instance details
#6. select the user data
#7. enter the user data script
#8. click on launch instance
--------------------------------------------------------------
user data do?
#1. it is used to run the script when the instance is launched.
#2. it is used to install the software when the instance is launched.
example:
#!/bin/bash 
yum install httpd -y
yum install git -y
----------------------------------------------------------
how do we extend ebs volume?
#1. login to the AWS console
#2. go to EC2 dashboard ---> volumes
#3. select the ebs volume to extend
#4. click on actions ---> modify volume
#5. enter the new size of the volume
#6. click on modify volume
#7. go to EC2 dashboard ---> instances
#8. select the instance and click on actions ---> instance settings ---> get system log
#9. check the new size of the volume
#10. login to the EC2 instance
#11. check the attached volume using lsblk command
--------------------------------------------------------------------
how do we change t2.micro to t2.large?
#1. login to the AWS console
#2. go to EC2 dashboard ---> instances
#3. select the instance to change the type
#4. click on actions ---> instance settings ---> change instance type
#5. select the instance type as t2.large
#6. click on apply
------------------------------------------------------------
what is ami?
ami is taking backup of the ec2 instance
------------------------------------------------------------
how to set load balancer based on header data in url?
#1. login to the AWS console
#2. go to EC2 dashboard ---> load balancer
#3. select the load balancer and click on listeners
#4. click on view/edit rules
#5. click on add rule
#6. select the condition as http header
#7. enter the header name and value #name is website_one and volue is v1
#8. select the target group
#9. click on save
#10. go to load balancer and select the load balancer created
#11. copy the DNS name and paste it in the browser or curl -H "website_one: v1" http://demo-09-1753182406.us-east-1.elb.amazonaws.com/
#12. check the health status of the target group
#13. check the header data in the url
#14. check the target group health status
-----------------------------------------------------------
What is the difference between a Network Load Balancer (NLB) and an Application Load Balancer (ALB)?