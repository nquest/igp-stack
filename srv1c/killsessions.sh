#!/bin/bash
cluster_list=$(/opt/1cv8/x86_64/$SERVER_VERSION/rac cluster list  | grep 'cluster '| awk -F' ' '{print $3}')
session_list=$(/opt/1cv8/x86_64/$SERVER_VERSION/rac session list --cluster=$cluster_list | grep 'session '| awk -F' ' '{print $3}')
echo 'Cluster ' $cluster_list
echo 'Sessions' $session_list
for session in $session_list
do
opt/1cv8/x86_64/$SERVER_VERSION/rac session  --cluster=$cluster_list terminate --session=$session_list
done