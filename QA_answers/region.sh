⁠#write a script to get the EC2 and s3 details from aws account  in Us-east-1 region in a file.

#!/bin/bash

# Define the output file
OUTPUT_FILE="aws_resources_details.txt"

# Set the AWS region
AWS_REGION="us-east-1"

# Get EC2 instance details
echo "Fetching EC2 instance details..." > $OUTPUT_FILE
aws ec2 describe-instances --region $AWS_REGION --query "Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,PublicIpAddress]" --output table >> $OUTPUT_FILE

# Add a separator
echo -e "\n----------------------------------------\n" >> $OUTPUT_FILE

# Get S3 bucket details
echo "Fetching S3 bucket details..." >> $OUTPUT_FILE
aws s3api list-buckets --query "Buckets[*].[Name,CreationDate]" --output table >> $OUTPUT_FILE

echo "Details saved to $OUTPUT_FILE"

