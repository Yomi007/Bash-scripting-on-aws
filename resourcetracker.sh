#!/bin/bash
#
###############
# Author :Yomi
# Time : 14th of Sept, 2024
# Version : V 1.0
#
# This script will report AWS resource usage
##############

## tracking the following
# AWS S3
# AWS EC2
# AWS LAMBDA
# AWS IAMUSERS
 set -x
# list s3 buckets
echo "print list of s3 buckets"
aws s3 ls

# list ec2 instances
echo "print ec2 instance"
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId, InstanceType, LaunchTime]' --output table


# list aws lambda functions
echo "print lambda functions"
aws lambda list-functions --query 'Functions[*].[FunctionName, Runtime]' --output table


#List IAM users
echo "print iam users"
aws iam list-users --query 'Users[*].[UserName, CreateDate]' --output table




