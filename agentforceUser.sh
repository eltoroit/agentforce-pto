#!/bin/bash
echo "HELLO"
date
ORG_ID=$(jq -r '.user.orgId' ./etLogs/_user.json)
AGENT_USERNAME="agent001@${ORG_ID}.ext"
echo ${AGENT_USERNAME} > ./etReplacements/AGENT_USERNAME.txt