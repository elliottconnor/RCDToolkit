# RCDToolkit
Rapid Cloud Deployment Toolkit

Available Templates

RCDFactory
-Cloudformation Template
-Creates an ec2 instance on the AWS account
-Populates it with the remaining scripts and templates on this github
-Run aws configure before starting remainder of initialization

RCDinit
-Run this after configuration
-Creates a DynamoDB table for maintaining configuration details
-Creates a Lambda function for updating DynamoDB

CloudFormer
-Can be used to transform existing resources in to CFTs
-Script will call the template and output the connection URL
