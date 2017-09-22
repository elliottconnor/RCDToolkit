#!/bin/bash
echo "Begin ConfigDB launch enter your username and password"

aws cloudformation create-stack --stack-name ConfigDBStack --template-body file://RCDToolkit/ConfigDB/ConfigDBCFT.json

aws cloudformation stack-create-complete --stack-name ConfigDBStack

xvar=$(aws cloudformation describe-stacks --stack-name ConfigDBStack | jq '.Stacks.Outputs.TableARN' )


destdir=/RCDToolkit/ConfigDB/ConfigDBARN

if [ -f "$destdir" ]
then 
    echo "$xvar" > "$destdir"
fi

echo -n "ConfigDB launch is complete.  ConfigDB ARN is as follows:  "
echo -n $xvar