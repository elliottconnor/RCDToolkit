#!/bin/bash


aws cloudformation create-stack --stack-name RCDCFRStack \
--template-body file://RCDToolkit/CloudFormer/CloudFormerCFT.json \
--parameters file://RCDToolkit/CloudFormer/CloudFormerParams.json

aws cloudformation stack-create-complete --stack-name RCDCFRStack

xvar=$(aws cloudformation describe-stacks --stack-name RCDCFRStack | jq '.Stacks.Outputs.PublicDNS' )
echo -n "CloudFormer Launch is complete.  Enter the following url in to your browser:"
echo -n $xvar
