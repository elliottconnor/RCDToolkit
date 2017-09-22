#!/bin/bash
echo "Begin CloudFormer Launch enter your username and password"
echo -n "Enter your username and press [ENTER]: "
read CFRusername
echo -n "Enter your password and press [ENTER]: "
read CFRpassword

aws cloudformation create-stack --stack-name RCDCFRStack --template-body file://RCDToolkit/CloudFormer/CloudFormerCFT.json --parameters ParameterKey="Username",ParameterValue=CFRusername ParameterKey="Password",ParameterValue=CFRpassword ParameterKey="VPCSelection",ParameterValue="CreateNewVPC"

aws cloudformation stack-create-complete --stack-name RCDCFRStack

xvar=$(aws cloudformation describe-stacks --stack-name RCDCFRStack | jq '.Stacks.Outputs.PublicDNS' )
echo -n "CloudFormer Launch is complete.  Enter the following url in to your browser:"
echo -n $xvar
